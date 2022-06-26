package com.shengchi.springtest.service.impl;

import com.shengchi.springtest.entity.user;
import com.shengchi.springtest.mapper.UserMapper;
import com.shengchi.springtest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<user> getList() {
        List<user> list = userMapper.getUserList();
        return list;
    }

    @Override
    public List<user> getUserByName(String name) {
        List<user> list = userMapper.getUserListByName(name);
        return list;
    }

    @Override
    public Map<String, Object> getUserByName(String name, int pageNum, int pageCount) {
        Map<String, Object> map = new HashMap<>();
        map.put("totalCount", userMapper.getTotalCountByName(name));
        map.put("tableList", userMapper.getUserListByName(name,pageNum,pageCount));
        return null;
    }

}
