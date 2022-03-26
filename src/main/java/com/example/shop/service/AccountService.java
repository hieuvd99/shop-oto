package com.example.shop.service;

import java.util.List;

import com.example.shop.model.Account;

public interface AccountService {
	Account deleteById(long id);
	List<Account> findAll();
    Account findById(long id);
    Account findByEmail(String email);
    Account findAccountByUsername(String username);
    List<Account> findAllById(long id);
    Account save(Account account);
}
