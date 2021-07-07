package dev.department.subscribe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.BrandService;
import dev.department.subscribe.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private ResourceLoader resourceLoader;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication authentication) throws IOException {
		int memNo = 0;
		log.info("시작!!!");
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			memNo = sMember.getNo();
			
			try {
				ArrayList<BrandDTO> branSubsList = memberService.getBranSubsList(memNo);
				Collections.shuffle(branSubsList);
				model.addAttribute("branSubsList", branSubsList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		try {
			log.info("시도!!!");
			ArrayList<BrandNewsDTO> newsList = brandService.brandNewsList();
			for (int i = 0; i < newsList.size(); i++) {
				log.info(newsList.get(i).getUploaddate() + ":date");
			}
			
			model.addAttribute("newsList", newsList);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
		return "home/index";
	}

}