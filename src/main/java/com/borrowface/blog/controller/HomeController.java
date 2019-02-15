package com.borrowface.blog.controller;

import com.borrowface.blog.pojo.Blog;
import com.borrowface.blog.pojo.Category;
import com.borrowface.blog.pojo.UploadedImageFile;
import com.borrowface.blog.pojo.User;
import com.borrowface.blog.service.BlogService;
import com.borrowface.blog.service.CategoryService;
import com.borrowface.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.security.provider.MD2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {

    Logger logger=Logger.getLogger(HomeController.class);

    @Autowired
    UserService userService;
    @Autowired
    BlogService blogService;
    @Autowired
    CategoryService categoryService;


    @RequestMapping("home")
    public String home(Model model, @RequestParam(required = false) Integer start, HttpSession session){
        int count=blogService.count();
        List<Category> cs=categoryService.list();
        if (start==null){
            List<Blog> blogs=blogService.list(0);
            if (5<count){
                model.addAttribute("hasNext","1");
                model.addAttribute("start",5);
            }
            model.addAttribute("blogs",blogs);
            session.setAttribute("cs",cs);
            model.addAttribute("isHome","1");
            return "/fore/home";
        }
        else {
            List<Blog> blogs=blogService.list(start);
            if (start+5<count){
                model.addAttribute("hasNext","1");
                model.addAttribute("start",start+5);
                if (!(start-5<0)){
                    model.addAttribute("hasPrevious","1");
                    model.addAttribute("previous",start-5);
                }
            }else if (start+5>count&&start-5>0){
                model.addAttribute("hasPrevious","1");
                model.addAttribute("previous",start-5);
            }
            model.addAttribute("blogs",blogs);
            session.setAttribute("cs",cs);
            return "/fore/home";
        }
    }

    @RequestMapping("blog")
    public ModelAndView blog(@RequestParam Integer blogId){
        Blog blog=blogService.get(blogId);
        ModelAndView mov=new ModelAndView();
        String conent=blogService.getContent(blogId).getContent();
//        conent= conent.replaceAll("\\n","\\\\n");
        mov.addObject("content",conent);
        logger.debug("content:"+conent);
        mov.setViewName("include/blog/blogPage");
        mov.addObject("blog",blog);
        return mov;
    }

    @RequestMapping("archive")
    public @ResponseBody ModelAndView archive(){
        List<Category> cs=categoryService.list();
        ModelAndView mov=new ModelAndView();
        mov.setViewName("include/fore/archivePage");
        mov.addObject("cs",cs);
        return mov;
    }

    @RequestMapping("category")
    public @ResponseBody ModelAndView cartegory(@RequestParam int cid){
        List<Blog> blogs=blogService.listByC(cid);
        ModelAndView mov=new ModelAndView();
        mov.setViewName("include/fore/homePage");
        mov.addObject("blogs",blogs);
        return mov;
    }

    @RequestMapping("test")
    public String test(Model model,HttpSession session){
        return "include/blog/blogPage";
    }


}
