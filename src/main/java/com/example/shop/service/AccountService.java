package com.example.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.shop.model.Account;

public interface AccountService {
	Account deleteById(long id);
	List<Account> findAll();
	Page<Account> findAll(Pageable pageable);
    Account findById(long id);
    Account findByEmail(String email);
    Account findAccountByUsername(String username);
    List<Account> findAllById(long id);
    Account save(Account account);
    Page<Account> findByUsernameLike(String keywords, Pageable pageable);
    Boolean existsByUsername(String username);
    Boolean existsByEmail(String email);
}
