package matchpoint.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
@ServletComponentScan
@ComponentScan(value = {"matchpoint.service","matchpoint.web"})
// mapper 接口类扫描包配置
@MapperScan("matchpoint.dao")
public class MatchpointWebApplication extends SpringBootServletInitializer {

    @RequestMapping("/")
    public String home(){
        return "hello world";
    }

    public static void main(String[] args) {
        SpringApplication.run(MatchpointWebApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MatchpointWebApplication.class);
    }

}
