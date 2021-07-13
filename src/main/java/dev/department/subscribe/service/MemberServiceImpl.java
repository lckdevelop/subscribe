package dev.department.subscribe.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.IndexDAO;
import dev.department.subscribe.dao.MemberDAO;
import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MemberDTO;
import dev.department.subscribe.dto.SubsDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private IndexDAO IndexDAO;
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
		return memberDAO.getMemberNo(id);
	}
	
	@Override
	public ArrayList<BrandDTO> getBranSubsList(int memNo) throws Exception {
		return IndexDAO.getBranSubsList(memNo);
	}
	
	@Override
	public ArrayList<BrandDTO> getMemSubs(int memNo) throws Exception {
		return IndexDAO.getMemSubs(memNo);
	}

	@Override
	public ArrayList<BrandDTO> getMemNotSubs(int memNo) throws Exception {
		return IndexDAO.getMemNotSubs(memNo);
	}

	@Override
	public String brandSubsAction(int brandNo, int subsed, int memberNo) throws Exception {
		int subsResult = 0;
		int updResult = 0;
		String result = "실패";
		
		if (subsed == 1) {
			subsResult = IndexDAO.brandSubsCancel(new SubsDTO(brandNo, memberNo));
			updResult = IndexDAO.subsCntMinUpdate(brandNo);
			
			if (subsResult == 1 && updResult == 1) {
				result = "취소완료";
			}
		} else {
			subsResult = IndexDAO.brandSubsEnroll(new SubsDTO(brandNo, memberNo));
			updResult = IndexDAO.subsCntPlusUpdate(brandNo);
			
			if (subsResult == 1 && updResult == 1) {
				result = "구독완료";
			}
		}
		
		return result;
	}

	@Override
	public MemberDTO getAdminIdentifier(String id) throws Exception {
		return memberDAO.getAdminIdentifier(id);
	}

	@Override
	public void welcomePoint(int memberNo) throws SQLException {
		memberDAO.welcomePoint(memberNo);
	}

}
