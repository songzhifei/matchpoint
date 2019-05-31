package matchpoint.api;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@RestController
@SpringBootApplication
@ServletComponentScan
@ComponentScan(value = {"matchpoint.service","matchpoint.api"})
// mapper 接口类扫描包配置
@MapperScan("matchpoint.dao")
@EnableSwagger2
public class ApiApplication  extends SpringBootServletInitializer {

    @RequestMapping("/")
    @ApiIgnore
    public String home(){
        return "hello api";
    }

    public static void main(String[] args) {
        SpringApplication.run(ApiApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ApiApplication.class);
    }

}
