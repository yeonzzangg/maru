package com.maru.domain.book;

import lombok.Data;

@Data
public class BookDto {
	private int number;
	private String member_userId;
	private String name;
	private String bookDate;
	private String bookTime;
	private int personnel;
	
}
