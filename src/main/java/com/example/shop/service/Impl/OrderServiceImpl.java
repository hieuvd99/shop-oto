package com.example.shop.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Order;
import com.example.shop.repository.OrderRepository;
import com.example.shop.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderRepository orderRepository;
	@Override
	public List<Order> findAllByAccount_Id(long id) {
		// TODO Auto-generated method stub
		return orderRepository.findAllByAccount_Id(id);
	}

	@Override
	public List<Order> findAllById(long id) {
		// TODO Auto-generated method stub
		return orderRepository.findAllById(id);
	}

	@Override
	public Order save(Order order) {
		// TODO Auto-generated method stub
		return orderRepository.save(order);
	}

	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return orderRepository.findAll();
	}

	@Override
	public Float selectTotals() {
		// TODO Auto-generated method stub
		return orderRepository.selectTotals();
	}

	@Override
	public Float selectTotalsMonth() {
		// TODO Auto-generated method stub
		return orderRepository.selectTotalsMonth();
	}

}
