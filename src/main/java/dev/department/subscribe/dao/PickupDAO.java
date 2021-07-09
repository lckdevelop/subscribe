package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.List;

import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.PickupListDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface PickupDAO {

	int getTodayPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws SQLException;

	List<PickupListDTO> getTodayPickupList(PagingDTO pagingDTO) throws SQLException;

	int getPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws SQLException;

	List<PickupListDTO> getPickupList(PagingDTO pagingDTO) throws SQLException;

	void pickupPermit(ReservePermitDTO reservePermitDTO) throws SQLException;

	List<FullCalendarDTO> getPickupCalendarData(CalendarParamDTO calendarParamDTO) throws SQLException;

}
