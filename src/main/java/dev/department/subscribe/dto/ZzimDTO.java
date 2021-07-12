package dev.department.subscribe.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ZzimDTO {
	int no;
	int memberNo;
	int productNo;
	
	public ZzimDTO(int productNo, int memberNo) {
		this.productNo = productNo;
		this.memberNo = memberNo;
	}
}
