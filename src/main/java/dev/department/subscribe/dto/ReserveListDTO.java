package dev.department.subscribe.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveListDTO {
	
	private int no;
	private String name;
	private Date restime;
	private int kind;
	private int status;
	private String memo;
	private String phone;
	
}
