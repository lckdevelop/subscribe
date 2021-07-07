package dev.department.subscribe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.ReserveDAO;
import dev.department.subscribe.dto.PagingDTO;
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
	public int getUnpremittedVisitCnt(String search) throws Exception {
		return reserveDAO.getUnpermittedVisitCnt(search);
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
	public int getReserveCnt(String search) throws Exception {
		return reserveDAO.getReserveCnt(search);
	}

	@Override
	public PagingDTO getReserveList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList1(reserveDAO.getReserveList(pagingDTO));
		return pagingDTO;
	}

	@Override
	public int getTodayReserveCnt(String search) throws Exception {
		return reserveDAO.getTodayReserveCnt(search);
	}

	@Override
	public PagingDTO getTodayReserveList(PagingDTO pagingDTO) throws Exception {
		pagingDTO.setList1(reserveDAO.getTodayReserveList(pagingDTO));
		return pagingDTO;
	}
}
