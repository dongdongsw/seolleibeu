package com.sist.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.upload.place:/uploads/place}")
    private String placeDir;

    private static final String PROFILE_DIR = "file:/uploads/profile/";
    
    private String asPlaceFileLocation(String dir) {
        String d = dir;
        if (!d.startsWith("/")) d = "/" + d;
        if (!d.endsWith("/")) d = d + "/";
        return "file:" + d; 
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/placeimages/**")
                .addResourceLocations(asPlaceFileLocation(placeDir));

        registry.addResourceHandler("/profile/**")
                .addResourceLocations(PROFILE_DIR);
    }
}