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
	         
	         for(int i = 0; i < cartlist.size(); i++) {
	        	 if(cartlist.get(i).getShoesize() == null) {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getClothsize());
	        	 }else {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getShoesize());
	        	 }
	         }
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
	
	@GetMapping(value = "/cart/savecheckout", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void savecheckout(@ModelAttribute OrderedDTO orderedDTO, Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			purprocessService.insertInitialCheck(orderedDTO);
			
			//주문 번호 받아옴
		    savecheck = purprocessService.getOrderno(orderedDTO);
		    savecheck.setMemberNo(sMember.getNo());
		    purprocessService.insertOrderedProduct(savecheck);
		}
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
			
			model.addAttribute("couponlist", couponlist);
			 }
		return new ModelAndView("/home/checkout");
	}
	
	@GetMapping(value = "/checkout/selectdeliver", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void selectdeliver(@ModelAttribute OrderedDTO orderedDTO,  Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			
		    savecheck = purprocessService.getOrderno(orderedDTO);
		    purprocessService.updateDelivery(savecheck);
		}
	}
	
	
	@GetMapping(value = "/checkout/selectdirect", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void selectdirect(@ModelAttribute OrderedDTO orderedDTO,  Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			
		    savecheck = purprocessService.getOrderno(orderedDTO);
		    purprocessService.updateDirect(savecheck);
		}
	}
	
	@GetMapping(value = "/checkout/applypoint/{amount}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public CartListDTO applypoint(@ModelAttribute PointDTO pointDTO, Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		CartListDTO applyPointAmount = new CartListDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			pointDTO.setMemberNo(sMember.getNo());
			//포인트 테이블에 -amount insert
			purprocessService.usePoint(pointDTO);
			
			savecheck.setMemberNo(sMember.getNo());
			savecheck = purprocessService.getOrderno(savecheck);
			savecheck.setPrice(pointDTO.getAmount());
			purprocessService.saveorderedPoint(savecheck);
			purprocessService.updatepointPrice(savecheck);
			
			//포인트 적용된 총합 리턴(productPrice) + 전체 제품 총합(memberPrice)
			applyPointAmount = purprocessService.applyPoint(pointDTO);
			//log.info(applyPointAmount.toString());
		}
		return applyPointAmount;
	}
	
	@GetMapping(value = "/checkout/savedeliveradd/{address}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void savedeliveradd(@ModelAttribute OrderedDTO orderedDTO,  Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			
		    savecheck = purprocessService.getOrderno(orderedDTO);
		    savecheck.setAddress(orderedDTO.getAddress());
		    purprocessService.updateDeliveradd(savecheck);
		} 
	}
	
	@GetMapping(value = "/checkout/depttarget/{no}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public StoreDTO clickTarEvent(@ModelAttribute StoreDTO storeDTO, Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		StoreDTO storeinfo = new StoreDTO();
		if (authentication != null) {
		SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
		savecheck.setMemberNo(sMember.getNo());
		savecheck = purprocessService.getOrderno(savecheck);
		storeinfo = purprocessService.getStoreInfo(storeDTO);
		savecheck.setStoreNo(storeinfo.getNo());
		purprocessService.updateDirectStore(savecheck);
		} 
		return storeinfo;
	}
	 
	@GetMapping(value = "/checkout/selecttime/{reserveDate}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void selecttime(@ModelAttribute OrderedDTO orderedDTO,  Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			
		    savecheck = purprocessService.getOrderno(orderedDTO); 
		    String arr[] = orderedDTO.getReserveDate().split("-");
		    
		    if(arr[1].length() == 1) {
		    	arr[1] = "0" + arr[1];
		    }
		    if(arr[2].length() == 1) {
		    	arr[2] = "0" + arr[2];
		    }
		   
		    String temp = arr[0] + "-" + arr[1] + "-" + arr[2] + " " + arr[3];

		    //java.sql.Date to = Date.valueOf(temp);
		    log.info(temp);
		    savecheck.setReserveDate(temp); 
		    purprocessService.updateReserveDate(savecheck);
		}
	}
	
	@GetMapping(value = "/checkout/selectpoint", produces="application/json;charset=UTF-8")
	@ResponseBody
	public PointDTO selectpoint(@ModelAttribute CouponDTO userInfo,  Authentication authentication) throws Exception {
		PointDTO pointamount = new PointDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();	
			userInfo.setMemberNo(sMember.getNo());
			pointamount = purprocessService.getPointAmount(userInfo);
			log.info(pointamount.toString());
		}
		return pointamount;
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
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			cartlistDTO.setMemberNo(sMember.getNo());
			purprocessService.applyDiscount(cartlistDTO);
		}
	}
	
	@GetMapping(value = "/checkout/updatestatusFin", produces="application/json;charset=UTF-8")
	@ResponseBody
	public void updatestatusfunc(@ModelAttribute OrderedDTO orderedDTO,  Authentication authentication) throws Exception {
		OrderedDTO savecheck = new OrderedDTO();
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
			orderedDTO.setMemberNo(sMember.getNo());
			
		    savecheck = purprocessService.getOrderno(orderedDTO);
		    log.info("확인" + savecheck.toString());
		    purprocessService.updatestatus(savecheck);
		    purprocessService.deleteMemberCart(orderedDTO);
		}
	}
	
	@RequestMapping(value = "/checkoutcomplete", method = RequestMethod.GET)
	public ModelAndView checkoutcomplete(Model model, @ModelAttribute CartListDTO cartlistDTO, Authentication authentication) throws Exception {
		List<CartListDTO> cartlist = new ArrayList<>();
		OrderedDTO orderedDTO = new OrderedDTO();
		if (authentication != null) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
	         cartlistDTO.setMemberNo(sMember.getNo());
	         cartlist = purprocessService.selectCartList(cartlistDTO);
	         
	         for(int i = 0; i < cartlist.size(); i++) {
	        	 if(cartlist.get(i).getShoesize() == null) {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getClothsize());
	        	 }else {
	        		 cartlist.get(i).setProductsize(cartlist.get(i).getShoesize());
	        	 }
	         }
	         
	         orderedDTO = purprocessService.selectOrderedList(cartlistDTO);
	         log.info(cartlist.toString());
	         log.info(orderedDTO.toString());
	         
	         model.addAttribute("orderedDTO", orderedDTO);
	         model.addAttribute("cartlist", cartlist);
		}
		return new ModelAndView("/home/checkoutcomplete");
	}

} 
