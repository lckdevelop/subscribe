package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.List;

import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface ReserveDAO {

	List<ReserveListDTO> getUnpermittedVisitList(PagingDTO pagingDTO) throws SQLException;

	int getUnpermittedVisitCnt(ReserveCntParamDTO reserveCntParamDTO) throws SQLException;

	void permitReserve(ReservePermitDTO reservePermitDTO) throws SQLException;

	void refuseReserve(ReservePermitDTO reservePermitDTO) throws SQLException;

	int getReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws SQLException;

	List<ReserveListDTO> getReserveList(PagingDTO pagingDTO) throws SQLException;

	int getTodayReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws SQLException;

	List<ReserveListDTO> getTodayReserveList(PagingDTO pagingDTO) throws SQLException;

	List<FullCalendarDTO> getCalendarData(CalendarParamDTO calendarParamDTO) throws SQLException;

	void reserveVisit(ReservePermitDTO reservePermitDTO) throws SQLException;

}
