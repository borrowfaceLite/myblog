package com.borrowface.blog.mapper;

import com.borrowface.blog.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> list();
    Category get(int cid);
    int count(int cid);
    int countAll();
}
