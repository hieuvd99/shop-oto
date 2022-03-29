package com.example.shop.adminController;


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

import com.example.shop.service.AccountService;
import com.example.shop.service.OrderDetailService;
import com.example.shop.service.OrderService;
import com.example.shop.service.ParamService;
import com.example.shop.service.ProductService;
import com.example.shop.service.SessionService;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.example.shop.model.Account;
import com.example.shop.model.Order;

@Controller
public class AdminHomeController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private ParamService paramService;
    
    @RequestMapping("/admin/revenue")
    public String Home(Model model){
        //Hien thi don hang
     Order item = new Order();
     model.addAttribute("item", item);
     List<Order> items = orderService.findAll();
     model.addAttribute("items", items);

     //Thong ke User hien tai
     List<Account> accounts = accountService.findAll();
     long count = 0;
     for (Account ac : accounts) {
            count++;
            model.addAttribute("count", count);
     }
     //Thong ke Doanh thu theo nam
        Float orderList = orderService.selectTotals();
        model.addAttribute("orderList",orderList);
        //Thong ke Doanh thu theo thang
        Float selectTotalsMonth = orderService.selectTotalsMonth();
        model.addAttribute("orderListMonth",selectTotalsMonth);
        //Thong ke ton kho
       // List<Report> rep = productDAO.getInventoryByCategory();
       //model.addAttribute("rep", rep);

        return "layoutChangeAdmin/adminrevenue";
    }
//    @RequestMapping("/Admin/Order/Details/{id}")
//    public String Details(Model model,@PathVariable("id") Long id){
//        //Thong ke User hien tai
//        List<Account> accounts = accountdao.findAll();
//        long count = 0;
//        for (Account ac : accounts) {
//            count++;
//            model.addAttribute("count", count);
//        }
//        //Thong ke Doanh thu theo nam
//        Float orderList = orderdao.selectTotals();
//        model.addAttribute("orderList",orderList);
//        //Thong ke Doanh thu theo thang
//        Float orderListMotnh = orderdao.selectTotals();
//        model.addAttribute("orderListMotnh",orderList);
//        List<OrderDetail> orderDetails = oderDetailDAO.findAllByOrder_Id(id);
//        model.addAttribute("orderDetails",orderDetails);
//        return "layoutChangeAdmin/viewsOrderDetails";
//
//    }
    
    @RequestMapping("/admin/home")
    public String Account(Model model , @RequestParam("p") Optional<Integer> p){
        Account item = new Account();
        model.addAttribute("item", item);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Account> page = accountService.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutChangeAdmin/adminbody";
    }
    
    @RequestMapping("/admin/home/search-and-page")
    public String searchAndPage(Account item,Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("item",item);
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Account> page = accountService.findByUsernameLike("%"+kwords+"%", pageable);
        model.addAttribute("page", page);
        return "layoutChangeAdmin/adminbody";
    }

}
