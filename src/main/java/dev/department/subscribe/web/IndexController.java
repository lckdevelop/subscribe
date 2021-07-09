package dev.department.subscribe.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/index")
//	public String index() {
//		return "home/index";
//	}
	
	// 로그인 창
	@RequestMapping("/login")
	public String loginPage() {
		return "home/login";
	}
	
	// 회원가입 창
	@GetMapping("/signup")
	public String signupPage() {
		return "home/signup";
	}
	
	// 회원가입 진행
	@PostMapping("/signaction")
	public String signAction(@ModelAttribute MemberDTO memberDTO) {
		log.info("여기옴?");
		try {
			memberService.memberJoin(memberDTO);
		} catch (Exception e) {
			e.getMessage();
		}
		return "home/index";
	}
	
	// 아이디 중복 체크
	@PostMapping(value="/idcheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicateCheck(@RequestParam String id) {
		log.info(id);
		
		boolean idDuplBool = false;
		String idDuplStr = null;
		
		try {
			idDuplBool = memberService.idDuplicateCheck(id);
			log.info(idDuplBool + "");
		} catch (Exception e) {
			e.getMessage();
		}
		
		if (idDuplBool == true) {
			idDuplStr = "not_usable";
		} else {
			idDuplStr = "usable";
		}
		
		return idDuplStr;
	}
	
	// 심플 구독
	@GetMapping(value="/simplesubs/{brandNo}/{subsed}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String simpleSubsAction(@PathVariable int brandNo, @PathVariable int subsed,
									Authentication authentication) {
		int memberNo = 0;
		
		String result = "실패";
		log.info(brandNo + ": brandNo");
		log.info(subsed + ": subsed");
		
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			memberNo = sMember.getNo();
		}
		
		try {
			result = memberService.brandSubsAction(brandNo, subsed, memberNo);
		} catch (Exception e) {
			e.getMessage();
		}
		
		return result;
	}
	
		
	
	@GetMapping("/admin/hi")
	public String adminTest() {
		return "home/adminMain";
	}
	
	@GetMapping("/manager/hi")
	public String managerTest() {
		return "home/managerMain";
	}
	
	@GetMapping("/logintest")
	public String loginTest() {
		return "home/loginTest";
	}
	
	@GetMapping("admin/usermanager/main")
	public String goAdmin() {
		return "home/adminMain";
	}
	
	@GetMapping("member/main")
	public String goAdmin2() {
		return "home/adminMain";
	}
	
	// 여기부터
	@RequestMapping("/admin/usermanager/main")
	public String home() {
		return "sec_view2/usermanagerMain";
	}

	@RequestMapping("/member/main")
	public String manager() {
		return "sec_view2/memberMain";
	}
	
	@RequestMapping("/loginAction")
	public String loginAction(Model model, HttpServletRequest req) {
		log.info(req.getParameter("pass"));
		log.info("여기 오나?");
		return "home/index";
	}
	
//	@GetMapping("/logoutAction")
//	public String logoutPage() {
//		return "home/index";
//	}
	
}
