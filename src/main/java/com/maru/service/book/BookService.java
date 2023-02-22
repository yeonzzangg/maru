package com.maru.service.book;

import java.util.List;

import com.maru.domain.book.BookDto;
import com.maru.domain.notice.PageInfo;

public interface BookService {

	int insert(BookDto book);

	List<BookDto> bookList(BookDto book, String member_userId);

	int remove(int number);

	// 전체목록
	List<BookDto> listBook(int page, String type, String keyword, PageInfo pageInfo);




}
