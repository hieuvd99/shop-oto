package com.example.shop.service;

public interface SessionService {
	public void set(String name, Object value);
	public <T> T get(String name);
	public void remove(String name);
}
