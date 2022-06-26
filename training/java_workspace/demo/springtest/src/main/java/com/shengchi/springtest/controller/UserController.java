package com.shengchi.springtest.controller;

import com.shengchi.springtest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;
    @CrossOrigin
    @ResponseBody
    @RequestMapping(value = "/getList")
    public Map<String, Object> getList(@RequestBody Map<String, String> pars) {
        String name="";
        int pageSize=10;
        int pageNum=0;
        if(pars.get("name")!=null){
            name=pars.get("name");
        }
        if(pars.get("pageSize")!=null){
            pageSize=Integer.parseInt(pars.get("pageSize"));
        }
        if(pars.get("pageNum")!=null){
            pageNum=Integer.parseInt(pars.get("pageNum"));
        }
        return userService.getUserByName(name,pageNum,pageSize);
    }
}
