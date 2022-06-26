package com.shengchi.springtest.service;

import com.shengchi.springtest.entity.user;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<user> getList();

    public List<user> getUserByName(String name);

    public Map<String, Object> getUserByName(String name, int pageNum, int pageCount);
}