package com.example.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.shop.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{
	List<Order> findAllByAccount_Id(long id);
    List<Order> findAllById(long id);
    Order save(Order order);
    //    @Query("SELECT new RevenuePrice( sum(o.price)) "
//            + " FROM Order o  "
//            + " ORDER BY sum(o.price) DESC")
//    List<RevenuePrice> getPriceWhenDay();
    @Query(value = "Select sum(price)  from orders where  Year(createDate) like '2021' ",nativeQuery = true)
    Float selectTotals();
    @Query(value = "Select sum(price)  from orders where  Month(createDate) =5 ",nativeQuery = true)
    Float selectTotalsMonth();

}
