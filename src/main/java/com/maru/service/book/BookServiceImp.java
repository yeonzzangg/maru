package com.maru.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maru.domain.book.BookDto;
import com.maru.mapper.book.BookMapper;

@Service
@Transactional
public class BookServiceImp implements BookService {
	
	@Autowired
	private BookMapper mapper;
	
	
	@Override
	public int insert(BookDto book) {
		return mapper.insert(book); 
	}
	
	@Override
	public List<BookDto> bookList(BookDto book, String member_userId){
		return mapper.bookList(book, member_userId);
	}
	
	@Override
	public int remove(int number) {
		return mapper.delete(number);
	}
}
