package com.examen;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api") // Préfixe pour tous les endpoints du contrôleur
public class SalutationController {

    @GetMapping("/hello") // Endpoint mappé sur /api/hello
    public String sayHello() {
        return "Hello, World!";
    }
}
