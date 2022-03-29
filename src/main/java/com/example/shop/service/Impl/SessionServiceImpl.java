package com.example.shop.service.Impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.service.SessionService;

@Service
public class SessionServiceImpl implements SessionService{

	@Autowired
	HttpSession session;
	@Override
	public void set(String name, Object value) {
		// TODO Auto-generated method stub
		session.setAttribute(name, value);
	}

	@Override
	public <T> T get(String name) {
		// TODO Auto-generated method stub
		return (T)session.getAttribute(name);
	}

	@Override
	public void invalidate() {
		// TODO Auto-generated method stub
		session.invalidate();
	}

}
