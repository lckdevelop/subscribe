package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.Map;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;

public interface ProductService {

	ArrayList<ProductDTO> getAllProducts(int brandNo) throws Exception;

	ArrayList<ProductDTO> getCategoryProducts(Map<String, Integer> brandCategory) throws Exception;

	int getAllProductsCount(int brandNo) throws Exception;

	ArrayList<ProductDTO> getAllProductsWithPage(PagingDTO pagingDTO) throws Exception;

	int getCategoryProductsCount(Map<String, Integer> brandProductInfo) throws Exception;

	ArrayList<ProductDTO> getCategoryProductsWithPage(Map<String, Object> brandCategory) throws Exception;

	ArrayList<ProductDTO> getMainCategoryProductsWithPage(Map<String, Object> productInfo) throws Exception;

	int getAllMainCategoryProductsCount(int categoryBrandNo) throws Exception;

}
