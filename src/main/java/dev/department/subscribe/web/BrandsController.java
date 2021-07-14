package dev.department.subscribe.web;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
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
public class BrandsController {
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "/brands", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session, Authentication authentication) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
	         int memberNo = sMember.getNo();
	         log.info(Integer.toString(memberNo));
	         
	         ArrayList<BrandDTO> notSubscribedBrands = new ArrayList<BrandDTO>();
	         ArrayList<BrandDTO> subscribedBrands = new ArrayList<BrandDTO>();
		
		try {
			notSubscribedBrands = brandService.getNotSubscribedBrands(memberNo);
			subscribedBrands = brandService.getSubscribedBrands(memberNo);
			
			Collections.shuffle(notSubscribedBrands);
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
	public void insertSubscribe(@RequestParam(value = "brandNo") int brandNo, Model model, HttpSession session, Authentication authentication) {
		SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
        int memberNo = sMember.getNo();
        
		Map<String, Integer> insertInfo = new HashMap<String, Integer>();
		try {
			insertInfo.put("memberNo", memberNo);
			insertInfo.put("brandNo", brandNo);
	 		brandService.insertSubscribe(insertInfo);
	 		brandService.plusSubscribeCount(brandNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@PostMapping(value = "/brands/delete/subscribe")
	@ResponseBody
	public void deleteSubscribe(@RequestParam(value = "brandNo") int brandNo, Model model, HttpSession session, Authentication authentication) {
		SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
        int memberNo = sMember.getNo();
		Map<String, Integer> deleteInfo = new HashMap<String, Integer>();
		try {
			deleteInfo.put("memberNo",memberNo);
			deleteInfo.put("brandNo", brandNo);
	 		brandService.deleteSubscribe(deleteInfo);	
	 		brandService.minusSubscribeCount(brandNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@GetMapping(value = "/brands/brandpage/{brandNo}/all")
	public String getBrandPage(@PathVariable int brandNo, Model model, HttpSession session) {
		try {
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			ArrayList<CategoryDTO> categoryProductDTO = categoryService.getProductCategory();
			
			int pageSize=12;
			int pageBlock=5;
			int productCount=productService.getAllProductsCount(brandNo);
			PagingDTO pagingDTO = new PagingDTO(1, pageSize, pageBlock, productCount);
			pagingDTO.setBrandNo(brandNo);

			ArrayList<ProductDTO> products = productService.getAllProductsWithPage(pagingDTO);
			pagingDTO.setPage(0);
			
			String all="all";
			
			model.addAttribute("brandInfo", brandDTO);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("categoryNo",  all);
			model.addAttribute("categoryProductInfo", categoryProductDTO);
			model.addAttribute("productInfo", products);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "brands/brandpage";
	}
	
	@GetMapping(value = "/brands/brandpage/{brandNo}/all/{pageNo}")
	public String getBrandPage(@PathVariable int brandNo, @PathVariable int pageNo, Model model, HttpSession session) {
		try {
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			ArrayList<CategoryDTO> categoryProductDTO = categoryService.getProductCategory();
			
			int pageSize=12;
			int pageBlock=5;
			int productCount=productService.getAllProductsCount(brandNo);
			PagingDTO pagingDTO = new PagingDTO(pageNo, pageSize, pageBlock, productCount);
			pagingDTO.setBrandNo(brandNo);
			ArrayList<ProductDTO> products = productService.getAllProductsWithPage(pagingDTO);
			
			String all="all";
			
			model.addAttribute("brandInfo", brandDTO);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("categoryNo",  all);
			model.addAttribute("categoryProductInfo", categoryProductDTO);
			model.addAttribute("productInfo", products);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "brands/brandpage";
	}
	
	@GetMapping(value = "/brands/brandpage/{brandNo}/{categoryNo}/{pageNo}")
	public String getBrandPage(@PathVariable int brandNo, @PathVariable int categoryNo, @PathVariable int pageNo, Model model, HttpSession session) {
		try {
			BrandDTO brandDTO = brandService.getBrandInfo(brandNo);
			ArrayList<CategoryDTO> categoryProductDTO = categoryService.getProductCategory();
			
			Map<String, Integer> brandProductInfo = new HashMap<String, Integer>();
			brandProductInfo.put("brandNo", brandNo);
			brandProductInfo.put("categoryNo", categoryNo);
			
			int pageSize=12;
			int pageBlock=5;
			int productCount=productService.getCategoryProductsCount(brandProductInfo);
			PagingDTO pagingDTO = new PagingDTO(pageNo, pageSize, pageBlock, productCount);
			
			Map<String, Object> brandCategory = new HashMap<String, Object>();
			brandCategory.put("brandNo", brandNo);
			brandCategory.put("categoryNo", categoryNo);
			brandCategory.put("pagingDTO", pagingDTO);
			ArrayList<ProductDTO> products = productService.getCategoryProductsWithPage(brandCategory);
			
			
			if(products.size()==0) {
				model.addAttribute("brandInfo", brandDTO);
				model.addAttribute("categoryProductInfo", categoryProductDTO);
				model.addAttribute("pagingDTO", pagingDTO);
			}
			else {
				model.addAttribute("brandInfo", brandDTO);
				model.addAttribute("pagingDTO", pagingDTO);
				model.addAttribute("categoryNo", categoryNo);
				model.addAttribute("categoryProductInfo", categoryProductDTO);
				model.addAttribute("productInfo", products);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "brands/brandpage";
	}
}
