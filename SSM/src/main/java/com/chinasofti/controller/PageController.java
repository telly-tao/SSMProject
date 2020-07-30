package com.chinasofti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {

    @RequestMapping("/login.action")
    public String login(){
        return  "login";
    }

    @RequestMapping("/index.action")
    public String index(){
        return  "index";
    }

    @RequestMapping("/noAuth.action")
    public String noAuth(){
        return  "error/noAuth";
    }

    @RequestMapping("/testtime.action")
    public String testtime(){
        return  "biz/testtime";
    }

}
