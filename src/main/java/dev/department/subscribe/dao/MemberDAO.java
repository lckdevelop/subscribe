package dev.department.subscribe.dao;

import java.sql.SQLException;

import dev.department.subscribe.dto.MemberDTO;

public interface MemberDAO {

	public int getMemberNo(String id) throws SQLException;
	boolean idDuplicateCheck(String id) throws SQLException;
	void memberJoin(MemberDTO memberDTO) throws SQLException;
	public MemberDTO getAdminIdentifier(String id) throws SQLException;
}