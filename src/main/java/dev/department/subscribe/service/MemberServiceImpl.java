package dev.department.subscribe.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.MemberDAO;
import dev.department.subscribe.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public boolean idDuplicateCheck(String id) throws Exception {
		return memberDAO.idDuplicateCheck(id);
	}

	@Override
	public void memberJoin(MemberDTO memberDTO) throws Exception {
		String endcodedPassword = bcryptPasswordEncoder.encode(memberDTO.getPassword());
		memberDTO.setPassword(endcodedPassword);
		memberDAO.memberJoin(memberDTO);
	}
	
	@Override
	public int getMemberNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberNo(id);
	}
}
