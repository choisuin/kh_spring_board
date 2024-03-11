package com.spring.common.vo;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

@Data
//@ToString
//@Setter
//@Getter
public class CommonVO {
	//페이지 번호, 페이지 수
	private int pageNum = 0;
	private int amount = 0;
	
	//검색 대상, 사용 단어
	private String search = "";
	private String keyword = "";
	
	//날짜검색의 시작일, 종료일
	private String startDate = "";
	private String endDate = "";
	
	public CommonVO() {
		this(1,10);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
