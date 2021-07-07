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
public class PurprocessController {
	
	@Autowired
	private PurprocessService purprocessService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cart() throws Exception {
		return new ModelAndView("/home/shopping_cart");
	}
	
	//카트로 상품 넘버 값 넘길 때 price, dcprice 업데이트해주기
	@GetMapping(value = "/cart/cartinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> cartinfo(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> cartlist = new ArrayList<>();
		if (authentication != null) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
	         cartlistDTO.setMemberNo(sMember.getNo());
	         cartlist = purprocessService.selectCartList(cartlistDTO);
	         log.info(cartlist.toString());
		}
		return cartlist;
	}
	
	@GetMapping(value = "/cart/totalinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public int totalinfo(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		CartListDTO total = new CartListDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			total = purprocessService.selectCartTotal(cartlistDTO);
		}
		return total.getTotalPrice();
	}

	@RequestMapping(value = "/cart/decqty/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> decqty(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> cartlist = new ArrayList<>();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			purprocessService.updatedecQty(cartlistDTO);
			purprocessService.updatePrice(cartlistDTO);
			purprocessService.updateDCPrice(cartlistDTO);
			cartlist = purprocessService.selectCartList(cartlistDTO);
			log.info(cartlist.toString());
		}
		return cartlist;
	}
	
	@RequestMapping(value = "/cart/incqty/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> incqty(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> cartlist = new ArrayList<>();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			log.info(cartlistDTO.toString());
			purprocessService.updateincQty(cartlistDTO);
			purprocessService.updatePrice(cartlistDTO);
			purprocessService.updateDCPrice(cartlistDTO);
			cartlist = purprocessService.selectCartList(cartlistDTO);
			log.info(cartlist.toString());
		}
		return cartlist;
	}
	
	@DeleteMapping(value = "/cart/deletepro/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> deletepro(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> cartlist = new ArrayList<>();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			log.info(cartlistDTO.toString());
			purprocessService.deleteCartPro(cartlistDTO);
			cartlist = purprocessService.selectCartList(cartlistDTO);
			log.info(cartlist.toString());
		}
		return cartlist;
	}

	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkout(Model model, Authentication authentication) throws Exception {
		if (authentication != null) {
		    SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
		    //쿠폰 리스트
		    List<CouponDTO> couponlist = new ArrayList<>();
		    CouponDTO couponDTO = new CouponDTO();
			couponDTO.setMemberNo(sMember.getNo());
			couponlist = purprocessService.getCouponList(couponDTO);
			log.info(couponlist.toString());
			
			//포인트 총액
			PointDTO pointamount = new PointDTO();
			pointamount = purprocessService.getPointAmount(couponDTO);
			model.addAttribute("couponlist", couponlist);
			model.addAttribute("pointamount", pointamount);
			 }
		return new ModelAndView("/home/checkout");
	}
	
	@GetMapping(value = "/checkout/userInfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberDTO> checkoutuserInfo(@ModelAttribute MemberDTO memberDTO, Authentication authentication) throws Exception {
		List<MemberDTO> userInfo = new ArrayList<>();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();	
			memberDTO.setNo(sMember.getNo());
			userInfo = purprocessService.checkoutUserInfo(memberDTO);
			log.info(userInfo.toString());
		}
		return userInfo;
	}
	
	@GetMapping(value = "/checkout/checkoutInfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> checkoutInfo(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> checkoutInfo = new ArrayList<>();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			checkoutInfo = purprocessService.selectCartList(cartlistDTO);
			log.info(checkoutInfo.toString());
		}
		return checkoutInfo;
	}
	
	@GetMapping(value = "/checkout/totalinfo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public CartListDTO checkouttotalinfo(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		CartListDTO totalInfo = new CartListDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			totalInfo = purprocessService.checkoutTotalInfo(cartlistDTO);
			log.info(totalInfo.toString());
		}
		return totalInfo;
	}

	
	@GetMapping(value = "/checkout/coupondisplay/{no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public CouponDTO coupondisplay(@ModelAttribute CouponDTO couponDTO, Authentication authentication) throws Exception {
		CouponDTO couponcard = new CouponDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			couponDTO.setMemberNo(sMember.getNo());
			couponcard = purprocessService.getCouponCard(couponDTO);
			if(couponcard.getType() == 0) {
				couponcard.setTypetemp(couponcard.getAmount() + "%");
			}else {
				couponcard.setTypetemp(couponcard.getAmount()+ "원");
			}
			
			couponcard.setDuetimetemp(couponcard.getDuetime() + "");
			log.info(couponcard.toString());
		}
		return couponcard;
	}
	
	@GetMapping(value = "/checkout/selectdcproduct/{couponNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public CartListDTO selectdcproduct(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		CartListDTO dcproduct = new CartListDTO();
		CartListDTO dcproductprice = new CartListDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			//couponNo, memberNo 넘김 --> 할인 적용할 productNo, productName 받아옴
			dcproduct = purprocessService.selectDcproduct(cartlistDTO);
			dcproduct.setCouponNo(cartlistDTO.getCouponNo());
			//prodcutNo, couponNo 넘김 --> 할인 적용된 가격 (productPrice) select
			dcproductprice = purprocessService.selectDcproductPrice(dcproduct);
			cartlistDTO.setProductNo(dcproduct.getProductNo());
			cartlistDTO.setName(dcproduct.getName());
			cartlistDTO.setProductPrice(dcproductprice.getProductPrice());
			log.info(cartlistDTO.toString());
		}
		return cartlistDTO;
	}
	
	@GetMapping(value = "/checkout/applyDiscount/{productNo}/{couponNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void applyDiscount(@ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		CartListDTO totalInfo = new CartListDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			purprocessService.applyDiscount(cartlistDTO);
		}
	}
}
