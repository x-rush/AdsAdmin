package com.shengchi.springtest.controller;

import com.shengchi.springtest.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/city")
public class CityController {

    @Autowired
    private CityService cityService;

    @CrossOrigin
    @RequestMapping("/getCityList")
    @ResponseBody
    public Map<String, Object> getList(@RequestBody Map<String, Object> pars){
        String name = "";
        String countryCode = "";
        Integer pageNum = 0;
        Integer pageSize = 10;
        if(pars.get("name") != null) {
            name=pars.get("name").toString();
        }
        if(pars.get("countryCode") != null) {
            countryCode=pars.get("countryCode").toString();
        }
        if(pars.get("pageNum") != null) {
            pageNum = Integer.parseInt(pars.get("pageNum").toString());
        }
        if(pars.get("pageSize") != null) {
            pageSize = Integer.parseInt(pars.get("pageSize").toString());
        }
        return cityService.getListByName(name, countryCode,(pageNum-1)*pageSize,pageSize);
    }
}
