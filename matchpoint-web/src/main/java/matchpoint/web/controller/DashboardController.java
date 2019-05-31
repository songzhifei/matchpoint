package matchpoint.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/Dashboard")
public class DashboardController {
    @RequestMapping(value = "/Index")
    public String Index(){
        //return "Home/Index";
        return "Dashboard/Index";
    }
}
