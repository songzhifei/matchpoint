package matchpoint.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @RequestMapping(value = "/register")
    public String register(){
        return "User/Register";
    }
    @RequestMapping(value = "/index")
    public String index(){
        return "User/UsersList";
    }
    @RequestMapping(value = "/mul")
    public int mulParam(int param) {
        return 9/param;
    }
}
