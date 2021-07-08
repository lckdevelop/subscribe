package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface PickupService {

	int getTodayPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	PagingDTO getTodayPickupList(PagingDTO pagingDTO) throws Exception;

	int getPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	PagingDTO getPickupList(PagingDTO pagingDTO) throws Exception;

	void pickupPermit(ReservePermitDTO reservePermitDTO) throws Exception;

	List<FullCalendarDTO> getPickupCalendarData(CalendarParamDTO calendarParamDTO) throws Exception;

}
