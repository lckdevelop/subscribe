package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MybrandsProductParamDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.WindowListDTO;

public interface ProductService {

	ArrayList<ProductDTO> getAllProducts(int brandNo) throws Exception;

	ArrayList<ProductDTO> getCategoryProducts(Map<String, Integer> brandCategory) throws Exception;

	int getAllProductsCount(int brandNo) throws Exception;

	ArrayList<ProductDTO> getAllProductsWithPage(PagingDTO pagingDTO) throws Exception;

	int getCategoryProductsCount(Map<String, Integer> brandProductInfo) throws Exception;

	ArrayList<ProductDTO> getCategoryProductsWithPage(Map<String, Object> brandCategory) throws Exception;

	ArrayList<ProductDTO> getMainCategoryProductsWithPage(Map<String, Object> productInfo) throws Exception;

	int getAllMainCategoryProductsCount(int categoryBrandNo) throws Exception;

	int getAllSubCategoryProductsCount(Map<String, Integer> categoryInfo) throws Exception;

	ArrayList<ProductDTO> getSubCategoryProductsWithPage(Map<String, Object> productInfo) throws Exception;

	ProductDTO getProductInfo(int productNo) throws Exception;

	List<ProductDTO> getMybrandsProduct(PagingDTO pagingDTO) throws Exception;

	int getMybrandsProductCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception;

	int getMybrandsCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception;

	List<BrandDTO> getMybrands(PagingDTO pagingDTO) throws Exception;

	int getMybrandsWindowCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception;

	List<WindowListDTO> getMybrandsWindow(PagingDTO pagingDTO) throws Exception;

}
