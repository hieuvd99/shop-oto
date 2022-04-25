package com.example.shop.adminController;

import java.io.IOException;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.shop.model.Product;
import com.example.shop.service.ParamService;
import com.example.shop.service.ProductService;
import com.example.shop.service.SessionService;


@Controller
public class AdminProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private ParamService paramService;
	
	//get all products
	@RequestMapping("/admin/homeproducts")
	 public String table(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutChangeAdmin/adminhomeproducts";
    }
	
	@RequestMapping("/admin/homeproducts/add")
    public String add(Model model , @Validated @ModelAttribute("item") Product item,BindingResult errors, @RequestParam("p") Optional<Integer> p ){
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        if(errors.hasErrors()){
           model.addAttribute("message","something was wrong");
        }else {
            productService.save(item);
            model.addAttribute("message","Success");
        }
        return "layoutChangeAdmin/adminaddproducts";
    }
	
	//Save
	@RequestMapping("/admin/homeproducts/save")
    public String saveSomething( Model model,@Validated @ModelAttribute("item") Product item, BindingResult errors , @RequestParam("photo") MultipartFile multipartFile, @RequestParam("p") Optional<Integer> p) throws IOException {
         Pageable pageable = PageRequest.of(p.orElse(0), 5);
         Page<Product> page = productService.findAll(pageable);
         model.addAttribute("page", page)   ;
         if(errors.hasErrors()){
             model.addAttribute("message","Some field are not valid . Please fix them");
         }else {
             String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
             String uploadDir = "static/upload";
             item.setImage(fileName);
             productService.save(item);
             model.addAttribute("message", "Edit Success");
             paramService.save(multipartFile, uploadDir);
             model.addAttribute("item", new Product());
         }
         return "layoutChangeAdmin/adminhomeproducts";
	}	
		
	//Edit
	@RequestMapping("/admin/homeproducts/edit/{id}")
    public String productEdit(Model model, @PathVariable("id") Long id,@RequestParam("p") Optional<Integer> p){
        Product item = productService.findById(id);
        model.addAttribute("item", item);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutChangeAdmin/admineditproducts";
    }
	
	//delete
	@RequestMapping("/admin/homeproducts/remove/{id}")
    public String remove(Model model, @PathVariable("id") Long id, RedirectAttributes prams){
        try {
            productService.deleteById(id);
            prams.addAttribute("message", "Delete Success");
        } catch (Exception e) {
            prams.addAttribute("message", "Can't detele product beacause the product are odered ");
        }
        return "redirect:/admin/adminhomeproducts";
    }
	
	
	
	//Search
	@RequestMapping("/product/search-and-page")
    public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
        Product item = new Product();
        model.addAttribute("item",item);
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productService.findByNameLike("%"+kwords+"%", pageable);
        model.addAttribute("page", page);
        return "layoutChangeAdmin/adminhomeproducts";
    }
	
	
	
	
}