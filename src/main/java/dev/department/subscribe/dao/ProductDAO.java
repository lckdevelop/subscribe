package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;

public interface ProductDAO {

	ArrayList<ProductDTO> getAllProducts(int brandNo) throws SQLException;

	ArrayList<ProductDTO> getCategoryProducts(Map<String, Integer> brandCategory) throws SQLException;

	int getAllProductsCount(int brandNo) throws SQLException;

	ArrayList<ProductDTO> getAllProductsWithPage(PagingDTO pagingDTO) throws SQLException;

	int getCategoryProductsCount(Map<String, Integer> brandProductInfo) throws SQLException;

	ArrayList<ProductDTO> getCategoryProductsWithPage(Map<String, Object> brandCategory) throws SQLException;

	ArrayList<ProductDTO> getMainCategoryProductsWithPage(Map<String, Object> productInfo) throws SQLException;

	int getAllMainCategoryProductsCount(int categoryBrandNo) throws SQLException;

}