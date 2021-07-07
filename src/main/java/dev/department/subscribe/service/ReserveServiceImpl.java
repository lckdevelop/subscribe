package dev.department.subscribe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.ReserveDAO;
import dev.department.subscribe.dto.CalendarParamDTO;
import dev.department.subscribe.dto.FullCalendarDTO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.ReservePermitDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDAO reserveDAO;
	
	@Override
	public PagingDTO getUnpermittedVisitList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList1(reserveDAO.getUnpermittedVisitList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public int getUnpremittedVisitCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception {
		return reserveDAO.getUnpermittedVisitCnt(reserveCntParamDTO);
	}

	@Override
	public void permitReserve(ReservePermitDTO reservePermitDTO) throws Exception {
		reserveDAO.permitReserve(reservePermitDTO);
	}

	@Override
	public void refuseReserve(ReservePermitDTO reservePermitDTO) throws Exception {
		reserveDAO.refuseReserve(reservePermitDTO);		
	}

	@Override
	public int getReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception {
		return reserveDAO.getReserveCnt(reserveCntParamDTO);
	}

	@Override
	public PagingDTO getReserveList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList1(reserveDAO.getReserveList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public int getTodayReserveCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception {
		return reserveDAO.getTodayReserveCnt(reserveCntParamDTO);
	}

	@Override
	public PagingDTO getTodayReserveList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList1(reserveDAO.getTodayReserveList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public List<FullCalendarDTO> getCalendarData(CalendarParamDTO calendarParamDTO) throws Exception {
		return reserveDAO.getCalendarData(calendarParamDTO);
	}

	@Override
	public void reserveVisit(ReservePermitDTO reservePermitDTO) throws Exception {
		reserveDAO.reserveVisit(reservePermitDTO);
	}

}
