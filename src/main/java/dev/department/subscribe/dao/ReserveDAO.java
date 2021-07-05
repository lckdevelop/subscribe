package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.List;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;

public interface ReserveDAO {

	List<ReserveListDTO> getUnpermittedVisitList(PagingDTO pagingDTO) throws SQLException;

}
