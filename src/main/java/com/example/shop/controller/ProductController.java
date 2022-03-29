package com.example.shop.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop.model.Category;
import com.example.shop.model.Product;
import com.example.shop.service.CategoryService;
import com.example.shop.service.ProductService;
import com.example.shop.service.SessionService;


@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/home/products")
    public String product(Model model, @RequestParam("p") Optional<Integer> p){
//        Product item = new Product();
//        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutShop/products";
    }
	
	@RequestMapping("/product/search")
    public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productService.findByNameLike("%"+kwords+"%", pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
	
	@RequestMapping("/home/products/about/{id}")
    public String aboutproduct(Model model, @PathVariable("id") Long id){
        Product item = productService.findById(id);
        model.addAttribute("item", item);
        List<Product> items = productService.findAll();
        model.addAttribute("items", items);
        List<Product> pro = productService.findAllByCategoryId(item.getCategory().getId());
        model.addAttribute("procate",pro);
        return "layoutShop/aboutproduct";
    }
	 
	@RequestMapping("/product/category/{id}")
    public String proCate(Model model ,@PathVariable("id") Long id, @RequestParam("p") Optional<Integer> p){
		Category item = categoryService.findById(id);
		model.addAttribute("item", item);
		List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findByCategoryId(item.getId(), pageable);
        model.addAttribute("page", page);
      return "layoutShop/products";
    }
	 
	//Low to hight
	@RequestMapping("/home/products/sort")
    public String productsort(Model model, @RequestParam("p") Optional<Integer> p , @RequestParam("field") Optional<String> field){
        Sort sort = Sort.by(Sort.Direction.ASC,field.orElse("price"));
        model.addAttribute("field",field.orElse("price").toUpperCase());
//        Product item = new Product();
//        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8,Sort.Direction.ASC,field.orElse("price"));
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
	
	
	//Hight to low
	@RequestMapping("/home/products/sortdesc")
    public String productsortdesc(Model model, @RequestParam("p") Optional<Integer> p , @RequestParam("field") Optional<String> field){
//        Sort sort = Sort.by(Sort.Direction.ASC,field.orElse("price"));
        model.addAttribute("field",field.orElse("price").toUpperCase());
//        Product item = new Product();
//        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8,Sort.Direction.DESC,field.orElse("price"));
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
	
	@RequestMapping("/product/price/between0_50k")
    public String between(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findByPriceBetween(0,50000,pageable);
        model.addAttribute("page", page);
      return "layoutShop/products";
    }
    @RequestMapping("/product/price/between50k_300k")
    public String between50_300(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findByPriceBetween(50000,300000,pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
    @RequestMapping("/product/price/between300k_800k")
    public String between300_800(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findByPriceBetween(300000,800000,pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
    
    @RequestMapping("/product/price/between800k")
    public String between800(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productService.findByPriceBetween(800000,9999999,pageable);
        model.addAttribute("page", page);
        return "layoutShop/products";
    }
    
    
}
















