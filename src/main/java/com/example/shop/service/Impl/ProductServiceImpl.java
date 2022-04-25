package com.example.shop.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.shop.model.Product;
import com.example.shop.repository.ProductRepository;
import com.example.shop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	@Override
	public Product findById(long id) {
		// TODO Auto-generated method stub
		return productRepository.findById(id);
	}

	@Override
	public Product deleteById(long id) {
		// TODO Auto-generated method stub
		return productRepository.deleteById(id);
	}

	@Override
	public Product findAllById(long id) {
		// TODO Auto-generated method stub
		return productRepository.findAllById(id);
	}

	@Override
	public List<Product> findAllByCategoryId(long id) {
		// TODO Auto-generated method stub
		return productRepository.findAllByCategoryId(id);
	}

	@Override
	public Page<Product> findByNameLike(String keywords, Pageable pageable) {
		// TODO Auto-generated method stub
		return productRepository.findByNameLike(keywords, pageable);
	}

	@Override
	public Page<Product> findByCategoryId(long keywords, Pageable pageable) {
		// TODO Auto-generated method stub
		return productRepository.findByCategoryId(keywords, pageable);
	}

	@Override
	public Page<Product> findByPriceBetween(double a, double b, Pageable pageable) {
		// TODO Auto-generated method stub
		return productRepository.findByPriceBetween(a, b, pageable);
	}

	@Override
	public Page<Product> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return productRepository.findAll(pageable);
	}

	@Override
	public Product save(Product product) {
		// TODO Auto-generated method stub
		return productRepository.save(product);
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}

	
	
}
