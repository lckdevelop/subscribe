package dev.department.subscribe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.SalesDAO;
import dev.department.subscribe.dto.ReserveCntParamDTO;
import dev.department.subscribe.dto.SalesParamDTO;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SalesDAO salesDAO;

	@Override
	public int getMothlyEarn(SalesParamDTO salesParamDTO) throws Exception {
		return salesDAO.getMonthlyEarn(salesParamDTO);
	}

	@Override
	public int getDailyEarn(SalesParamDTO salesParamDTO) throws Exception {
		return salesDAO.getDailyEarn(salesParamDTO);
	}

	@Override
	public List<String> getCurrentTwelveMonth() throws Exception {
		return salesDAO.getCurrentTwelveMonth();
	}

	@Override
	public List<Integer> getAnnualEarnData(SalesParamDTO salesParamDTO) throws Exception {
		return salesDAO.getAnnualEarnData(salesParamDTO);
	}

	@Override
	public List<Integer> getSubsDistribution(SalesParamDTO salesParamDTO) throws Exception {
		return salesDAO.getSubsDistribution(salesParamDTO);
	}
	
}
