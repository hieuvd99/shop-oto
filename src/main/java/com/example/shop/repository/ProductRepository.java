package com.example.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

	List<Product> findAll();
	Product findById(long id);

	Product deleteById(long id);

	Product findAllById(long id);

	List<Product> findAllByCategoryId(long id);

//  @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByNameLike(String keywords, Pageable pageable);

	Page<Product> findByCategoryId(long keywords, Pageable pageable);

	Page<Product> findByPriceBetween(double a, double b, Pageable pageable);
//  Page<Product> allProductsSortedByName = productRepository.findAll(Sort.by("name"));
//@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
//   + " FROM Product o "
//   + " GROUP BY o.category"
//   + " ORDER BY sum(o.price) DESC")
//List<Report> getInventoryByCategory();
//  @Query(value = "  Select TOP(10) * from products where discount >0" , nativeQuery = true)
//  List<Product> selectTop10();

}
