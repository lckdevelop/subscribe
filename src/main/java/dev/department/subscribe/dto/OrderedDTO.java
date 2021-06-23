package dev.department.subscribe.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderedDTO {
	int no;
	int memberNo;
	Date orderDate;
	int status;
	int delivery;
	int price;
	int usedPoint;
	int recieve;
	Date reserveDate;
}
