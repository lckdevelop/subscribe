package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.dto.ProductDTO;

public interface IndexService {
	ArrayList<BrandDTO> getBranSubsList(int memNo) throws Exception;
	
	String brandSubsAction(int brandNo, int subsed, int memberNo) throws Exception;
	
	ArrayList<BrandNewsDTO> brandNewsList() throws Exception;
	
	ArrayList<ProductDTO> getBestSellers() throws Exception;
	
	ArrayList<ProductDTO> getNewProducts() throws Exception;
	
	ArrayList<ProductDTO> selectByKeyword(String keyWord) throws Exception;
}
