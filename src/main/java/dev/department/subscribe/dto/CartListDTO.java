package dev.department.subscribe.dto;


import java.sql.*;

import lombok.*;

@Getter
@Setter
@ToString
public class CartListDTO {
	int couponNo;
	int productNo;
	int memberNo;
	int status;
	String name;
	int categoryproductNo;
	int qty;
	int productPrice;
	int memberPrice;
	int totalPrice;
	int views;
	Date orderdate;
	String shoesize;
	String clothsize;
	String productsize;
	String brandname;
	String brandengname;
	String thumbnail;
    String memberName;
    String email;
    String phone;
}
