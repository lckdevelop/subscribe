package dev.department.subscribe.dto;

import lombok.*;

@Getter
@Setter
public class ReservationDTO {
	private int no;
	private int brandNo;
	private int memberNo;
	private String restime;
	private int kind;
	private int status;
	private String memo;
	private int storeNo;
	
}
