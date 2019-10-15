package edu.vinaenter.configs;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
/**
 *@version: 1.0 
 **/
@Configuration // java config
public class MessageSourceConfig {

    @Bean // tư động tạo ra class ReloadableResourceBundleMessageSource
    public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setBasenames("classpath:i18n/message", "classpath:i18n/errors");
        return messageSource;
    }

}
