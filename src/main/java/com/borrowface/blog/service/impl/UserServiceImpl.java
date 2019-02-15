package com.borrowface.blog.service.impl;

import com.borrowface.blog.mapper.UserMapper;
import com.borrowface.blog.pojo.User;
import com.borrowface.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public List<User> list() {
        return userMapper.list();
    }

    @Override
    public User get(User user) {
        return userMapper.get(user);
    }
}
