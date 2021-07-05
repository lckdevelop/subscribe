package dev.department.subscribe.service;

import java.util.List;

import dev.department.subscribe.dto.PagingDTO;
import dev.department.subscribe.dto.ReserveListDTO;

public interface ReserveService {

	List<ReserveListDTO> getUnpermittedVisitList(PagingDTO pagingDTO) throws Exception;

}
