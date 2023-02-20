package com.maru.mapper.book;

import java.util.List;

import com.maru.domain.book.BookDto;

public interface BookMapper {

	int insert(BookDto book);

	BookDto select(int number);

	List<BookDto> bookList(BookDto book, String member_userId);

	int delete(int number);

}
