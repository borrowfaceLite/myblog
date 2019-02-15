package com.borrowface.blog.mapper;

import com.borrowface.blog.pojo.User;

import java.util.List;

public interface UserMapper {
    List<User> list();
    void add(User user);
    User get(User user);
}
