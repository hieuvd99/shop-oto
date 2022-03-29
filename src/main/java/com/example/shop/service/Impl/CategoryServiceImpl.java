package com.example.shop.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.shop.model.Category;
import com.example.shop.repository.CategoryRepository;
import com.example.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	@Override
	public Category findById(long id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

	@Override
	public Page<Category> findByNameLike(String keywords, Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findByNameLike(keywords, pageable);
	}

	@Override
	public Category deleteById(long id) {
		// TODO Auto-generated method stub
		return categoryRepository.deleteById(id);
	}

	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}

	@Override
	public Page<Category> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findAll(pageable);
	}

	@Override
	public Category save(Category category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(category);
	}

}
