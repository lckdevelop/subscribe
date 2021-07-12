package dev.department.subscribe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.PickupDAO;
import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReservePermitDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PickupServiceImpl implements PickupService {

	@Autowired
	PickupDAO pickupDAO;
	
	@Override
	public int getTodayPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception {
		return pickupDAO.getTodayPickupCnt(reserveCntParamDTO);
	}

	@Override
	public PagingDTO getTodayPickupList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList2(pickupDAO.getTodayPickupList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public int getPickupCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception {
		return pickupDAO.getPickupCnt(reserveCntParamDTO);
	}

	@Override
	public PagingDTO getPickupList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList2(pickupDAO.getPickupList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public void pickupPermit(ReservePermitDTO reservePermitDTO) throws Exception {
		pickupDAO.pickupPermit(reservePermitDTO);
	}

	@Override
	public List<FullCalendarDTO> getPickupCalendarData(CalendarParamDTO calendarParamDTO) throws Exception {
		return pickupDAO.getPickupCalendarData(calendarParamDTO);
	}

	@Override
	public int getBrandNo(int parseInt) throws Exception {
		return pickupDAO.getBrandNo(parseInt);
	}

}
