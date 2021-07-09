package dev.department.subscribe.sec;

import java.sql.SQLException;

import dev.department.subscribe.dto.MemberDTO;

public interface MemberInfoDAO {
	String divisionMember(String id) throws SQLException;
	MemberDTO memberInfo(String id) throws SQLException;
	MemberDTO managerInfo(String id) throws SQLException;
}
