package dev.department.subscribe.web;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import dev.department.subscribe.dto.*;
import dev.department.subscribe.service.*;
import lombok.extern.slf4j.*;

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
	
	@GetMapping("/{brandNo}/")
	public String adminMain(@PathVariable int brandNo) {
		
		
		return "admin/admin-main";
	}
	
	// 메일 작성 폼 이동
	@GetMapping("/{brandNo}/mailform")
	public String mailForm(@PathVariable int brandNo, Model model) {
		
		try {
			int subsCnt = mailService.getSubsCount(brandNo);
			model.addAttribute("subsCnt", subsCnt);
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		
		return "admin/mailform";
	}
	
	// 메일 전송
	@PostMapping("/{brandNo}/mailform")
	public String mailForm(@PathVariable int brandNo, MailFormDTO mailInput, Model model) {
		
		MimeMessage message = mailSender.createMimeMessage();
		boolean sendFlag = true;
		
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
	
	@GetMapping("/{brandNo}/reserve")
	public String reserve(@PathVariable int brandNo, Model model) {
		
		
		return "admin/reserve";
	}
	

	
	@GetMapping("/{brandNo}/reserve/getUnpermittedVisitList")
	@ResponseBody
	public List<ReserveListDTO> getUnpermittedVisitList(@PathVariable int brandNo, 
														@RequestParam("pg") int pg,
														@RequestParam("search") String search) {
		
		List<ReserveListDTO> reserveList = new ArrayList<>();
		
		PagingDTO pagingDTO = new PagingDTO(pg);
		pagingDTO.setSearch(search);
		pagingDTO.setBrandNo(brandNo);
		
		try {
			reserveList = reserveService.getUnpermittedVisitList(pagingDTO);
		} catch (Exception e) {
			log.warn(e.getMessage());
			e.printStackTrace();
		}
		
		return reserveList;
	}

}
