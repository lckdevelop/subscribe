package dev.department.subscribe.web;

import java.text.*;
import java.util.*;

import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dev.department.subscribe.dto.*;
import dev.department.subscribe.service.*;
import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class BrandNewsController {
	
	@Autowired
	private BrandService brandService;
	
	//
	@RequestMapping(value = "/brands/brandnewscrawl/{brandNo}", method = RequestMethod.GET)
	public ModelAndView getBrandPage(@PathVariable int brandNo, Model model) throws Exception {
		BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
		Date currentTime = new Date();

		String dTime = formatter.format(currentTime);
		String e_date = dTime;

		currentTime.setDate(currentTime.getDate() - 500);
		String s_date = formatter.format(currentTime);

		String query = brandDTO.getName();
		String s_from = s_date.replace(".", "");
		String e_to = e_date.replace(".", "");
		int page = 1;
		ArrayList<String> al1 = new ArrayList<>();
		ArrayList<String> al2 = new ArrayList<>();
		ArrayList<String> al3 = new ArrayList<>();
		ArrayList<String> al4 = new ArrayList<>();
		
		while (page < 20) {
			/*
			String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
					+ "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
					+ Integer.toString(page);
			*/
			String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sm=tab_opt&sort=0&photo=0&field=0&pd=3&ds="+s_date
					+"&de="+ e_date +"1&docid=&related=0&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so%3Ar%2Cp%3Afrom20200411to20210711&is_sug_officeid=0";
			Document rawData = Jsoup.connect(address).timeout(5000).get();
			System.out.println(address);
			
			//제목불러오기
			Elements blogOption = rawData.select("div .news_area");
			String realTITLE = "";

			for (Element option : blogOption) {
				realTITLE = option.select("a").attr("title");
				System.out.println(realTITLE);
				al1.add(realTITLE); 
			}
			
			//이미지불러오기
			Elements imageOption = rawData.select(".dsc_thumb");
			String realIMAGE = "";

			for (Element option : imageOption) {
				realIMAGE = option.select(".api_get").attr("src");
				System.out.println(realIMAGE);
				al2.add(realIMAGE);
			}
			
			//언론사 + 날짜불러오기
			Elements dateOption = rawData.select(".info_group");
			String realDate = "";

			for (Element option : dateOption) {
				realDate = option.select(".info").text();
				System.out.println(realDate);
				al3.add(realDate);
			}
			
			//내용
			Elements contentOption = rawData.select(".dsc_wrap");
			String realContent = "";

			for (Element option : contentOption) {
				realContent = option.select(".dsc_txt_wrap").text();
				System.out.println(realContent);
				al4.add(realContent);
			}
			
			page += 10;
		}
		log.info(al1.toString());
		log.info(al2.toString());
		log.info(al3.toString());
		log.info(al4.toString());
		//
		
		model.addAttribute("title", al1);
		model.addAttribute("image", al2);
		model.addAttribute("date", al3);
		model.addAttribute("content", al4);
		model.addAttribute("brandInfo", brandDTO);
		return new ModelAndView("/brands/brandnewscrawl");
	
	}
}
