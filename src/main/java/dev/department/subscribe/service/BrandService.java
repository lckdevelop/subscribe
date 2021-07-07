package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.Map;

import dev.department.subscribe.dto.BrandDTO;

public interface BrandService {

	ArrayList<BrandDTO> getNotSubscribedBrands(int memberNo) throws Exception;

	ArrayList<BrandDTO> getSubscribedBrands(int memberNo) throws Exception;

	void deleteSubscribe(Map<String, Integer> deleteInfo) throws Exception;

	void insertSubscribe(Map<String, Integer> insertInfo) throws Exception;

	BrandDTO getBrandInfo(int brandNo) throws Exception;

	void plusSubscribeCount(int brandNo) throws Exception;

	void minusSubscribeCount(int brandNo) throws Exception;

	ArrayList<BrandDTO> getAllBrands() throws Exception;

}
