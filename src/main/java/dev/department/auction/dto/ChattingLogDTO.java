package dev.department.auction.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingLogDTO {
	int no;
	int auctionProductNo;
	Date chatDate;
	int memberNo;
}
