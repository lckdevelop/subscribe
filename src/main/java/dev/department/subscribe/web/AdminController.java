package dev.department.subscribe.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.CouponDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.MailFormDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.PickupListDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.ReservationDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;
import dev.department.subscribe.dto.SalesParamDTO;
import dev.department.subscribe.dto.SubsBoardDTO;
import dev.department.subscribe.dto.SubsBoardProDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.BrandService;
import dev.department.subscribe.service.CouponService;
import dev.department.subscribe.service.MailService;
import dev.department.subscribe.service.PickupService;
import dev.department.subscribe.service.ProductService;
import dev.department.subscribe.service.ReserveService;
import dev.department.subscribe.service.SalesService;
import dev.department.subscribe.service.SubsBoardProService;
import dev.department.subscribe.service.SubsBoardService;
import dev.department.subscribe.util.S3Utils;
import dev.department.subscribe.validator.CouponValidator;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;

@Slf4j
@Controller
@RequestMapping("admin")
public class AdminController {
	
	S3Utils s3 = new S3Utils();
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private PickupService pickupService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SubsBoardService subsBoardService;
	
	@Autowired
	private SubsBoardProService subsBoardProService;
	
	@GetMapping("")
	public String adminMain() {
		return "redirect:admin/";
	}
	
	@Value("${api_key}")
	private String api_key;
	
	@Value("${api_secret}")
	private String api_secret;
	
	// 관리자 대쉬보드
	@GetMapping("/")
	public String adminMain(Authentication authentication, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			int subsCnt = mailService.getSubsCount(brandNo);
			int reserveCnt = reserveService.getTodayReserveCnt(new ReserveCntParamDTO("", brandNo, storeNo));
			int pickupCnt = pickupService.getTodayPickupCnt(new ReserveCntParamDTO("", brandNo, storeNo));
			int todayCnt = reserveCnt + pickupCnt;
			int monthlyEarn = salesService.getMothlyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			int dailyEarn = salesService.getDailyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			
			model.addAttribute("brandInfo", brandInfo);
			model.addAttribute("monthlyEarn", monthlyEarn);
			model.addAttribute("dailyEarn", dailyEarn);
			model.addAttribute("subsCnt", subsCnt);
			model.addAttribute("todayCnt", todayCnt);
			
		} catch(Exception e) {
			e.printStackTrace();
			log.warn(e.getMessage());
		}
		
		return "admin/admin-main";
	}
	
	// 메일 작성 폼 이동
	@GetMapping("/mailform")
	public String mailForm(Authentication authentication, Model model) {
		
		int brandNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			int subsCnt = mailService.getSubsCount(brandNo);
			
			model.addAttribute("brandInfo", brandInfo);
			model.addAttribute("subsCnt", subsCnt);
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/mailform";
	}
	
	// 메일 전송
	@PostMapping("mailform")
	public String mailForm(Authentication authentication, MailFormDTO mailInput, Model model) {
		
		MimeMessage message = mailSender.createMimeMessage();
		boolean sendFlag = true;
		
		int brandNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		BrandDTO brandInfo;
		try {
			brandInfo = brandService.getBrandInfo(brandNo);
		} catch (Exception e1) {
			brandInfo = null;
		}
		try {
			ArrayList<MemberDTO> receiverInfo = new ArrayList<>();
			receiverInfo = mailService.getReceiverInfo(brandNo); // 수신자 정보 가져오기
			int receiverCnt = receiverInfo.size();
			InternetAddress[] address = new InternetAddress[receiverCnt];
			
			// 다중 수신자 설정
			for (int i = 0; i < receiverCnt; i++) {
				address[i] = new InternetAddress(receiverInfo.get(i).getEmail(), receiverInfo.get(i).getName(), "UTF-8");
			}
			
			message.setSubject(mailInput.getSubject(), "UTF-8"); // 제목 작성
			String htmlStr = mailInput.getContent(); // 내용 작성
			message.setText(htmlStr, "UTF-8", "html"); // 인코딩
			message.setRecipients(RecipientType.CC, address); // 수신자 지정
			mailSender.send(message);
			model.addAttribute("sendFlag", sendFlag);
			model.addAttribute("brandInfo", brandInfo);
			
		} catch (MessagingException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);
			model.addAttribute("brandInfo", brandInfo);
		} catch (UnsupportedEncodingException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);		
			model.addAttribute("brandInfo", brandInfo);
		} catch(RuntimeException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("errmsg", "전송 가능한 구독자가 없습니다!");
			model.addAttribute("sendFlag", sendFlag);
			model.addAttribute("brandInfo", brandInfo);
		} catch (Exception e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);
			model.addAttribute("brandInfo", brandInfo);
		}
		
		return "admin/mailsendcomplete";
	}
	
	// 예약 관리 메인페이지 이동
	@GetMapping("/reserve")
	public String reserve(Authentication authentication, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			model.addAttribute("brandInfo", brandInfo);
		} catch(Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/reserve";
	}
	
	// 예약자 목록에서 검색
	@PostMapping("/reserve")
	public String reserve(Authentication authentication, HttpServletRequest request, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			model.addAttribute("brandInfo", brandInfo);
		} catch(Exception e) {
			log.warn(e.getMessage());
		}
				
		model.addAttribute("search", (String) request.getParameter("search"));
		
		return "admin/reserve";
	}
	

	// 미승인된 매장 방문 예약 AJAX
	@GetMapping("/reserve/getUnpermittedVisitList")
	@ResponseBody
	public PagingDTO getUnpermittedVisitList(Authentication authentication,
														@RequestParam("pg") int pg,
														@RequestParam("search") String search) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int unpremittedVisitCnt = reserveService.getUnpremittedVisitCnt(new ReserveCntParamDTO(search, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 5, 5, unpremittedVisitCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = reserveService.getUnpermittedVisitList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}
	
	// 전체 예약 목록 AJAX
	@GetMapping("/reserve/getReserveList")
	@ResponseBody
	public PagingDTO getReserveList(Authentication authentication,
									@RequestParam("pg") int pg,
									@RequestParam("search") String search) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int reserveCnt = reserveService.getReserveCnt(new ReserveCntParamDTO(search, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 5, 5, reserveCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = reserveService.getReserveList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}
	
	// 금일 예약 목록 AJAX
	@GetMapping("/reserve/getTodayReserveList")
	@ResponseBody
	public PagingDTO getTodayReserveList(Authentication authentication,
									@RequestParam("pg") int pg,
									@RequestParam("search") String search) {
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int todayReserveCnt = reserveService.getTodayReserveCnt(new ReserveCntParamDTO(search, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 5, 5, todayReserveCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = reserveService.getTodayReserveList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}
	
	// 예약 확정하기
	@GetMapping("/reserve/permit")
	@ResponseBody
	public void reservePermit(@RequestParam("no") int no, Authentication authentication) {
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			reserveService.permitReserve(new ReservePermitDTO(no, brandNo, storeNo));
			
			ReservationDTO reservationDTO = reserveService.getReserveInfo(no);
			
			String text = reservationDTO.getMemberName() + "님의 예약이 확정되었습니다.\n"
			            + "예약 지점 : " + reservationDTO.getBrandName() + " " + reservationDTO.getStoreName() + "점\n" 
					    + "예약 일시 : " + reservationDTO.getReserveDate() + "\n" 
			            + "저희 " + reservationDTO.getBrandName() + "을(를) 이용해 주셔서 감사합니다.";
			set.put("to", reservationDTO.getPhone().replace("-", ""));
			set.put("from", "01056575293");
			set.put("text", text);
			set.put("type", "sms");
			
			JSONObject obj = (JSONObject) coolsms.send(set);
			
		} catch(Exception e) {
			log.warn(e.getMessage());
		}
		
	}
	
	// 예약 거부하기
	@GetMapping("/reserve/refuse")
	@ResponseBody
	public void reserveRefuse(@RequestParam("no") int no, Authentication authentication) {
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			reserveService.refuseReserve(new ReservePermitDTO(no, brandNo, storeNo));
			
			ReservationDTO reservationDTO = reserveService.getReserveInfo(no);
			
			String text = "죄송합니다. 매장 사정으로 예약이 불가능합니다. 다른 시간을 예약해주세요.";
			set.put("to", reservationDTO.getPhone().replace("-", ""));
			set.put("from", "01056575293");
			set.put("text", text);
			set.put("type", "sms");
			
			JSONObject obj = (JSONObject) coolsms.send(set);
			
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	// 방문 완료 확인
	@GetMapping("/reserve/visit")
	@ResponseBody
	public void reserveVisit(@RequestParam("no") int no, Authentication authentication) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			reserveService.reserveVisit(new ReservePermitDTO(no, brandNo, storeNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	// 코디 등록 폼 이동
		@GetMapping("/registerstyle")
		public String registerStyle(Authentication authentication, Model model) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			try {
				ArrayList<ProductDTO> products = productService.getAllProducts(sMember.getBrandNo());
				model.addAttribute("productInfo", products);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "admin/registerstyle";
		}
		
	// 코디 등록
		@ResponseBody
		@RequestMapping(value = "/registerstyle/insert", method= RequestMethod.POST, headers = ("content-type=multipart/*"))
		public String insertSubsboard(
				@RequestParam("title") String title, 
				@RequestParam("content") String content,
				@RequestParam("checkedProduct") String[] checkedProduct,
				@RequestParam("thumbnail") MultipartFile imgfile,
				Authentication authentication, Model model) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			
			log.info(title);
			log.info(content);
			log.info(checkedProduct[0]);
			log.info(checkedProduct[1]);
			log.info(imgfile.getOriginalFilename());
			SubsBoardDTO sbDTO = new SubsBoardDTO();
			sbDTO.setTitle(title);
			sbDTO.setContent(content);
			sbDTO.setThumbnail(imgfile.getOriginalFilename());
			sbDTO.setBrandNo(sMember.getBrandNo());
			sbDTO.setStoreNo(sMember.getStoreNo());
			byte[] byteimg;
			
			try {
				subsBoardService.insertSubsBoard(sbDTO);
				int subsBoardProNo=sbDTO.getContentSeq();
				
				for(String productNo : checkedProduct) {
					SubsBoardProDTO sbpDTO = new SubsBoardProDTO();
					sbpDTO.setProductNo(Integer.parseInt(productNo));
					sbpDTO.setSubscribeBoardNo(subsBoardProNo);
					subsBoardProService.insertSubsBoardPro(sbpDTO);
				}
				byteimg = imgfile.getBytes();
				s3.fileUpload("subscribe/coordi", imgfile.getOriginalFilename(), byteimg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return "admin/registerstyle";
		}
		
	// 방문예약 FullCalendar 이벤트 띄우기
	@GetMapping("/reserve/getCalendarData")
	@ResponseBody
	public List<FullCalendarDTO> getCalendarData(@RequestParam("date") String date, Authentication authentication) {

		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<FullCalendarDTO> list = new ArrayList<>();
		
		try {
			list = reserveService.getCalendarData(new CalendarParamDTO(date, brandNo, storeNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 픽업 관리 페이지
	@RequestMapping("/pickup")
	public String pickup(Authentication authentication, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			model.addAttribute("brandInfo", brandInfo);
		} catch(Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/pickup";
	}
	
	// 금일 픽업 목록 AJAX
	@GetMapping("/reserve/getTodayPickupList")
	@ResponseBody
	public PagingDTO getTodayPickupList(Authentication authentication,
									@RequestParam("pg") int pg) {
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<PickupListDTO> pickupList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int todayPickupCnt = pickupService.getTodayPickupCnt(new ReserveCntParamDTO(null, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 5, 5, todayPickupCnt);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = pickupService.getTodayPickupList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}
	
	// 전체 픽업 목록 AJAX
	@GetMapping("/reserve/getPickupList")
	@ResponseBody
	public PagingDTO getPickupList(Authentication authentication,
									@RequestParam("pg") int pg) {
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<PickupListDTO> pickupList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int pickupCnt = pickupService.getPickupCnt(new ReserveCntParamDTO(null, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 5, 5, pickupCnt);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = pickupService.getPickupList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}
	
	// 픽업 수령 확정하기
	@GetMapping("/reserve/pickuppermit")
	@ResponseBody
	public void pickupPermit(@RequestParam("no") int no, Authentication authentication) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			pickupService.pickupPermit(new ReservePermitDTO(no, brandNo, storeNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
	}
	
	// 픽업수령 FullCalendar 이벤트 띄우기
	@GetMapping("/reserve/getPickupCalendarData")
	@ResponseBody
	public List<FullCalendarDTO> getPickupCalendarData(@RequestParam("date") String date, Authentication authentication) {

		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<FullCalendarDTO> list = new ArrayList<>();
		
		try {
			list = pickupService.getPickupCalendarData(new CalendarParamDTO(date, brandNo, storeNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 쿠폰 관리 페이지
	@GetMapping("/coupon")
	public String coupon(Authentication authentication, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			int subsCnt = mailService.getSubsCount(brandNo);
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			model.addAttribute("subsCnt", subsCnt);
			model.addAttribute("brandInfo", brandDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/coupon";
	}
	
	// 쿠폰 발급 완료 페이지
	@PostMapping("/coupon")
	public String couponComplete(Authentication authentication, CouponDTO couponDTO, Model model, BindingResult result) {
		
		CouponValidator validator = new CouponValidator();
		validator.validate(couponDTO, result);
		
		if (result.hasErrors()) {
			log.warn(result.getErrorCount() + "개의 에러 발생");
			model.addAttribute("errMsg", "입력이 잘못되었습니다!.\n 쿠폰 발급 양식을 잘 확인해주세요");
			return "admin/coupon-complete";
		}
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			couponService.insertCoupon(couponDTO, brandNo);
			model.addAttribute("brandInfo", brandInfo);
			
		} catch (Exception e) {
			log.warn(e.getMessage());
			model.addAttribute("errMsg", "쿠폰 발급 에러!");
		}
		
		return "admin/coupon-complete";
	}
	
	// 최근 12달 날짜 가져오기
	@GetMapping("/reserve/getCurrentTwelveMonth")
	@ResponseBody
	public List<String> getCurrentTwelveMonth() {

		List<String> list = new ArrayList<>();
		
		try {
			list = salesService.getCurrentTwelveMonth();
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 최근 12달 판매실적 가져오기
	@GetMapping("/reserve/getAnnualEarnData")
	@ResponseBody
	public List<Integer> getAnnualEarnData(Authentication authentication) {

		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<Integer> list = new ArrayList<>();
		
		try {
			list = salesService.getAnnualEarnData(new SalesParamDTO(brandNo, storeNo, null));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 구독자 연령대 분포 데이터 가져오기
	@GetMapping("/reserve/getSubsDistribution")
	@ResponseBody
	public List<Integer> getSubsDistribution(Authentication authentication) {

		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<Integer> list = new ArrayList<>();
		
		try {
			list = salesService.getSubsDistribution(new SalesParamDTO(brandNo, storeNo, null));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 매출관리 페이지 이동
	@GetMapping("/sales")
	public String sales(Authentication authentication, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			BrandDTO brandInfo = brandService.getBrandInfo(brandNo);
			int monthlyEarn = salesService.getMothlyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			int dailyEarn = salesService.getDailyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			int lastMonthEarn = salesService.getLastMonthEarn(new SalesParamDTO(brandNo, storeNo, null));
			int lastDayEarn = salesService.getLastDayEarn(new SalesParamDTO(brandNo, storeNo, null));
			
			model.addAttribute("brandInfo", brandInfo);
			model.addAttribute("monthlyEarn", monthlyEarn);
			model.addAttribute("dailyEarn", dailyEarn);
			model.addAttribute("lastMonthEarn", lastMonthEarn);
			model.addAttribute("lastDayEarn", lastDayEarn);
		} catch(Exception e) {
			log.warn(e.getMessage());
		}
		
		
		return "admin/sales";
	}
	
	// 최근 10일 날짜 가져오기
	@GetMapping("/reserve/getCurrentTenDays")
	@ResponseBody
	public List<String> getCurrentTenDays() {

		List<String> list = new ArrayList<>();
		
		try {
			list = salesService.getCurrentTenDays();
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 최근 10일 판매실적 가져오기
	@GetMapping("/reserve/getDailyEarnData")
	@ResponseBody
	public List<Integer> getDailyEarnData(Authentication authentication) {

		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<Integer> list = new ArrayList<>();
		
		try {
			list = salesService.getDailyEarnData(new SalesParamDTO(brandNo, storeNo, null));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 전체 예약 목록 AJAX
	@GetMapping("/reserve/getAccumList")
	@ResponseBody
	public PagingDTO getAccumList(Authentication authentication,
									@RequestParam("pg") int pg) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int productCnt = salesService.getAccumListCnt(new ReserveCntParamDTO(null, brandNo, storeNo));
			pagingDTO = new PagingDTO(pg, 10, 5, productCnt);
			pagingDTO.setBrandNo(brandNo);
			pagingDTO.setStoreNo(storeNo);
			pagingDTO = salesService.getAccumList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return pagingDTO;
	}

}
