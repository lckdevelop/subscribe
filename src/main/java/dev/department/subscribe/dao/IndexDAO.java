package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.SubsDTO;
import dev.department.subscribe.dto.ZzimDTO;

public interface IndexDAO {
	ArrayList<BrandDTO> getBranSubsList(int memNo) throws SQLException;
	
	ArrayList<BrandDTO> getMemSubs(int memNo) throws SQLException;
	
	ArrayList<BrandDTO> getMemNotSubs(int memNo) throws SQLException;
	
	int brandSubsCancel(SubsDTO subsDTO) throws SQLException;
	
	int subsCntMinUpdate(int brandNo) throws SQLException;
	
	int brandSubsEnroll(SubsDTO subsDTO) throws SQLException;
	
	int subsCntPlusUpdate(int brandNo) throws SQLException;
	
	ArrayList<BrandNewsDTO> brandNewsList() throws SQLException;
	
	ArrayList<ProductDTO> getBestSellers() throws SQLException;
	
	ArrayList<ProductDTO> getNewProducts() throws SQLException;
	
	ArrayList<ProductDTO> getBestSellersFromSubs(int memNo) throws SQLException;
	
	ArrayList<ProductDTO> getNewProductsFromSubs(int memNo) throws SQLException;
	
	ArrayList<ProductDTO> selectByKeyword(String keyWord) throws SQLException;
	
	int zzimCheck(ZzimDTO zzimDTO) throws SQLException;
	
	int updateZzimCnt(int productNo) throws SQLException;
	
	int insertZzim(ZzimDTO zzimDTO) throws SQLException;
}
