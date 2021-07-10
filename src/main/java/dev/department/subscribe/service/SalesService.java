package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.SalesParamDTO;

public interface SalesService {

	int getMothlyEarn(SalesParamDTO salesParamDTO) throws Exception;

	int getDailyEarn(SalesParamDTO salesParamDTO) throws Exception;

	List<String> getCurrentTwelveMonth() throws Exception;

	List<Integer> getAnnualEarnData(SalesParamDTO salesParamDTO) throws Exception;

	List<Integer> getSubsDistribution(SalesParamDTO salesParamDTO) throws Exception;

}
