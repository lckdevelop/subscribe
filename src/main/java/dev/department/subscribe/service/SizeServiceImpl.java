package dev.department.subscribe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.SizeDAO;
import dev.department.subscribe.dto.SizeDTO;

@Service
public class SizeServiceImpl implements SizeService{

	@Autowired
	private SizeDAO sizeDAO;
	
	@Override
	public ArrayList<SizeDTO> getClothSize() throws Exception {
		// TODO Auto-generated method stub
		return sizeDAO.getClothSize();
	}

	@Override
	public ArrayList<SizeDTO> getShoeSize() throws Exception {
		// TODO Auto-generated method stub
		return sizeDAO.getShoeSize();
	}

}
