package dev.department.subscribe.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.BrandDAO;
import dev.department.subscribe.dto.BrandDTO;

@Service
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	@Resource(name="brandDAO")
	private BrandDAO brandDAO;

	@Override
	public ArrayList<BrandDTO> getNotSubscribedBrands(int memberNo) throws Exception{
		// TODO Auto-generated method stub
			return brandDAO.getNotSubscribedBrands(memberNo);
	}

	@Override
	public ArrayList<BrandDTO> getSubscribedBrands(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return brandDAO.getSubscribedBrand(memberNo);
	}

	@Override
	public void deleteSubscribe(Map<String, Integer> deleteInfo) throws Exception {
		// TODO Auto-generated method stub
		brandDAO.deleteSubscribe(deleteInfo);
	}

	@Override
	public void insertSubscribe(Map<String, Integer> insertInfo) throws Exception {
		// TODO Auto-generated method stub
		brandDAO.insertSubscribe(insertInfo);
	}

}
