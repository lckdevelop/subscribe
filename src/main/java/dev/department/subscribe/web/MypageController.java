package dev.department.subscribe.web;

import java.util.*;

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
public class MypageController {
	
	@Autowired
	private MypageService mypageService;

	@RequestMapping(value = "/mypage/coupon", method = RequestMethod.GET)
	public ModelAndView coupon(Model model) throws Exception {
		//나중에 수정 (멤버 넘버 제대로 넘기기)
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setNo(1);
		
		List<CouponDTO> couponDTO = mypageService.getCouponList(memberDTO);
		log.info(couponDTO.toString());
		model.addAttribute("couponlist", couponDTO);
		return new ModelAndView("/theme/coupon");
	}
	
	@RequestMapping(value = "/mypage/like", method = RequestMethod.GET)
	public ModelAndView like(Model model) throws Exception {
		//나중에 수정 (멤버 넘버 제대로 넘기기)
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setNo(1);
		
		List<CartListDTO> likelist = mypageService.getLikeList(memberDTO);
		log.info(likelist.toString());
		model.addAttribute("likelist", likelist);
		return new ModelAndView("/theme/like");
	}
	
	@RequestMapping(value = "/mypage/hpoint", method = RequestMethod.GET)
	public ModelAndView hpoint() throws Exception {
		
		return new ModelAndView("/theme/hpoint");
	}
	
	@RequestMapping(value = "/mypage/memberInfo", method = RequestMethod.GET)
	public ModelAndView memberInfo() throws Exception {
		
		return new ModelAndView("/theme/memberInfo");
	}
	
	@RequestMapping(value = "/mypage/orderedlist", method = RequestMethod.GET)
	public ModelAndView orderedlist() throws Exception {
		
		return new ModelAndView("/theme/orderedlist");
	}
}
