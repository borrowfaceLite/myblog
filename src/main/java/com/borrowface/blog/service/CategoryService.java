package com.borrowface.blog.service;

import com.borrowface.blog.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> list();
    Category get(int cid);
    int count();
}
