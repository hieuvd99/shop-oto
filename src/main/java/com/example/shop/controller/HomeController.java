package com.example.shop.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.shop.model.Account;
import com.example.shop.model.Product;
import com.example.shop.service.AccountService;
import com.example.shop.service.ParamService;
import com.example.shop.service.ProductService;



@Controller
public class HomeController {

	@Autowired
	private ProductService productService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ParamService paramService;
	
	
	@RequestMapping("/home")
    public String views(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        Pageable pageable = PageRequest.of(p.orElse(0), 10);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutShop/body";
    }
	
	@RequestMapping("/home/about")
    public String about(){
		  
        return "layoutShop/about";
    }
	
	@RequestMapping("/home/contact")
    public String contact(){

        return "layoutShop/contact";
    }
	
	
}
