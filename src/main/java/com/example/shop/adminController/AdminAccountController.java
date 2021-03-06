package com.example.shop.adminController;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.shop.model.Account;
import com.example.shop.model.CartItem;
import com.example.shop.model.Product;
import com.example.shop.service.AccountService;
import com.example.shop.service.CartItemService;
import com.example.shop.service.SessionService;



@Controller
public class AdminAccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private CartItemService cartItemService;
	
	//login
	@GetMapping("/account/login")
	public String login() {
        return "layout/loginform";
    }
	
	@RequestMapping("/account/login")
	public String login(Model model, @RequestParam(name="username") String username,
			@RequestParam(name="password") String password) throws NoSuchAlgorithmException {
		Account user = accountService.findAccountByUsername(username);
		
		MessageDigest md = MessageDigest.getInstance("MD5");
        	md.update(password.getBytes());
        	byte[] digest = md.digest();
        	String myChecksum = DatatypeConverter .printHexBinary(digest);
		
		MessageDigest md2 = MessageDigest.getInstance("MD5");
        	md2.update(user.getPassword().getBytes());
        	byte[] digest2 = md2.digest();
        	String myChecksum2 = DatatypeConverter .printHexBinary(digest2);
        
		if (!myChecksum.equals(myChecksum2)) {
			model.addAttribute("message", "Wrong login information"  );
			return "layout/loginform";
		} else {
			String uri = sessionService.get("security-uri");
            if (uri != null) {
                return "redirect:" + uri;
            } else {
                
                    sessionService.set("user", user);
                    return "redirect:/";
                
                }
            }
	}

	
    //register
    @RequestMapping("/account/signup")
    public String signup(@Validated @ModelAttribute("item") Account item , BindingResult errors,Model model) throws NoSuchAlgorithmException{
	    // || accountService.existsByUsername(item.getUsername()) || accountService.existsByEmail(item.getEmail()) 
	if( errors.hasErrors() ){
            model.addAttribute("message", "Some field are not valid . Please fix them");         
        }else {
        	Account account = new Account();
        	MessageDigest md = MessageDigest.getInstance("MD5");
            	md.update(item.getPassword().getBytes());
            	byte[] digest = md.digest();
            	String myHash = DatatypeConverter .printHexBinary(digest);
            
        	account.setUsername(item.getUsername());
        	account.setEmail(item.getEmail());
        	account.setPassword(myHash);
            accountService.save(item);
            model.addAttribute("message", "Success") ;
		
        }
        return "layout/register";
    }

    
    //logout
    @RequestMapping("/account/logout")
    public String logout(){
      sessionService.invalidate();
      cartItemService.clear();
        return "redirect:/";
    }
    
    //find by id
    @RequestMapping("/admin/account/about/{id}")
    public String about(Model model  , @PathVariable("id") long id){
        Account item = accountService.findById(id);
        model.addAttribute("item", item);
        return "layoutChangeAdmin/adminprofile";
    }
    //update
    @RequestMapping("/admin/account/about/save")
    public String aboutsave(Model model ,@Validated @ModelAttribute("item")  Account item,BindingResult errors ){
        if(errors.hasErrors()){
            model.addAttribute("message","something was wrong");
        }else {
            accountService.save(item);
            model.addAttribute("message","Update success");
        }
        return "layoutChangeAdmin/adminprofile";
    }
    
	
	@RequestMapping("/admin/account/change/password/{id}")
    public String passwordchange(@ModelAttribute("item") Account item,@RequestParam("old") String old,@RequestParam("newp") String newp, @RequestParam("confirm") String confirm, Model model,@PathVariable("id") long id) throws NoSuchAlgorithmException{
        Account account = accountService.findById(id);
        
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(old.getBytes());
        byte[] digest = md.digest();
        String myChecksum = DatatypeConverter .printHexBinary(digest);
        
        
        if(account.getPassword().equals(myChecksum)){
            if(newp.equals("")){
                model.addAttribute("message","Please enter your password");
            }else{
                if(newp.equals(confirm)){
                	MessageDigest md_new = MessageDigest.getInstance("MD5");
                    md_new.update(newp.getBytes());
                    byte[] digest_new = md_new.digest();
                    String myHash = DatatypeConverter .printHexBinary(digest_new);
                    
                    account.setPassword(myHash);
                    accountService.save(account);
                    model.addAttribute("message","success full");
                }else{
                    model.addAttribute("message","New password aren't match Confirmpassword");
                }
            }
        }else {
            model.addAttribute("message","Your old password are not true");
        }
        return"layoutChangeAdmin/adminprofile" ;
    }
}
