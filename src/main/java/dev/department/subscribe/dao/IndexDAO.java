package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.dto.SubsDTO;

public interface IndexDAO {
	ArrayList<BrandDTO> getBranSubsList(int memNo) throws SQLException;
	
	ArrayList<BrandDTO> getMemSubs(int memNo) throws SQLException;
	
	ArrayList<BrandDTO> getMemNotSubs(int memNo) throws SQLException;
	
	int brandSubsCancel(SubsDTO subsDTO) throws SQLException;
	
	int subsCntMinUpdate(int brandNo) throws SQLException;
	
	int brandSubsEnroll(SubsDTO subsDTO) throws SQLException;
	
	int subsCntPlusUpdate(int brandNo) throws SQLException;
	
	ArrayList<BrandNewsDTO> brandNewsList() throws SQLException;
}
