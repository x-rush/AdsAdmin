package com.shengchi.springtest.service.impl;

import com.shengchi.springtest.entity.Country;
import com.shengchi.springtest.mapper.CountryMapper;
import com.shengchi.springtest.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryMapper countryMapper;

    @Override
    public List<Country> getList() {
        return countryMapper.getlistData();
    }
}
