package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import dev.department.subscribe.dto.BrandDTO;

public interface BrandDAO {

	public ArrayList<BrandDTO> getNotSubscribedBrands(int memberNo) throws SQLException;

	public ArrayList<BrandDTO> getSubscribedBrand(int memberNo) throws SQLException;

	public void deleteSubscribe(Map<String, Integer> deleteInfo) throws SQLException;

	public void insertSubscribe(Map<String, Integer> insertInfo) throws SQLException;
	
}
