package dev.department.subscribe;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.core.io.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import dev.department.subscribe.dto.*;
import dev.department.subscribe.sec.*;
import dev.department.subscribe.service.*;
import lombok.extern.slf4j.*;

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
			ArrayList<ProductDTO> subsBestList = indexService.getBestSellersFromSubs(memNo);
			ArrayList<ProductDTO> subsNewProList = indexService.getNewProductsFromSubs(memNo);
			ArrayList<ProductDTO> bestList = indexService.getBestSellers();
			ArrayList<ProductDTO> newProList = indexService.getNewProducts();
			
			model.addAttribute("subsBestList", subsBestList);
			model.addAttribute("subsNewProList", subsNewProList);
			model.addAttribute("bestList", bestList);
			model.addAttribute("newProList", newProList);
			
		} catch (Exception e) {
			e.getMessage();
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