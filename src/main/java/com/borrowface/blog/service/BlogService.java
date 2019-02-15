package com.borrowface.blog.service;

import com.borrowface.blog.pojo.Blog;
import com.borrowface.blog.pojo.BlogContent;

import java.util.List;

public interface BlogService {
    List<Blog> list(int start);
    Blog get(int blogId);
    List<Blog> listByC(int cid);
    int count();
    BlogContent getContent(int bid);
    int addBlog(Blog blog,BlogContent blogContent);
}
