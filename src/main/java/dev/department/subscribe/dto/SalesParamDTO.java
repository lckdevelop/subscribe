package dev.department.subscribe.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SalesParamDTO {

	private int brandNo;
	private int storeNo;
	Date date;
}
