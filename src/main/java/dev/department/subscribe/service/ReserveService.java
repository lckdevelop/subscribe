package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface ReserveService {

	PagingDTO getUnpermittedVisitList(PagingDTO pagingDTO) throws Exception;

	int getUnpremittedVisitCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	void permitReserve(ReservePermitDTO reservePermitDTO) throws Exception;

	void refuseReserve(ReservePermitDTO reservePermitDTO) throws Exception;

	int getReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	PagingDTO getReserveList(PagingDTO pagingDTO) throws Exception;

	int getTodayReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	PagingDTO getTodayReserveList(PagingDTO pagingDTO) throws Exception;

	List<FullCalendarDTO> getCalendarData(CalendarParamDTO calendarParamDTO) throws Exception;

	void reserveVisit(ReservePermitDTO reservePermitDTO) throws Exception;

}
