package com.example.shop.service;

import java.util.Collection;

import com.example.shop.model.CartItem;

public interface CartItemService {
	void add(CartItem item);

	void remove(int id);

	Collection<CartItem> getCartItems();

	void clear();

	void update(int id, int quantity);

	double getAmount();

	int getCount();
}
