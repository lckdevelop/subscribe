package dev.department.subscribe.web;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dev.department.subscribe.dto.*;
import dev.department.subscribe.sec.*;
import dev.department.subscribe.service.*;
import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;

	@RequestMapping(value = "/mypage/coupon", method = RequestMethod.GET)
	public ModelAndView coupon(Model model, Authentication authentication) throws Exception {
		if (authentication != null) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();

	         log.info(sMember.getName() + ": 겟 네임입니다~" );
	         log.info(sMember.getNo() + ": 겟 넘버입니다~" );
	         
	       //나중에 수정 (멤버 넘버 제대로 넘기기)
	 		MemberDTO memberDTO = new MemberDTO();
	 		memberDTO.setNo(sMember.getNo());
	 		
	 		List<CouponDTO> couponDTO = mypageService.getCouponList(memberDTO);
	 		log.info(couponDTO.toString());
	 		model.addAttribute("couponlist", couponDTO);
	      }
		return new ModelAndView("/home/coupon");
	}
	
	@RequestMapping(value = "/mypage/like", method = RequestMethod.GET)
	public ModelAndView like(Model model, Authentication authentication) throws Exception {
		if (authentication != null) {
	    SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
		//나중에 수정 (멤버 넘버 제대로 넘기기)
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setNo(sMember.getNo());
		
		List<CartListDTO> likelist = mypageService.getLikeList(memberDTO);
		log.info(likelist.toString());
		model.addAttribute("likelist", likelist);
		 }
		return new ModelAndView("/home/like");
	}
	
	@RequestMapping(value = "/mypage/hpoint", method = RequestMethod.GET)
	public ModelAndView hpoint() throws Exception {
		
		return new ModelAndView("/home/hpoint");
	}
	
	@RequestMapping(value = "/mypage/memberInfo", method = RequestMethod.GET)
	public ModelAndView memberInfo() throws Exception {
		
		return new ModelAndView("/home/memberInfo");
	}
	
	@RequestMapping(value = "/mypage/orderedlist", method = RequestMethod.GET)
	public ModelAndView orderedlist() throws Exception {
		
		return new ModelAndView("/home/orderedlist");
	}
}
