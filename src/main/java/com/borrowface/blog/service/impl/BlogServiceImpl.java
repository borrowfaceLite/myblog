package com.borrowface.blog.service.impl;

import com.borrowface.blog.mapper.BlogMapper;
import com.borrowface.blog.pojo.Blog;
import com.borrowface.blog.pojo.BlogContent;
import com.borrowface.blog.service.BlogService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    Logger logger=Logger.getLogger(BlogServiceImpl.class);

    @Autowired
    BlogMapper blogMapper;

    @Override
    public List<Blog> list(int start) {
        return blogMapper.list(start);
    }

    @Override
    public Blog get(int blogId) {
        return blogMapper.get(blogId);
    }

    @Override
    public List<Blog> listByC(int cid) {
        return blogMapper.listByC(cid);
    }

    @Override
    public int count() {
        return blogMapper.count();
    }

    @Override
    public BlogContent getContent(int bid) {
        return blogMapper.getContent(bid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackForClassName = "Exception")
    public int addBlog(Blog blog,BlogContent blogContent) {
        int count=blogMapper.addBlog(blog);
        logger.debug("blog id is"+blog.getId());
        blogContent.setBid(blog.getId());
        blogMapper.addBlogContent(blogContent);
        return count;
    }



}
