package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.MemberDTO;

public interface MailDAO {

	ArrayList<MemberDTO> getReceiverInfo(int brandNo) throws SQLException;

	int getSubsCount(int brandNo) throws SQLException;

}
