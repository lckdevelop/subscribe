package dev.department.subscribe.dao;

import java.sql.SQLException;

import dev.department.subscribe.dto.SubsBoardProDTO;

public interface SubsBoardProDAO {

	void insertSubsBoardPro(SubsBoardProDTO sbpDTO) throws SQLException;

}
