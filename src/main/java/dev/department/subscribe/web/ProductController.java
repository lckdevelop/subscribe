package dev.department.subscribe.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.CategoryDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.SizeDTO;
import dev.department.subscribe.sec.SecurityMember;
import dev.department.subscribe.service.BrandService;
import dev.department.subscribe.service.CategoryService;
import dev.department.subscribe.service.ProductService;
import dev.department.subscribe.service.SizeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private SizeService sizeService;
	
	@RequestMapping(value = "/product/category", method = RequestMethod.GET)
	public String home(@RequestParam(value = "main") String categoryBrand, @RequestParam(value = "sub") String categoryProduct, @RequestParam(value = "page") int pageNo, Model model, HttpSession session, Authentication authentication) {
	         SecurityMember sMember = (SecurityMember) authentication.getPrincipal();
	         int memberNo = sMember.getNo();
	         ArrayList<ProductDTO> products = new ArrayList<ProductDTO>();
	         ArrayList<CategoryDTO> categoryProductDTO = new ArrayList<CategoryDTO>();
	         ArrayList<BrandDTO> brandInfo = new ArrayList<BrandDTO>();
	         
	         
		try {
			categoryProductDTO = categoryService.getProductCategory();
			brandInfo = brandService.getAllBrands();
			int categoryBrandNo = categoryService.getCategoryBrandNo(categoryBrand);
			
			
			
			if(categoryProduct.equals("")) {
				
				int pageSize=12;
				int pageBlock=5;
				int productCount=productService.getAllMainCategoryProductsCount(categoryBrandNo);
				PagingDTO pagingDTO = new PagingDTO(pageNo, pageSize, pageBlock, productCount);
				
				Map<String, Object> productInfo = new HashMap<String, Object>();
				productInfo.put("categoryBrandNo", categoryBrandNo);
				
				productInfo.put("pagingDTO", pagingDTO);
				products = productService.getMainCategoryProductsWithPage(productInfo);
				
				
				model.addAttribute("pagingDTO", pagingDTO);
				model.addAttribute("main",  categoryBrand);
				model.addAttribute("sub", categoryProduct);
				model.addAttribute("categoryProductInfo", categoryProductDTO);
				model.addAttribute("productInfo", products);
				model.addAttribute("brandInfo", brandInfo);
			}else {
				int categoryProductNo = categoryService.getCategoryProductNo(categoryProduct);
				int pageSize=12;
				int pageBlock=5;
				Map<String, Integer> categoryInfo = new HashMap<String, Integer>();
				categoryInfo.put("categoryBrandNo", categoryBrandNo);
				categoryInfo.put("categoryProductNo", categoryProductNo);
				int productCount=productService.getAllSubCategoryProductsCount(categoryInfo);
				PagingDTO pagingDTO = new PagingDTO(pageNo, pageSize, pageBlock, productCount);
				
				Map<String, Object> productInfo = new HashMap<String, Object>();
				productInfo.put("categoryBrandNo", categoryBrandNo);
				productInfo.put("categoryProductNo", categoryProductNo);
				productInfo.put("pagingDTO", pagingDTO);
				products = productService.getSubCategoryProductsWithPage(productInfo);
				
				model.addAttribute("pagingDTO", pagingDTO);
				model.addAttribute("main",  categoryBrand);
				model.addAttribute("sub", categoryProduct);
				model.addAttribute("categoryProductInfo", categoryProductDTO);
				model.addAttribute("productInfo", products);
				model.addAttribute("brandInfo", brandInfo);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/categoryproduct";
	}
	
	@GetMapping(value="/product/detail/{main}/{sub}/{brandNo}/{productNo}")
	public String getProductDetail(@PathVariable String main, @PathVariable String sub, @PathVariable int brandNo, @PathVariable int productNo, Model model, HttpSession session) {
		try {
			ProductDTO product = productService.getProductInfo(productNo);
			BrandDTO brand = brandService.getBrandInfo(brandNo);
			ArrayList<SizeDTO> size = new ArrayList<SizeDTO>();
			if(product.getCategoryproductNo()==5) {
				size = sizeService.getShoeSize();
			}else {
				size = sizeService.getClothSize();
			}
			
			
			log.info(size.get(0).toString());
			model.addAttribute("productInfo", product);
			model.addAttribute("brandInfo", brand);
			model.addAttribute("sizeInfo", size);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "product/productdetail";
	}

}
