package dev.department.subscribe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.ReserveDAO;
import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDAO reserveDAO;
	
	@Override
	public List<ReserveListDTO> getUnpermittedVisitList(PagingDTO pagingDTO) throws Exception {

		return reserveDAO.getUnpermittedVisitList(pagingDTO);
	}

}
