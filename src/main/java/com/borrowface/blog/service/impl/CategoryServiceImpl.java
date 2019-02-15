package com.borrowface.blog.service.impl;

import com.borrowface.blog.mapper.CategoryMapper;
import com.borrowface.blog.pojo.Category;
import com.borrowface.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> list() {
        List<Category> result=categoryMapper.list();
        int count=-1;
        for (Category c:result){
            c.setCount(categoryMapper.count(c.getId()));
        }
        return result;
    }

    @Override
    public Category get(int cid) {
        return categoryMapper.get(cid);
    }

    @Override
    public int count() {
        return categoryMapper.countAll();
    }
}
