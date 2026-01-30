package com.sist.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import jakarta.annotation.PostConstruct;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.upload.place:/uploads/place}")
    private String placeDir;

    private static final String PROFILE_DIR = "file:/uploads/profile/";
    
    private String asPlaceFileLocation(String dir) {
        // place는 기존 방식 그대로 유지
        String d = dir;
        if (!d.startsWith("/")) d = "/" + d;
        if (!d.endsWith("/")) d = d + "/";
        return "file:" + d; // e.g. file:/uploads/place/
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/placeimages/**")
                .addResourceLocations(asPlaceFileLocation(placeDir));

        // ✅ profile만 확실히: /profile/** -> file:/uploads/profile/
        registry.addResourceHandler("/profile/**")
                .addResourceLocations(PROFILE_DIR);
    }
}