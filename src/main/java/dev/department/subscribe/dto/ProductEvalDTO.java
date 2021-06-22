package dev.department.subscribe.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductEvalDTO {
	int no;
	int brandNo;
	String status;
	int startPrice;
}
