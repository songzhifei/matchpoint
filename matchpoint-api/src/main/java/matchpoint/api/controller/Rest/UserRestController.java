package matchpoint.api.controller.Rest;

import com.github.pagehelper.PageInfo;
import matchpoint.api.dto.UserParams;
import matchpoint.bean.MpUser;
import matchpoint.bean.User;
import matchpoint.common.CommonResult;
import matchpoint.common.jqGridResult;
import matchpoint.service.MpUserService;
import matchpoint.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping(value = "/user")
public class UserRestController {

    private final static Logger logger = LoggerFactory.getLogger(UserRestController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private MpUserService mpUserService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public CommonResult<User> verifyLogin(@RequestParam(value = "userName", required = true) String userName, @RequestParam(value = "password", required = true) String password){

        User user = userService.findUserByName(userName);

        if(user != null && user.getPassword().equals(password)){
            return CommonResult.success(user,"登录成功！");
        }else{
            return CommonResult.failed("用户名或密码错误");
        }
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public CommonResult<UserParams> register(@RequestBody UserParams userParams){

        int res = 0;

        if(!userParams.getUserName().isEmpty() && !userParams.getPassword().isEmpty()){
            User user = new User(null,userParams.getUserName(),userParams.getEmail(),userParams.getPassword(),new Date(),false);
            res = userService.insertUser(user);
        }

        if(res==1){
            return CommonResult.success(userParams,"注册成功");
        }else{
            return CommonResult.failed("注册失败！");
        }

    }
    @RequestMapping(value = "/verify",method = RequestMethod.POST)
    public CommonResult<Boolean> verifyUser(@RequestParam(value = "userName",required = true) String userName){

        if(!userName.trim().isEmpty()){
            User user = userService.findUserByName(userName);

             if(user !=null){
                 return CommonResult.failed("该用户已存在!");
             }else{
                 return CommonResult.success(true);
             }
        }else{
            return CommonResult.failed("用户名不能为空!");
        }

    }
    @RequestMapping(value = "/getList",method = RequestMethod.GET)
    public jqGridResult<MpUser> findUserByPage(@RequestParam(value = "page",required = true) int page, @RequestParam(value = "rows",required = true) int rows){
        jqGridResult<MpUser> jqGridResult = new jqGridResult<MpUser>();
        try{
            PageInfo<MpUser> pageInfo= mpUserService.GetList(page,rows);
            jqGridResult = matchpoint.common.jqGridResult.success(pageInfo.getList(),pageInfo.getPages(),pageInfo.getTotal(),pageInfo.getPageNum(),"");
        }catch (Exception ex){
            logger.error(String.format("错误代码：%s,错误信息：%s",ex.hashCode(),ex.getMessage()));
            jqGridResult = matchpoint.common.jqGridResult.failed();
        }
        return jqGridResult;
    }
}
