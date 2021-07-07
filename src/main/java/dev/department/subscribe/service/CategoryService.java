package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.CategoryDTO;

public interface CategoryService {

	ArrayList<CategoryDTO> getProductCategory() throws Exception;

}
