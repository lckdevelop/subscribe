package dev.department.subscribe.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class CartListDTO {
	int productNo;
	int memberNo;
	String name;
	int qty;
	int productPrice;
	int memberPrice;
	int totalPrice;
	int views;
	String brandname;
	String brandengname;
	String thumbnail;
    String memberName;
    String email;
    String phone;
}
