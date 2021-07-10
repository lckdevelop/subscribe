package dev.department.subscribe.dto;

import java.sql.*;

import lombok.*;

@Getter
@Setter
@ToString
public class OrderedDTO {
	int no;
	int memberNo;
	int storeNo;
	Date orderDate;
	int status;
	int delivery;
	int price;
	int usedPoint;
	int recieve;
	String address;
	String reserveDate;
}
