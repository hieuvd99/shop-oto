package com.example.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.shop.model.Category;

public interface CategoryService {
	List<Category> findAll();
	Category findById(long id);
	Page<Category> findByNameLike(String keywords, Pageable pageable);
	Category deleteById(long id);
}
