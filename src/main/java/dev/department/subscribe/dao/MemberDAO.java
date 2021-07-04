package dev.department.subscribe.dao;

import java.sql.SQLException;

public interface MemberDAO {

	public int getMemberNo(String id) throws SQLException;

}
