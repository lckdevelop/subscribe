package dev.department.subscribe.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AuctionLogDTO {
	int no;
	int auctionProductNo;
	int memberNo;
	int bidPrice;
	Date bidDate;
}
