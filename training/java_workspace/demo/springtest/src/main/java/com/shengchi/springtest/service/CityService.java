package com.shengchi.springtest.service;

import java.util.Map;

public interface CityService {
    public Map<String, Object> getListByName(String name, String countryCode, int pageNum, int pageSize);
}
