package com.example.shop.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Order;
import com.example.shop.model.OrderDetail;
import com.example.shop.repository.OrderDetailRepository;
import com.example.shop.service.OrderDetailService;
import com.example.shop.service.OrderService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@Override
	public List<OrderDetail> findAllByOrder_Id(long id) {
		// TODO Auto-generated method stub
		return orderDetailRepository.findAllByOrder_Id(id);
	}
	@Override
	public OrderDetail save(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return orderDetailRepository.save(orderDetail);
	}

	

}
