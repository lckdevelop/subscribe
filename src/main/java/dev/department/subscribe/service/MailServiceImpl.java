package dev.department.subscribe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.MailDAO;
import dev.department.subscribe.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	MailDAO mailDAO;

	@Override
	public ArrayList<MemberDTO> getReceiverInfo(int brandNo) throws Exception {
		
		return mailDAO.getReceiverInfo(brandNo);
	}

	@Override
	public int getSubsCount(int brandNo) throws Exception {
		
		return mailDAO.getSubsCount(brandNo);
	}



}
