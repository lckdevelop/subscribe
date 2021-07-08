package dev.department.subscribe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ResourceLoader resourceLoader;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication authentication) throws IOException {
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			int memNo = sMember.getNo();
			
			try {
				ArrayList<BrandDTO> branSubsList = memberService.getBranSubsList(memNo);
				model.addAttribute("branSubsList", branSubsList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "home/index";
	}
	
	// 알림 전송 테스트 폼
	@RequestMapping("alarmtest")
	public String alarmtest(Authentication authentication) {
		int brandNo = 0;
		int storeNo = 0;
		
		if  (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			brandNo = sMember.getBrandNo();
			storeNo = sMember.getStoreNo();
		}
		return "admin/alarmtest";
	}

}