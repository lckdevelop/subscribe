package dev.department.subscribe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.SubsBoardDAO;
import dev.department.subscribe.dto.SubsBoardDTO;

@Service
public class SubsBoardServiceImpl implements SubsBoardService {
	@Autowired
	SubsBoardDAO subsBoardDAO;

	@Override
	public void insertSubsBoard(SubsBoardDTO sbDTO) throws Exception {
		// TODO Auto-generated method stub
		subsBoardDAO.insertSubsBoard(sbDTO);
	}

	@Override
	public SubsBoardDTO getSubsBoardInfo(int subsBoardNo) throws Exception {
		// TODO Auto-generated method stub
		return subsBoardDAO.getSubsBoardInfo(subsBoardNo);
	}

}
