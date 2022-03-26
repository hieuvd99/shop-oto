package com.example.shop.controller;

import java.util.Collection;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop.model.CartItem;
import com.example.shop.model.Order;
import com.example.shop.model.OrderDetail;
import com.example.shop.model.Product;
import com.example.shop.service.CartItemService;
import com.example.shop.service.OrderDetailService;
import com.example.shop.service.OrderService;
import com.example.shop.service.ProductService;




@Controller
public class ShoppingCartController {
	
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	
	
	@RequestMapping("/shoppingcart/index")
    public String index(Model model){
        Collection<CartItem>  cartItems = cartItemService.getCartItems();
        model.addAttribute("items",cartItems);
        model.addAttribute("total",cartItemService.getAmount());
        model.addAttribute("NoOfItem",cartItemService.getCount());
        return "layoutShop/shoppingcart";
    }
	
    @RequestMapping(value = "/shoppingcart/add/{id}" )
    public String add(Model model ,@PathVariable("id") Long id){
//       Product product = dao.findById(id).get();
        Product product = productService.findById(Math.toIntExact(id));
   //     List<Product> list = dao.findAll();
        CartItem  item = new CartItem ();
            BeanUtils.copyProperties(product,item);
            item.setQuantity(1);
        item.setId(product.getId());
        cartItemService.add(item);
        return "redirect:/shoppingcart/index";
    }
    
    @RequestMapping("/remove/{id}")
    public String remove(@PathVariable("id") Integer id){
        cartItemService.remove(id);
        return "redirect:/shoppingcart/index";
    }
    
    @RequestMapping("/shoppingcart/update")
    public String update(@RequestParam("id") Integer id,@RequestParam("quantity") Integer quantity){
        cartItemService.update(id,quantity);
        return "redirect:/shoppingcart/index";
    }
    
    @RequestMapping("/shoppingcart/save")
    public String checkout(Model model ,@ModelAttribute("item") Order item ){
        Collection<CartItem>  cart = cartItemService.getCartItems();
        model.addAttribute("items",cart);
        model.addAttribute("total",cartItemService.getAmount());
        model.addAttribute("NoOfItem",cartItemService.getCount());
        return "layoutShop/checkform";
    }
    
    @RequestMapping("/shoppingcart/save/order")
    public String saveorder(Model model ,@ModelAttribute("item") Order item ){
        orderService.save(item);
        Collection<CartItem>  carts = cartItemService.getCartItems();
        Product prd = new Product();
        for(CartItem x : carts){
            OrderDetail items = new OrderDetail();
//            Product prd = dao.findAllById(x.getId());
            prd.setId(x.getId());
            items.setQuantity(x.getQuantity());
            items.setOrder(item);
            items.setPrice(x.getPrice());
            items.setProduct(prd);
            Product product = productService.findAllById(x.getId());
            if(product.getQuantity() < x.getQuantity()){
                model.addAttribute("message","This product just have "+product.getQuantity());
            }else{
                orderDetailService.save(items);
                product.setQuantity(product.getQuantity()-items.getQuantity());
                productService.save(product);
                model.addAttribute("message", "Order Success");

            }
        }
        return "layoutShop/checkform";
    }

}
