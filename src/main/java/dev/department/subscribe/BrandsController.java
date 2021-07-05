package dev.department.subscribe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.service.BrandService;
import dev.department.subscribe.service.MemberService;

@Controller
public class BrandsController {
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = "/brands", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("khg");
		session.setAttribute("userInfo", memberDTO);
		String memberId = ((MemberDTO) session.getAttribute("userInfo")).getId();
		try {
			int memberNo = memberService.getMemberNo(memberId);
			ArrayList<BrandDTO> notSubscribedBrands = brandService.getNotSubscribedBrands(memberNo);
			ArrayList<BrandDTO> subscribedBrands = brandService.getSubscribedBrands(memberNo);
			model.addAttribute("notSubscribedBrands", notSubscribedBrands);
			model.addAttribute("subscribedBrands", subscribedBrands);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "brands/brands";
	}
	
	@PostMapping(value = "/brands/insert/subscribe")
	@ResponseBody
	public void insertSubscribe(@RequestParam(value = "brandNo") int brandNo, Model model, HttpSession session) {
		String memberId = ((MemberDTO) session.getAttribute("userInfo")).getId();
		Map<String, Integer> insertInfo = new HashMap<String, Integer>();
		try {
			insertInfo.put("memberNo", memberService.getMemberNo(memberId));
			insertInfo.put("brandNo", brandNo);
	 		brandService.insertSubscribe(insertInfo);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@PostMapping(value = "/brands/delete/subscribe")
	@ResponseBody
	public void deleteSubscribe(@RequestParam(value = "brandNo") int brandNo, Model model, HttpSession session) {
		String memberId = ((MemberDTO) session.getAttribute("userInfo")).getId();
		Map<String, Integer> deleteInfo = new HashMap<String, Integer>();
		try {
			deleteInfo.put("memberNo", memberService.getMemberNo(memberId));
			deleteInfo.put("brandNo", brandNo);
	 		brandService.deleteSubscribe(deleteInfo);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@GetMapping(value = "/brands/brandpage/{brandNo}")
	public String getBrandPage(@PathVariable int brandNo, Model model, HttpSession session) {
		try {
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			model.addAttribute("brandInfo", brandDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "brands/brandpage";
	}
}
