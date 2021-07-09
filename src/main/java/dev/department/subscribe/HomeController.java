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
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.IndexService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private ResourceLoader resourceLoader;
	@Autowired
	private IndexService indexService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication authentication) throws IOException {
		int memNo = 0;

		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			memNo = sMember.getNo();
			
			try {
				ArrayList<BrandDTO> branSubsList = indexService.getBranSubsList(memNo);
				Collections.shuffle(branSubsList);
				model.addAttribute("branSubsList", branSubsList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		try {
			ArrayList<BrandNewsDTO> newsList = indexService.brandNewsList();
			model.addAttribute("newsList", newsList);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
		try {
			ArrayList<ProductDTO> bestList = indexService.getBestSellers();			
			ArrayList<ProductDTO> newProList = indexService.getNewProducts();
			
			model.addAttribute("bestList", bestList);
			model.addAttribute("newProList", newProList);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
		return "home/index";
	}

}