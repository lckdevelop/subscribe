package dev.department.subscribe.service;

import java.util.ArrayList;

import dev.department.subscribe.dto.MemberDTO;

public interface MailService {
	
	public ArrayList<MemberDTO> getReceiverInfo(int brandNo) throws Exception;

	public int getSubsCount(int brandNo) throws Exception; 

}
