package dev.department.subscribe.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.CouponDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.MailFormDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.PickupListDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;
import dev.department.subscribe.dto.SalesParamDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.BrandService;
import dev.department.subscribe.service.CouponService;
import dev.department.subscribe.service.MailService;
import dev.department.subscribe.service.PickupService;
import dev.department.subscribe.service.ReserveService;
import dev.department.subscribe.service.SalesService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin")
public class AdminController {
	
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
	
	@GetMapping("")
	public String adminMain() {
		return "redirect:admin/";
	}
	
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
			
			int subsCnt = mailService.getSubsCount(brandNo);
			int reserveCnt = reserveService.getTodayReserveCnt(new ReserveCntParamDTO("", brandNo, storeNo));
			int pickupCnt = pickupService.getTodayPickupCnt(new ReserveCntParamDTO("", brandNo, storeNo));
			int todayCnt = reserveCnt + pickupCnt;
			int monthlyEarn = salesService.getMothlyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			int dailyEarn = salesService.getDailyEarn(new SalesParamDTO(brandNo, storeNo, new Date()));
			
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
			int subsCnt = mailService.getSubsCount(brandNo);
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
			
		} catch (MessagingException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);
		} catch (UnsupportedEncodingException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);		
		} catch(RuntimeException e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("errmsg", "전송 가능한 구독자가 없습니다!");
			model.addAttribute("sendFlag", sendFlag);
		} catch (Exception e) {
			log.warn(e.getMessage());
			sendFlag = false;
			model.addAttribute("sendFlag", sendFlag);
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
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			reserveService.permitReserve(new ReservePermitDTO(no, brandNo, storeNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
	}
	
	// 예약 거부하기
	@GetMapping("/reserve/refuse")
	@ResponseBody
	public void reserveRefuse(@RequestParam("no") int no, Authentication authentication) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		try {
			reserveService.refuseReserve(new ReservePermitDTO(no, brandNo, storeNo));
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
	public String pickup(Authentication authentication) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
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
			model.addAttribute("brand", brandDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/coupon";
	}
	
	// 쿠폰 발급 완료 페이지
	@PostMapping("/coupon")
	public String couponComplete(Authentication authentication, CouponDTO couponDTO, Model model) {
		
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		
		log.info(couponDTO.toString());
		log.info(couponDTO.getTitle());
		log.info(couponDTO.getType() + " ");
		
		
		try {
			couponService.insertCoupon(couponDTO, brandNo);
			
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

}
