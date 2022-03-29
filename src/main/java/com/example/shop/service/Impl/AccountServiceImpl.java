package com.example.shop.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.shop.model.Account;
import com.example.shop.repository.AccountRepository;
import com.example.shop.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private AccountRepository accountRepository;
	@Override
	public Account deleteById(long id) {
		// TODO Auto-generated method stub
		return accountRepository.deleteById(id);
	}

	@Override
	public Account findById(long id) {
		// TODO Auto-generated method stub
		return accountRepository.findById(id);
	}

	@Override
	public Account findByEmail(String email) {
		// TODO Auto-generated method stub
		return accountRepository.findByEmail(email);
	}

	@Override
	public Account findAccountByUsername(String username) {
		// TODO Auto-generated method stub
		return accountRepository.findAccountByUsername(username);
	}

	@Override
	public List<Account> findAllById(long id) {
		// TODO Auto-generated method stub
		return accountRepository.findAllById(id);
	}

	@Override
	public Account save(Account account) {
		// TODO Auto-generated method stub
		return accountRepository.save(account);
	}

	@Override
	public List<Account> findAll() {
		// TODO Auto-generated method stub
		return accountRepository.findAll();
	}

	@Override
	public Page<Account> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return accountRepository.findAll(pageable);
	}

	@Override
	public Page<Account> findByUsernameLike(String keywords, Pageable pageable) {
		// TODO Auto-generated method stub
		return accountRepository.findByUsernameLike(keywords, pageable);
	}

}
