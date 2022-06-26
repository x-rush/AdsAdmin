package com.shengchi.springtest.controller;

import com.shengchi.springtest.entity.Country;
import com.shengchi.springtest.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/country")
public class CountryController {

    @Autowired
    private CountryService countryService;

    @CrossOrigin
    @RequestMapping("/getCountryList")
    @ResponseBody
    public Map<String, Object> getList(){
        Map<String, Object> map=new HashMap<>();
        map.put("tableList", countryService.getList());
        return map;
    }
}
