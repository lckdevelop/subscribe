package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import dev.department.subscribe.dto.ReservePermitDTO;

public interface ReserveService {

	PagingDTO getUnpermittedVisitList(PagingDTO pagingDTO) throws Exception;

	int getUnpremittedVisitCnt(String search) throws Exception;

	void permitReserve(ReservePermitDTO reservePermitDTO) throws Exception;

	void refuseReserve(ReservePermitDTO reservePermitDTO) throws Exception;

	int getReserveCnt(String search) throws Exception;

	PagingDTO getReserveList(PagingDTO pagingDTO) throws Exception;

	int getTodayReserveCnt(String search) throws Exception;

	PagingDTO getTodayReserveList(PagingDTO pagingDTO) throws Exception;



}
