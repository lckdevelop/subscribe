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

import dev.department.subscribe.dto.MailFormDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.MailService;
import dev.department.subscribe.service.ReserveService;
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
	
	@GetMapping("")
	public String adminMain() {
		return "redirect:admin/";
	}
	
	@GetMapping("/")
	public String adminMain(Authentication authentication) {
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		return "admin/reserve";
	}
	
	// 예약자 목록에서 검색
	@PostMapping("/reserve")
	public String reserve(Authentication authentication, HttpServletRequest request, Model model) {
		
		int brandNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int unpremittedVisitCnt = reserveService.getUnpremittedVisitCnt(search);
			pagingDTO = new PagingDTO(pg, 5, 5, unpremittedVisitCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int reserveCnt = reserveService.getReserveCnt(search);
			pagingDTO = new PagingDTO(pg, 5, 5, reserveCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = null;
		
		try {
			int todayReserveCnt = reserveService.getTodayReserveCnt(search);
			pagingDTO = new PagingDTO(pg, 5, 5, todayReserveCnt);
			pagingDTO.setSearch(search);
			pagingDTO.setBrandNo(brandNo);
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		try {
			reserveService.permitReserve(new ReservePermitDTO(no, brandNo));
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
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
		}
		
		try {
			reserveService.refuseReserve(new ReservePermitDTO(no, brandNo));
		} catch(Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
	}

}
