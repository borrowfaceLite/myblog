package com.borrowface.blog.mapper;

import com.borrowface.blog.pojo.Blog;
import com.borrowface.blog.pojo.BlogContent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogMapper {
    List<Blog> list(int start);
    Blog get(int blogId);
    List<Blog> listByC( int cid);
    int count();
    BlogContent getContent(int blogId);
    int addBlog(Blog blog);
    int addBlogContent (BlogContent blogContent);
}
