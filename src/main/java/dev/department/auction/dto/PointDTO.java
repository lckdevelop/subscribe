package dev.department.auction.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PointDTO {
	int no;
	int memberNo;
	int amount;
	Date regdate;
	String log;
}
