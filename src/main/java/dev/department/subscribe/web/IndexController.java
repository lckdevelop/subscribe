package dev.department.subscribe.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.sec.MemberDetailServieImpl;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.IndexService;
import dev.department.subscribe.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDetailServieImpl memberDetailServieImpl;
	@Autowired
	private IndexService indexService;

	// 로그인 창
	@RequestMapping("/login")
	public String loginPage() {
		return "home/login";
	}

	// 회원가입 창
	@GetMapping("/signup")
	public String signupPage(Model model) {
		File file = new File(getClass().getClassLoader().getResource("kakaoAccess.json").getFile());
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> json = new HashMap<String, String>();
		try {
			json = mapper.readValue(file, new TypeReference<Map<String, String>>() {
			});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//log.info(json.get("appKey") + ": appKey");
		String appKey = json.get("appKey");
		model.addAttribute("appKey", appKey);
		
		return "home/signup";
	}
	
	// 회원가입 진행
	@PostMapping("/signaction")
	public String signAction(@ModelAttribute MemberDTO memberDTO) {
		log.info("여기오나요~??");
		try {
			memberService.memberJoin(memberDTO); // 회원가입
			int memberNo = memberDTO.getMemberSeq();
			memberService.welcomePoint(memberNo); //웰컴포인트
		} catch (Exception e) {
			e.getMessage();
		}
		return "home/index";
	}

	// 아이디 중복 체크
	@PostMapping(value = "/idcheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicateCheck(@RequestParam String id) {
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
	@GetMapping(value = "/simplesubs/{brandNo}/{subsed}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String simpleSubsAction(@PathVariable int brandNo, @PathVariable int subsed, Authentication authentication) {
		int memberNo = 0;

		String result = "실패";
		log.info(brandNo + ": brandNo");
		log.info(subsed + ": subsed");

		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			memberNo = sMember.getNo();
		}

		try {
			result = indexService.brandSubsAction(brandNo, subsed, memberNo);
		} catch (Exception e) {
			e.getMessage();
		}

		return result;
	}

	// 상품 찜
	@GetMapping(value = "/zzimAction/{productNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String simpleSubsAction(@PathVariable int productNo, Authentication authentication) {
		int memberNo = 0;

		String result = "실패";
		log.info(productNo + ": productNo");

		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			memberNo = sMember.getNo();
		}

		try {
			result = indexService.ZzimAction(productNo, memberNo);
		} catch (Exception e) {
			e.getMessage();
		}

		return result;
	}

	// 상품 검색창(링크 오면 수정 필요함)
	@GetMapping("/product/search")
	public String searchProduct(String search, Model model) {
		log.info(search + ": 상품");

		try {
			ArrayList<ProductDTO> searchList = indexService.selectByKeyword(search);
			model.addAttribute("searchList", searchList);
		} catch (Exception e) {
			e.getMessage();
		}

		return "category/cagegoryList"; // 바꿔야 함
	}

	@GetMapping("/signup2")
	public String adminTest() {
		return "home/signup2";
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

	
//	@GetMapping("/loginAction") 
//	public String loginAction(@RequestParam String id, Authentication authentication, Model model) { 
//		SecurityMember securitymember = (SecurityMember) memberDetailServieImpl.loadUserByUsername(id);
//		log.info("여기 옴");
//		model.addAttribute("securitymember", securitymember);
//		model.addAttribute("authentication", authentication);
//			
//		return "home/index"; 
//	}
	

	@PostMapping(value = "/loginAction", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public SecurityMember recharge(@RequestParam String id, Authentication authentication) {
		SecurityMember securitymember = (SecurityMember) memberDetailServieImpl.loadUserByUsername(id);
		log.info(authentication + " ");
		log.info("여기 아닌가요?");
		return securitymember;
	}
	@GetMapping("/logoutAction")
	public String logoutPage() {
		return "home/index";
	}

}
