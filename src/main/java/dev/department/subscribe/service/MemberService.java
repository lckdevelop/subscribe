package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.MemberDTO;

public interface MemberService {
	boolean idDuplicateCheck(String id) throws Exception;
	void memberJoin(MemberDTO memberDTO) throws Exception;
	int getMemberNo(String string) throws Exception;
}
