package com.maru.service.book;

import java.util.List;

import com.maru.domain.book.BookDto;

public interface BookService {

	int insert(BookDto book);

	List<BookDto> bookList(BookDto book, String member_userId);

	int remove(int number);




}
