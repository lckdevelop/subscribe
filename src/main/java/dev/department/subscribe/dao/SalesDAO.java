package dev.department.subscribe.dao;

import java.sql.SQLException;
import java.util.List;

import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.SalesParamDTO;

public interface SalesDAO {

	int getMonthlyEarn(SalesParamDTO salesParamDTO) throws SQLException;

	int getDailyEarn(SalesParamDTO salesParamDTO) throws SQLException;

	List<String> getCurrentTwelveMonth() throws SQLException;

	List<Integer> getAnnualEarnData(SalesParamDTO salesParamDTO) throws SQLException;

	List<Integer> getSubsDistribution(SalesParamDTO salesParamDTO) throws SQLException;

	List<String> getCurrentTenDays() throws SQLException;

	List<Integer> getDailyEarnData(SalesParamDTO salesParamDTO) throws SQLException;

}
