package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.ProductDAO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ProductDTO;

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

}
