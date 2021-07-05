package dev.department.subscribe.sec;

import java.sql.SQLException;

import dev.department.subscribe.dto.MemberDTO;

public interface MemberInfoDAO {
	MemberDTO memberInfo(String id) throws SQLException;
}
