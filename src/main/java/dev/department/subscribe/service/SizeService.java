package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.SizeDTO;

public interface SizeService {

	ArrayList<SizeDTO> getClothSize() throws Exception;

	ArrayList<SizeDTO> getShoeSize() throws Exception;

}
