package com.example.shop.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop.model.Account;
import com.example.shop.service.AccountService;
import com.example.shop.service.SessionService;

@Controller
public class AdminAccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private SessionService sessionService;
	//login
	@GetMapping("/account/login")
	public String login() {
        return "layout/loginform";
    }
	
	@PostMapping("/account/login")
	public String login(Model model, @RequestParam(name="username") String username,
			@RequestParam(name="password") String password) {
		Account account = accountService.findAccountByUsername(username);
		if (!account.getPassword().equals(password)) {
			model.addAttribute("message", "Invalid password");
		} else {
			sessionService.set("account", account);
			model.addAttribute("message", "Login succeed");
			return "redirect:/Admin/Views";
		}
		return "layout/loginform";
	}
	
	//register
    @RequestMapping ("/account/signup")
    public String signup(@Validated @ModelAttribute("item") Account item , BindingResult errors,Model model){
        if(errors.hasErrors()){
            model.addAttribute("message", "Some field are not valid . Please fix them");
        }else {
            accountService.save(item);
            model.addAttribute("message", "Register success ");
            return "redirect:/account/login";
        }
        return "layout/register";
    }
    
    //logout
    @RequestMapping("/account/logout")
    public String logout(){
      sessionService.remove("account");
//      shoppingCartService.clear();
        return "redirect:/Home/views";
    }
    
    //find by id
    @RequestMapping("/account/about/{id}")
    public String about(Model model  , @PathVariable("id") long id){
        Account item = accountService.findById(id);
        model.addAttribute("item", item);
        return "layoutChangeAdmin/aboutadmin";
    }
    //update
    @RequestMapping("/account/about/save")
    public String aboutsave(Model model ,@Validated @ModelAttribute("item")  Account item,BindingResult errors ){
        if(errors.hasErrors()){
            model.addAttribute("message","something was wrong");
        }else {
            accountService.save(item);
            model.addAttribute("message","Update success");
        }
        return "layoutChangeAdmin/aboutadmin";
    }
}
