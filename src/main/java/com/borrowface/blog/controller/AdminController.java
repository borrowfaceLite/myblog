package com.borrowface.blog.controller;


import com.borrowface.blog.pojo.*;
import com.borrowface.blog.service.BlogService;
import com.borrowface.blog.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("")
public class AdminController {

    Logger logger=Logger.getLogger(HomeController.class);
    @Autowired
    UserService userService;
    @Autowired
    BlogService blogService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpSession session, @RequestParam(value = "username",required = true) String username,
                        @RequestParam(value = "password",required = true) String password) {
        if (username != null && password != null) {
            User user = new User();
            user.setName(username);
            user.setPassword(password);
            if (userService.get(user) == null) {
                return "there is no this user";
            } else {
                session.setAttribute("user", user);
            }
        }
        return "login success";
    }
    @RequestMapping("/logout")
    @ResponseBody
    public String logout(HttpSession session){
        if (session.getAttribute("user")!=null){
            session.setAttribute("user",null);
        }return "logout success";
    }

    @RequestMapping("uploadtest")
    public String uploadtest(HttpSession session)  {
        User user= (User) session.getAttribute("user");
        if (user!=null){
            return "fore/uploadTest";
        }
        return "redirect:home";
    }

    @RequestMapping("/upload")
    public String upload(UploadedImageFile file, HttpServletRequest request) throws IOException {
        String name="timg.jpg";
        File newFile=new  File(request.getServletContext().getRealPath("img"),name);
        newFile.getParentFile().mkdirs();
        file.getImage().transferTo(newFile);
        return "redirect:home";
    }

    @RequestMapping("/editTest")
    public String edit(HttpSession session){
        if (session.getAttribute("user")!=null){
            return "include/fore/editTest";
        }
        return "redirect:home";
    }

    @RequestMapping("/addBlog")
    public String addBlog(String blogContent,String title,String subtitle,int cid,UploadedImageFile file,HttpServletRequest request) throws IOException {
        Blog blog=new Blog();
        blog.setUid(1);
        blog.setTitle(title);
        blog.setSubtitle(subtitle);
        Category c1=new Category();
        c1.setId(cid);
        blog.setCategory(c1);
        blog.setUploadTime(new Date());
        BlogContent bc=new BlogContent();
        bc.setContent(blogContent);
        blogService.addBlog(blog,bc);
        String name="blogimg"+blog.getId()+".jpg";
        File newFile=new  File(request.getServletContext().getRealPath("img/img_title"),name);
        newFile.getParentFile().mkdirs();
        file.getImage().transferTo(newFile);
        return "redirect:home";
    }

    @RequestMapping("addQR")
    public String addQR(){
        return "include/blog/shareTest";
    }

    @RequestMapping(value = "/qrtest",method = RequestMethod.GET)
    public @ResponseBody ModelAndView qrtest(ModelAndView mov){
        mov.setViewName("include/fore/editTest");
        return mov;
    }
}
