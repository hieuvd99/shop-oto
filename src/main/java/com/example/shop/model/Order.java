package com.example.shop.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "orders")
public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String username;
	private String address;
	private Integer phone;
	private Double price;
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate = new Date();
	
	@ManyToOne 
	@JoinColumn(name="account_id")
    Account account;
	
	@OneToMany(mappedBy = "order")
    List<OrderDetail> orderdetails;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderdetails;
	}

	public void setOrderDetails(List<OrderDetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	
}
