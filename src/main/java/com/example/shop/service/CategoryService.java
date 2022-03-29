package com.example.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.shop.model.Category;
import com.example.shop.model.Product;

public interface CategoryService {
	List<Category> findAll();
	Page<Category> findAll(Pageable pageable);
	Category findById(long id);
	Page<Category> findByNameLike(String keywords, Pageable pageable);
	Category deleteById(long id);
	Category save(Category category);
}
