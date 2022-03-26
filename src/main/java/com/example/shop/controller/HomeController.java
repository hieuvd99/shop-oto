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
	
	
	@RequestMapping("/")
    public String views(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        Pageable pageable = PageRequest.of(p.orElse(0), 10);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutShop/body";
    }
	
	@RequestMapping("home/about")
    public String about(){

        return "layoutShop/about";
    }
	
	@RequestMapping("/home/contact")
    public String contact(){

        return "layoutShop/contact";
    }
	
	@RequestMapping("/home/account/views/{id}")
    public String Views( Model model, @PathVariable("id") Long id){
        List<Account> items = accountService.findAllById(id);
        model.addAttribute("items", items);
        return "layoutShop/profile";
    }
	
	@RequestMapping("/home/account/update")
    public String UpdateSomething(@Validated @ModelAttribute("item")  Account item, BindingResult errors , Model model ,@RequestParam("image") MultipartFile multipartFile) throws IOException {
        if(errors.hasErrors()){
         model.addAttribute("message","Some field are not valid . Please fix them");
        }else {
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "static/upload";
        item.setPhoto(fileName);
        accountService.save(item);
        model.addAttribute("message", "Edit Success");
        paramService.save(multipartFile, uploadDir);
        model.addAttribute("item", new Product());
        }
        return  "redirect:/";
    }
	
	@RequestMapping("/home/account/change/{id}")
    public String password( Model model , @PathVariable("id") long id){
       Account item = accountService.findById(id);
        model.addAttribute("item", item);
        List<Account> items = accountService.findAll();
        model.addAttribute("items",items);
        return"layoutShop/changepassword";
    }
	
	@RequestMapping("/home/account/change/password")
    public String passwordchange(@ModelAttribute("item") Account item,@RequestParam("old") String old,@RequestParam("newp") String newp, @RequestParam("confirm") String confirm, Model model ){
        Account account = accountService.findById(item.getId());
        if(item.getPassword().equals(old)){
            if(newp.equals("")){
                model.addAttribute("message","Please enter your password");
            }else{
                if(newp.equals(confirm)){
                    account.setId(item.getId());
                    account.setAddress(item.getAddress());
                    account.setPassword(newp);
                    account.setFullname(item.getFullname());
                    account.setUsername(item.getUsername());
                    account.setPhone(item.getPhone());
                    account.setUsername(item.getUsername());
                    accountService.save(account);
                    model.addAttribute("message","success full");
                }else{
                    model.addAttribute("message","New password aren't match Confirmpassword");
                }
            }
        }else {
            model.addAttribute("message","Your old password are not true");
        }
        return"layoutShop/changepassword" ;
    }
}
