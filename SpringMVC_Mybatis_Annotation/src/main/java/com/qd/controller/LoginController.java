package com.qd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {
    //model 等价于请求作用域
    @RequestMapping("toLogin")
    public String toLogin(String msg, Model model){
        if(msg!=null){
            model.addAttribute("msg",msg);
        }
//       return "index";
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "login.do",produces = "text/html;charset=UTF-8")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model){
        if(username.equals("admin") && password.equals("admin")){
            session.setAttribute("user","admin");
            return "redirect:/index2.jsp";
        }
        //model会将第一次请求中设置的属性值当做新的请求参数传递给了下一次转发路径
        model.addAttribute("msg","登陆失败");
        return "redirect:/login/toLogin";
    }

}
