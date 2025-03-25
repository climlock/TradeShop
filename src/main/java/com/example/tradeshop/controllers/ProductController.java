package com.example.tradeshop.controllers;

import com.example.tradeshop.models.Product;
import com.example.tradeshop.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping("/")
    public String products( Model model, Principal principal) {
        model.addAttribute("products", productService.getAllProducts());
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam(name = "title") String title, Model model, Principal principal) {
        model.addAttribute("products", productService.getProductByTitle(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("user", productService.getUserByPrincipal(principal));

        return "product-info";
    }
    @GetMapping("/test-page")
    public String Test(){
        return "test";
    }

    @PostMapping("/product/create-new")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, @RequestParam("file4") MultipartFile file4,
                                @RequestParam("file5") MultipartFile file5, @RequestParam("file6") MultipartFile file6,
                                @RequestParam("file7") MultipartFile file7, Product product, Principal principal) throws IOException {
        productService.saveProduct(principal ,product, file1, file2, file3, file4, file5, file6, file7);
        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/";
    }
    @GetMapping("/product/create")
    public String productCreateForm(Model model, Principal principal) {
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "product-create";
    }
}
