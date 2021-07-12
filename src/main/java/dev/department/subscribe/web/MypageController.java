package dev.department.subscribe.web;

import java.util.*;

import javax.servlet.http.*;

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
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "/brands/reservationform/{brandNo}", method = RequestMethod.GET)
	public ModelAndView getBrandPage(@PathVariable int brandNo, Model model, HttpSession session) {
		try {
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			model.addAttribute("brandInfo", brandDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("/brands/reservationform");
	}
	
	@GetMapping(value = "/brands/reservationform/action/{storeNo}/{memo}/{restime}/{brandNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void reserve(@ModelAttribute ReservationDTO reservation, Authentication authentication) throws Exception {
		if (authentication != null) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
	         reservation.setMemberNo(sMember.getNo());
	         log.info(reservation.toString());
	         mypageService.insertReservation(reservation);
		}
	}

	@RequestMapping(value = "/mypage/coupon", method = RequestMethod.GET)
	public ModelAndView coupon(Model model, Authentication authentication) throws Exception {
		MypagecardDTO mycard = new MypagecardDTO();
		if (authentication != null) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();

	         log.info(sMember.getName() + ": 겟 네임입니다~" );
	         log.info(sMember.getNo() + ": 겟 넘버입니다~" );
	         
	 		MemberDTO memberDTO = new MemberDTO();
	 		memberDTO.setNo(sMember.getNo());
	 		
	 		List<CouponDTO> couponDTO = mypageService.getCouponList(memberDTO);
	 		log.info(couponDTO.toString());
	 		
	 		MypagecardDTO mycardtemp = new MypagecardDTO();
		    mycardtemp = mypageService.getCouponcnt(memberDTO);
		    mycard.setCouponcnt(mycardtemp.getCouponcnt());
		    mycardtemp = mypageService.getPointcnt(memberDTO);
		    mycard.setPointcnt(mycardtemp.getPointcnt());
		    mycardtemp = mypageService.getProductcnt(memberDTO);
		    mycard.setProductcnt(mycardtemp.getProductcnt());
		    
			model.addAttribute("mycard", mycard);
	 		model.addAttribute("couponlist", couponDTO);
	      }
		return new ModelAndView("/home/coupon");
	}
	
	@RequestMapping(value = "/mypage/like", method = RequestMethod.GET)
	public ModelAndView like(Model model, Authentication authentication) throws Exception {
		if (authentication != null) {
	    SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setNo(sMember.getNo());
		
		List<CartListDTO> likelist = mypageService.getLikeList(memberDTO);
		log.info(likelist.toString());
		model.addAttribute("likelist", likelist);
		 }
		return new ModelAndView("/home/like");
	}
	
	@RequestMapping(value = "/mypage/hpoint", method = RequestMethod.GET)
	public ModelAndView hpoint(Model model, Authentication authentication) throws Exception {
		MypagecardDTO mycard = new MypagecardDTO();
		List<PointDTO> pointlist = new ArrayList<>();
		if (authentication != null) {
		    SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setNo(sMember.getNo());
			
		    MypagecardDTO mycardtemp = new MypagecardDTO();
		    mycardtemp = mypageService.getCouponcnt(memberDTO);
		    mycard.setCouponcnt(mycardtemp.getCouponcnt());
		    mycardtemp = mypageService.getPointcnt(memberDTO);
		    mycard.setPointcnt(mycardtemp.getPointcnt());
		    mycardtemp = mypageService.getProductcnt(memberDTO);
		    mycard.setProductcnt(mycardtemp.getProductcnt());
		    
		    pointlist = mypageService.getPointlist(memberDTO);
		    
		    model.addAttribute("pointlist", pointlist);
			model.addAttribute("mycard", mycard);
			 }
		return new ModelAndView("/home/hpoint");
	}
	
	@RequestMapping(value = "/mypage/orderedlist", method = RequestMethod.GET)
	public ModelAndView orderedlist(Model model, Authentication authentication) throws Exception {
		MypagecardDTO mycard = new MypagecardDTO();
		List<CartListDTO> cartlist = new ArrayList<>();
		if (authentication != null) {
		    SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setNo(sMember.getNo());
			
			cartlist = mypageService.getOrderedList(memberDTO);
			
			for(int i = 0; i < cartlist.size(); i++) {
	        	 if(cartlist.get(i).getShoesize() == null) {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getClothsize());
	        	 }else {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getShoesize());
	        	 }
	         }
			
		    MypagecardDTO mycardtemp = new MypagecardDTO();
		    mycardtemp = mypageService.getCouponcnt(memberDTO);
		    mycard.setCouponcnt(mycardtemp.getCouponcnt());
		    mycardtemp = mypageService.getPointcnt(memberDTO);
		    mycard.setPointcnt(mycardtemp.getPointcnt());
		    mycardtemp = mypageService.getProductcnt(memberDTO);
		    mycard.setProductcnt(mycardtemp.getProductcnt());
		    
			model.addAttribute("mycard", mycard);
			model.addAttribute("cartlist", cartlist);
			 }
		return new ModelAndView("/home/orderedlist");
	}
}
