package com.sist.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.upload.place:/uploads/place}")
    private String placeDir;

    @Value("${file.upload.profile:/uploads/profile}")
    private String profileDir;

    private String asFileLocation(String dir) {
        // file:/ 절대경로로 만들고, 마지막에 / 보장
        String d = dir;
        if (!d.startsWith("/")) d = "/" + d;
        if (!d.endsWith("/")) d = d + "/";
        return "file:" + d;   // => file:/uploads/place/
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/placeimages/**")
                .addResourceLocations(asFileLocation(placeDir));

        registry.addResourceHandler("/profile/**")
                .addResourceLocations(asFileLocation(profileDir));
    }
}