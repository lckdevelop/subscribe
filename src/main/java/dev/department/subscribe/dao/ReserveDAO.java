package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.List;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface ReserveDAO {

	List<ReserveListDTO> getUnpermittedVisitList(PagingDTO pagingDTO) throws SQLException;

	int getUnpermittedVisitCnt(String search) throws SQLException;

	void permitReserve(ReservePermitDTO reservePermitDTO) throws SQLException;

	void refuseReserve(ReservePermitDTO reservePermitDTO) throws SQLException;

	int getReserveCnt(String search) throws SQLException;

	List<ReserveListDTO> getReserveList(PagingDTO pagingDTO) throws SQLException;

	int getTodayReserveCnt(String search) throws SQLException;

	List<ReserveListDTO> getTodayReserveList(PagingDTO pagingDTO) throws SQLException;

}
