package com.shengchi.springtest.service.impl;

import com.shengchi.springtest.entity.City;
import com.shengchi.springtest.mapper.CityMapper;
import com.shengchi.springtest.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CityServiecImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
    public Map<String, Object> getListByName(String name, String countryCode,int pageNum, int pageSize) {
        Map<String, Object> parames = new HashMap<>();
        Map<String, Object> result =new HashMap<>();
        parames.put("name", name);
        parames.put("pageNum", pageNum);
        parames.put("pageSize", pageSize);
        parames.put("countryCode", countryCode);
        result.put("total", cityMapper.getTotalForGetListByName(parames));
        result.put("tableList", cityMapper.getListByName(parames));
        return result;
    }
}
