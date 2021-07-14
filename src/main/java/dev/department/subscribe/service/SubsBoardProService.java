package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.SubsBoardProDTO;

public interface SubsBoardProService {

	void insertSubsBoardPro(SubsBoardProDTO sbpDTO) throws Exception;

	ArrayList<SubsBoardProDTO> getSubsBoardPro(int subsBoardNo) throws Exception;

}
