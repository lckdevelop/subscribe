package dev.department.subscribe.dto;

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
	int enabled;
	String email;
	Date birthdate;
	String phone;
	String address;
	int point;
	String role;
	int brandNo;
	int storeNo;
	String brandName;
}
