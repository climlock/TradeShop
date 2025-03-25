package com.example.tradeshop.repositories;


import com.example.tradeshop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("SELECT p FROM Product p WHERE p.title LIKE CONCAT('%', :title, '%')")
    List<Product> findByTitle(@Param("title") String title);
}
