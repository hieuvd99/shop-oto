package com.example.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long>{
	List<Category> findAll();
	Category findById(long id);
	Page<Category> findByNameLike(String keywords, Pageable pageable);
	Category deleteById(long id);
}
