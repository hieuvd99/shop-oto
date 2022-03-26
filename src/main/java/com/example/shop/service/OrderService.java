package com.example.shop.service;

import java.util.List;

import com.example.shop.model.Order;

public interface OrderService {
	List<Order> findAllByAccount_Id(long id);
    List<Order> findAllById(long id);
    Order save(Order order);
}
