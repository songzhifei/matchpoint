package matchpoint.resource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class ResourceApplication extends SpringBootServletInitializer {
    @RequestMapping("/")
    public String home(){
        return "hello resource project ";
    }

    public static void main(String[] args) {

        SpringApplication.run(ResourceApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ResourceApplication.class);
    }

}
