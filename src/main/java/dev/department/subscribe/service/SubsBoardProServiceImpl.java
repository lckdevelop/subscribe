package dev.department.subscribe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.SubsBoardProDAO;
import dev.department.subscribe.dto.SubsBoardProDTO;

@Service
public class SubsBoardProServiceImpl implements SubsBoardProService{

	@Autowired
	SubsBoardProDAO subsBoardProDAO;
	
	@Override
	public void insertSubsBoardPro(SubsBoardProDTO sbpDTO) throws Exception {
		// TODO Auto-generated method stub
		subsBoardProDAO.insertSubsBoardPro(sbpDTO);
	}

}
