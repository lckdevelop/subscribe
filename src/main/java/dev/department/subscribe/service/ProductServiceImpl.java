package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.ProductDAO;
import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MybrandsProductParamDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.WindowListDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public ArrayList<ProductDTO> getAllProducts(int brandNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllProducts(brandNo);
	}

	@Override
	public ArrayList<ProductDTO> getCategoryProducts(Map<String, Integer> brandCategory) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getCategoryProducts(brandCategory);
	}

	@Override
	public int getAllProductsCount(int brandNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllProductsCount(brandNo);
	}

	@Override
	public ArrayList<ProductDTO> getAllProductsWithPage(PagingDTO pagingDTO) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllProductsWithPage(pagingDTO);
	}

	@Override
	public int getCategoryProductsCount(Map<String, Integer> brandProductInfo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getCategoryProductsCount(brandProductInfo);
	}

	@Override
	public ArrayList<ProductDTO> getCategoryProductsWithPage(Map<String, Object> brandCategory) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getCategoryProductsWithPage(brandCategory);
	}

	@Override
	public ArrayList<ProductDTO> getMainCategoryProductsWithPage(Map<String, Object> productInfo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getMainCategoryProductsWithPage(productInfo);
	}

	@Override
	public int getAllMainCategoryProductsCount(int categoryBrandNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllMainCategoryProductsCount(categoryBrandNo);
	}

	@Override
	public int getAllSubCategoryProductsCount(Map<String, Integer> categoryInfo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllSubCategoryProductsCount(categoryInfo);
	}

	@Override
	public ArrayList<ProductDTO> getSubCategoryProductsWithPage(Map<String, Object> productInfo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getSubCategoryProductsWithPage(productInfo);
	}

	@Override
	public ProductDTO getProductInfo(int productNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getProductInfo(productNo);
	}

	@Override
	public List<ProductDTO> getMybrandsProduct(PagingDTO pagingDTO) throws Exception {
		return productDAO.getMybrandsProduct(pagingDTO);
	}

	@Override
	public int getMybrandsProductCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception {
		return productDAO.getMybrandsProductCnt(mybrandsProductParamDTO);
	}

	@Override
	public int getMybrandsCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception {
		return productDAO.getMybrandsCnt(mybrandsProductParamDTO);
	}

	@Override
	public List<BrandDTO> getMybrands(PagingDTO pagingDTO) throws Exception {
		return productDAO.getMybrands(pagingDTO);
	}

	@Override
	public int getMybrandsWindowCnt(MybrandsProductParamDTO mybrandsProductParamDTO) throws Exception {
		return productDAO.getMybrandsWindowCnt(mybrandsProductParamDTO);
	}

	@Override
	public List<WindowListDTO> getMybrandsWindow(PagingDTO pagingDTO) throws Exception {
		return productDAO.getMybrandsWindow(pagingDTO);
	}

}
