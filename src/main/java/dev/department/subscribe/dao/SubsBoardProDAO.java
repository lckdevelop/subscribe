package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.SubsBoardProDTO;

public interface SubsBoardProDAO {

	void insertSubsBoardPro(SubsBoardProDTO sbpDTO) throws SQLException;

	ArrayList<SubsBoardProDTO> getSubsBoardPro(int subsBoardNo) throws SQLException;

}
