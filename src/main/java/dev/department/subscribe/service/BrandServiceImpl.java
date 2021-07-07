package dev.department.subscribe.service;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.BrandDAO;
import dev.department.subscribe.dao.IndexDAO;
import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;

@Service
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	@Resource(name="brandDAO")
	private BrandDAO brandDAO;
	
	@Autowired
	private IndexDAO indexDAO;

	@Override
	public ArrayList<BrandDTO> getNotSubscribedBrands(int memberNo) throws Exception{
			return brandDAO.getNotSubscribedBrands(memberNo);
	}

	@Override
	public ArrayList<BrandDTO> getSubscribedBrands(int memberNo) throws Exception {
		return brandDAO.getSubscribedBrand(memberNo);
	}

	@Override
	public void deleteSubscribe(Map<String, Integer> deleteInfo) throws Exception {
		brandDAO.deleteSubscribe(deleteInfo);
	}

	@Override
	public void insertSubscribe(Map<String, Integer> insertInfo) throws Exception {
		brandDAO.insertSubscribe(insertInfo);
	}

	@Override
	public BrandDTO getBrandInfo(int brandNo) throws Exception {
		return brandDAO.getBrandInfo(brandNo);
	}

	@Override
	public ArrayList<BrandNewsDTO> brandNewsList() throws Exception {
		return indexDAO.brandNewsList();
	}

}
