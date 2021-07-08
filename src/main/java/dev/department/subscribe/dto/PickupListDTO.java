package dev.department.subscribe.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PickupListDTO {

	private int no;
	private int orderNo;
	private String memberName;
	private String phone;
	private int productNo;
	private int brandNo;
	private String productName;
	private int price;
	private String clothsize;
	private String shoesize;
	private int qty;
	private int storeNo;
	private Date orderDate;
	private int status;
	private Date reserveDate;
	
}
