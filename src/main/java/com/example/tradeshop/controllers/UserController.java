package com.example.tradeshop.controllers;

import com.example.tradeshop.models.User;
import com.example.tradeshop.services.ProductService;
import com.example.tradeshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.CreateUser(user)) {
            model.addAttribute("errorMassage", "Користувач з таким Email вже сторенний ");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/hello")
    public String securityUrl() {
        return "hello";
    }
    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User profileUser, Model model, Principal principal) {
        model.addAttribute("profileUser", profileUser);
        model.addAttribute("products", profileUser.getProducts());
        model.addAttribute("currentUser", productService.getUserByPrincipal(principal));
        return "user-info";
    }

}
