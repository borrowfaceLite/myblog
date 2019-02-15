package com.borrowface.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {
    @RequestMapping("admin")
    public String admin(){return "redirect:login";}
}
