package com.borrowface.blog.service;

import com.borrowface.blog.pojo.User;

import java.util.List;

public interface UserService {
    void add(User user);
    List<User> list();
    User get(User user);
}
