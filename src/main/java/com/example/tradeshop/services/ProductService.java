package com.example.tradeshop.services;

import com.example.tradeshop.models.Image;
import com.example.tradeshop.models.Product;
import com.example.tradeshop.models.User;
import com.example.tradeshop.repositories.ProductRepository;
import com.example.tradeshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;


    public List<Product> getProductByTitle(String title) {
        List<Product> products = productRepository.findByTitle(title);
        if (title.isEmpty()) {
            return productRepository.findAll();
        }
        return products;

    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    public void saveProduct(Principal principal, Product product, MultipartFile... files) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        List<Image> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            if (!file.isEmpty()) {
                Image image = toImageEntity(file);
                if (i == 0){
                    image.setPreviewImage(true);
                }
                image.setProduct(product);
                images.add(image);
            }
        }

        log.info("Saving new Product. Title: {}; Author: {}", product.getTitle(), product.getUser().getEmail());
        product.setImages(images);
        Product productDB = productRepository.save(product);
        if (!images.isEmpty()){
            productDB.setPreviewImageId(productDB.getImages().get(0).getId());
            productRepository.save(product);
        }

    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }


    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setImageData(file.getBytes());
        return image;

    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
       return productRepository.findById(id).orElse(null);
    }

}
