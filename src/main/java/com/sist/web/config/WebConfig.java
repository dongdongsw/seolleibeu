package com.sist.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // ✅ place는 지금 잘 된다 했으니 그대로 유지
    @Value("${file.upload.place:/uploads/place}")
    private String placeDir;

    // ✅ profile만 확실하게 잡기 위해 경로는 하드코딩으로 고정(가장 안정적)
    //    (설정값이 맞더라도, 지금은 무조건 뜨게 만드는 게 목표)
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

        // ✅ 기존 place 매핑: 그대로
        registry.addResourceHandler("/placeimages/**")
                .addResourceLocations(asPlaceFileLocation(placeDir));

        // ✅ profile만 확실히: /profile/** -> file:/uploads/profile/
        registry.addResourceHandler("/profile/**")
                .addResourceLocations(PROFILE_DIR);
    }
}