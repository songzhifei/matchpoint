package matchpoint.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/Home")
public class HomeController {
    @RequestMapping(value = "/Index")
    public String Index(){
        //return "Home/Index";
        return "Home/Index";
    }
}
