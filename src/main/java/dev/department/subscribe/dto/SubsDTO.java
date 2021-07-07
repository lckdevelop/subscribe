package dev.department.subscribe.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubsDTO {
	int no;
	int memberNo;
	int brandNo;
	
	public SubsDTO(int brandNo, int memberNo) {
		this.brandNo = brandNo;
		this.memberNo = memberNo;
	}
}
