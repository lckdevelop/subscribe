package dev.department.auction.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderedProductDTO {
	int no;
	int productNo;
	int orderNo;
	int couponNo;
}
