package dev.department.subscribe.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BrandNewsDTO {
	private int no;
	private String name;
	private String title;
	private String content;
	private Date uploaddate;
}
