package dev.department.subscribe.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AuctionProductDTO {
	int no;
	int productEvalNo;
	int brandNo;
	String name;
	String content;
	int curPrice;
	int endPrice;
	String thumbnail;
	String textile;
	int categoryNo;
	Date startDate;
	Date endDate;
	int status;
}
