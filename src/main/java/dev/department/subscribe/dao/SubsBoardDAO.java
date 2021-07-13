package dev.department.subscribe.dao;

import java.sql.SQLException;

import dev.department.subscribe.dto.SubsBoardDTO;

public interface SubsBoardDAO {

	void insertSubsBoard(SubsBoardDTO sbDTO) throws SQLException;

}
