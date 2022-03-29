package com.example.shop.adminController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.shop.model.Category;
import com.example.shop.repository.CategoryRepository;
import com.example.shop.service.CategoryService;
import com.example.shop.service.SessionService;

import java.util.List;
import java.util.Optional;

@Controller
public class AdminCategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SessionService sessionService;
    
    @RequestMapping("/admin/category")
    public String Product(Model model,@RequestParam("p") Optional<Integer> p){
        Category item = new Category();
        model.addAttribute("item",item);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Category> page = categoryService.findAll(pageable);
        model.addAttribute("page", page)    ;

        return "layoutChangeAdmin/admincategory";
    }
    
    @RequestMapping("/admin/category/add")
    public String add(Model model , @Validated @ModelAttribute("item") Category item,BindingResult errors, @RequestParam("p") Optional<Integer> p ){
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Category> page = categoryService.findAll(pageable);
        model.addAttribute("page", page)    ;
        if(errors.hasErrors()){
           model.addAttribute("message","something was wrong");
        }else {
            categoryService.save(item);
            model.addAttribute("message","Success");
        }
        return "layoutChangeAdmin/admincategory";
    }
    
    @RequestMapping("/admin/category/remove/{id}")
    public String Remove(Model model, @PathVariable("id") Long id, RedirectAttributes prams){
        try {
            categoryService.deleteById(id);
            prams.addAttribute("message", "Delete Success");
        } catch (Exception e) {
            prams.addAttribute("message", "Can't detele Category beacause the product form category are present ");
        }
        return "redirect:/admin/category";
    }
    
    @RequestMapping("/admin/category/search-and-page")
    public String searchAndPage(Category item,Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("item",item);
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Category> page = categoryService.findByNameLike("%"+kwords+"%", pageable);
        model.addAttribute("page", page);
        return "layoutChangeAdmin/admincategory";
    }
    
    @RequestMapping("/admin/category/edit/{id}")
    public String Edit(Model model, @PathVariable("id") Long id ,@RequestParam("p") Optional<Integer> p){
        Category item = categoryService.findById(id);
        model.addAttribute("item", item);

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Category> page = categoryService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutChangeAdmin/categoryadmin";
    }
}
