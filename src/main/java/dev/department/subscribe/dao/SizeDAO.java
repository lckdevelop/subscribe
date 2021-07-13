package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dev.department.subscribe.dto.SizeDTO;

public interface SizeDAO {

	ArrayList<SizeDTO> getClothSize() throws SQLException;

	ArrayList<SizeDTO> getShoeSize() throws SQLException;

}
