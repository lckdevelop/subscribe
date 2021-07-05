package dev.department.subscribe.dto;

import lombok.Data;

@Data
public class PagingDTO {
	
	long page;
	int pageSize;
	int pageBlock;
	long recordCount;
	long startNum;
	long endNum;
	long totalPage;
	long startPage;
	long endPage;
	String search;
	int brandNo;

	public PagingDTO() {
	}
	
	public PagingDTO(long page) {
		this.page = page;
		this.pageSize = 10;
		this.startNum = (page - 1) * pageSize + 1;
		this.endNum = pageSize * page;
	}

	public PagingDTO(long page, int pageSize) {
		this.page = page;
		this.startNum = (page - 1) * pageSize + 1;
		this.endNum = pageSize * page;
	}
	
	public PagingDTO(long page, long recordCount) {
		this.page = page;
		this.pageSize = 10;
		this.pageBlock = 5;
		this.recordCount = recordCount;

		this.totalPage = recordCount / pageSize;

		if (recordCount % pageSize > 0) {
			totalPage++;
		}

		startPage = (page - 1) / pageBlock * pageBlock + 1;
		endPage = (page - 1) / pageBlock * pageBlock + pageBlock;
		if (endPage > totalPage)
			endPage = totalPage;

	}

	public PagingDTO(long page, int pageSize, int pageBlock, long recordCount) {
		this.page = page;
		this.pageSize = pageSize;
		this.pageBlock = pageBlock;
		this.recordCount = recordCount;

		this.totalPage = recordCount / pageSize;

		if (recordCount % pageSize > 0) {
			totalPage++;
		}

		startPage = (page - 1) / pageBlock * pageBlock + 1;
		endPage = (page - 1) / pageBlock * pageBlock + pageBlock;
		if (endPage > totalPage)
			endPage = totalPage;

	}
}