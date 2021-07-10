package dev.department.subscribe.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class CartListDTO {
	int couponNo;
	int productNo;
	int memberNo;
	String name;
	int categoryproductNo;
	int qty;
	int productPrice;
	int memberPrice;
	int totalPrice;
	int views;
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
