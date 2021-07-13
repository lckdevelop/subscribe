package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MybrandsProductParamDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.WindowListDTO;

public interface ProductDAO {

	ArrayList<ProductDTO> getAllProducts(int brandNo) throws SQLException;

	ArrayList<ProductDTO> getCategoryProducts(Map<String, Integer> brandCategory) throws SQLException;

	int getAllProductsCount(int brandNo) throws SQLException;

	ArrayList<ProductDTO> getAllProductsWithPage(PagingDTO pagingDTO) throws SQLException;

	int getCategoryProductsCount(Map<String, Integer> brandProductInfo) throws SQLException;

	ArrayList<ProductDTO> getCategoryProductsWithPage(Map<String, Object> brandCategory) throws SQLException;

	ArrayList<ProductDTO> getMainCategoryProductsWithPage(Map<String, Object> productInfo) throws SQLException;

	int getAllMainCategoryProductsCount(int categoryBrandNo) throws SQLException;

	int getAllSubCategoryProductsCount(Map<String, Integer> categoryInfo) throws SQLException;

	ArrayList<ProductDTO> getSubCategoryProductsWithPage(Map<String, Object> productInfo) throws SQLException;

	ProductDTO getProductInfo(int productNo) throws SQLException;

	List<ProductDTO> getMybrandsProduct(PagingDTO pagingDTO) throws SQLException;

	int getMybrandsProductCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws SQLException;

	int getMybrandsCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws SQLException;

	List<BrandDTO> getMybrands(PagingDTO pagingDTO) throws SQLException;

	int getMybrandsWindowCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws SQLException;

	List<WindowListDTO> getMybrandsWindow(PagingDTO pagingDTO) throws SQLException;

}
