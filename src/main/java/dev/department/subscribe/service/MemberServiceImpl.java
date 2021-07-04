package dev.department.subscribe.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	@Resource(name="memberDAO")
	MemberDAO memberDAO;

	@Override
	public int getMemberNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberNo(id);
	}

}
