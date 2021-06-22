package dev.department.auction.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	int no;
	String name;
	String id;
	String password;
	String email;
	Date birthdate;
	String phone;
	String address;
	int premoney;
	int point;
	int role;
	int brandNo;
}
