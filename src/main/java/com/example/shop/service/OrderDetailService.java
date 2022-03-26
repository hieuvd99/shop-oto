package com.example.shop.service;

import java.util.List;

import com.example.shop.model.OrderDetail;

public interface OrderDetailService {
	List<OrderDetail> findAllByOrder_Id(long id);
	OrderDetail save(OrderDetail orderDetail);
}
