package dev.department.subscribe.web;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dev.department.subscribe.dto.*;
import dev.department.subscribe.service.*;
import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class PurprocessController {
	
	@Autowired
	private PurprocessService purprocessService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cart() throws Exception {
		return new ModelAndView("/theme/shopping_cart");
	}
	
	//카트로 상품 넘버 값 넘길 때 가격 업데이트해주기
	@GetMapping(value = "/cart/cartinfo/{memberNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> cartinfo(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		List<CartListDTO> cartlist = purprocessService.selectCartList(cartlistDTO);
		log.info(cartlist.toString());
		return cartlist;
	}
	
	@GetMapping(value = "/cart/totalinfo/{memberNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public int totalinfo(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		CartListDTO total = purprocessService.selectCartTotal(cartlistDTO);
		return total.getTotalPrice();
	}

	@RequestMapping(value = "/cart/decqty/{memberNo}/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> decqty(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		log.info(cartlistDTO.toString());
		purprocessService.updatedecQty(cartlistDTO);
		purprocessService.updatePrice(cartlistDTO);
		List<CartListDTO> cartlist = purprocessService.selectCartList(cartlistDTO);
		log.info(cartlist.toString());
		return cartlist;
	}
	
	@RequestMapping(value = "/cart/incqty/{memberNo}/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> incqty(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		log.info(cartlistDTO.toString());
		purprocessService.updateincQty(cartlistDTO);
		purprocessService.updatePrice(cartlistDTO);
		List<CartListDTO> cartlist = purprocessService.selectCartList(cartlistDTO);
		log.info(cartlist.toString());
		return cartlist;
	}
	
	@DeleteMapping(value = "/cart/deletepro/{memberNo}/{productNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> deletepro(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		log.info(cartlistDTO.toString());
		purprocessService.deleteCartPro(cartlistDTO);
		List<CartListDTO> cartlist = purprocessService.selectCartList(cartlistDTO);
		log.info(cartlist.toString());
		return cartlist;
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkout() throws Exception {
		return new ModelAndView("/theme/checkout");
	}
	
	@GetMapping(value = "/checkout/userInfo/{no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberDTO> checkoutuserInfo(@ModelAttribute MemberDTO memberDTO) throws Exception {
		List<MemberDTO> userInfo = purprocessService.checkoutUserInfo(memberDTO);
		log.info(userInfo.toString());
		//name, email, phone
		return userInfo;
	}
	
	@GetMapping(value = "/checkout/checkoutInfo/{memberNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<CartListDTO> checkoutInfo(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		List<CartListDTO> checkoutInfo = purprocessService.selectCartList(cartlistDTO);
		log.info(checkoutInfo.toString());
		return checkoutInfo;
	}
	
	@GetMapping(value = "/checkout/totalinfo/{memberNo}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public CartListDTO checkouttotalinfo(@ModelAttribute CartListDTO cartlistDTO) throws Exception {
		CartListDTO totalInfo = purprocessService.checkoutTotalInfo(cartlistDTO);
		log.info(totalInfo.toString());
		return totalInfo;
	}
}
