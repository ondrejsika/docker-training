package com.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        String hostname = System.getenv().getOrDefault("HOSTNAME", "unknown");
        return "Hello World from Spring Boot! " + hostname + "\n";
    }
}
