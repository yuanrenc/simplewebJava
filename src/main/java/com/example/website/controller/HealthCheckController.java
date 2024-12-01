package com.example.website.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthCheckController {

    @GetMapping("/healthcheck")
    public String testDeployment() {
        return "Deployment successful! Your Java web application is running locally.";
    }
}