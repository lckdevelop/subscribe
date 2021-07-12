package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.CategoryDTO;

public interface CategoryService {

	ArrayList<CategoryDTO> getProductCategory() throws Exception;

	int getCategoryBrandNo(String categoryBrand) throws Exception;

	int getCategoryProductNo(String categoryProduct) throws Exception;

}
