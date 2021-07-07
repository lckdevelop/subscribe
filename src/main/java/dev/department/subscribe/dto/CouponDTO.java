package dev.department.subscribe.dto;

import java.sql.*;

import lombok.*;

@Getter
@Setter
@ToString
public class CouponDTO {
	int no;
	int memberNo;
	int brandNo;
	String title;
	int classification;
	int amount;
	Date duetime;
	int type;
	Date useddate;
	String brandname;
	String brandengname;
	String typetemp;
	String duetimetemp;
}
