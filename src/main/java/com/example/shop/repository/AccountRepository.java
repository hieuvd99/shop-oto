package com.example.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop.model.Account;

public interface AccountRepository extends JpaRepository<Account, Long>{
	Account deleteById(long id);
	List<Account> findAll();
    Account findById(long id);
    Account findByEmail(String email);
    Account findAccountByUsername(String username);
    List<Account> findAllById(long id);

    Page<Account> findByUsernameLike(String keywords, Pageable pageable);
}
