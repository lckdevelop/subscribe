package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.SalesParamDTO;

public interface SalesService {

	int getMothlyEarn(SalesParamDTO salesParamDTO) throws Exception;

	int getDailyEarn(SalesParamDTO salesParamDTO) throws Exception;

	List<String> getCurrentTwelveMonth() throws Exception;

	List<Integer> getAnnualEarnData(SalesParamDTO salesParamDTO) throws Exception;

	List<Integer> getSubsDistribution(SalesParamDTO salesParamDTO) throws Exception;

	List<String> getCurrentTenDays() throws Exception;

	List<Integer> getDailyEarnData(SalesParamDTO salesParamDTO) throws Exception;

	int getAccumListCnt(ReserveCntParamDTO reserveCntParamDTO) throws Exception;

	PagingDTO getAccumList(PagingDTO pagingDTO) throws Exception;

	int getLastMonthEarn(SalesParamDTO salesParamDTO) throws Exception;

	int getLastDayEarn(SalesParamDTO salesParamDTO) throws Exception;

}
