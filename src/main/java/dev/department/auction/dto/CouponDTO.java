package dev.department.auction.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
}
