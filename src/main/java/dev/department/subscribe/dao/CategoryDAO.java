package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.CategoryDTO;

public interface CategoryDAO {

	ArrayList<CategoryDTO> getProductCategory() throws SQLException;

}
