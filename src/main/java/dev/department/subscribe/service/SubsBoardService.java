package dev.department.subscribe.service;

import dev.department.subscribe.dto.SubsBoardDTO;

public interface SubsBoardService {

	void insertSubsBoard(SubsBoardDTO sbDTO) throws Exception;

	SubsBoardDTO getSubsBoardInfo(int subsBoardNo) throws Exception;

}
