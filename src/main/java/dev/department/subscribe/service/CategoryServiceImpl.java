package dev.department.subscribe.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.CategoryDAO;
import dev.department.subscribe.dto.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	@Resource(name="categoryDAO")
	private CategoryDAO categoryDAO;

	@Override
	public ArrayList<CategoryDTO> getProductCategory() throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getProductCategory();
	}

	@Override
	public int getCategoryBrandNo(String categoryBrand) throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getCategoryBrandNo(categoryBrand);
	}

}
