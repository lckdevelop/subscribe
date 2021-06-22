package dev.department.auction.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {
	int no;
	String name;
	String content;
	int price;
	String thumbnail;
	int views;
	int zzimCount;
	int cartNo;
	int zzimNo;
	int subsboardproNo;
	int brandNo;
	int categoryNo;
}
