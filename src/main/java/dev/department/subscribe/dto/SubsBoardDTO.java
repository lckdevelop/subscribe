package dev.department.subscribe.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubsBoardDTO {
	int no;
	int brandNo;
	String thumbnail;
	String title;
	String content;
	int contentSeq;
	int storeNo;
}
