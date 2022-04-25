package com.example.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.shop.model.Product;

public interface ProductService {
	List<Product> findAll();
	Product findById(long id);

	Product deleteById(long id);

	Product findAllById(long id);

	List<Product> findAllByCategoryId(long id);
	
	Page<Product> findAll(Pageable pageable);
	
	Product save(Product product);

	Page<Product> findByNameLike(String keywords, Pageable pageable);

	Page<Product> findByCategoryId(long keywords, Pageable pageable);

	Page<Product> findByPriceBetween(double a, double b, Pageable pageable);
	
	
}
