package dev.department.subscribe.dao;

import java.sql.SQLException;

import dev.department.subscribe.dto.MemberDTO;

public interface MemberDAO {
	boolean idDuplicateCheck(String id) throws SQLException;
	void memberJoin(MemberDTO memberDTO) throws SQLException;
}
