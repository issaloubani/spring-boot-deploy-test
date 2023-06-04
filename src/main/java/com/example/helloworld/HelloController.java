package com.example.helloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class HelloController {
    @GetMapping("/")
    public HashMap<String, Object> hello() {
        return new HashMap<String, Object>() {{
            put("message", "Hello World!");
        }};
    }
}
