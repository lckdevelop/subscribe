package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MemberDTO;

public interface MemberService {
	boolean idDuplicateCheck(String id) throws Exception;
	void memberJoin(MemberDTO memberDTO) throws Exception;
	int getMemberNo(String string) throws Exception;
	ArrayList<BrandDTO> getBranSubsList(int memNo) throws Exception;
	ArrayList<BrandDTO> getMemSubs(int memNo) throws Exception;
	ArrayList<BrandDTO> getMemNotSubs(int memNo) throws Exception;
	String brandSubsAction(int brandNo, int subsed, int memberNo) throws Exception;
}
