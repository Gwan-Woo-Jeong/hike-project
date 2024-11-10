package com.test.hike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
    @GetMapping("")
    public String index() {
        return "mypage.index"; 
    }
    
    @GetMapping("/infoedit")
    public String infoedit() {
        return "/mypage/infoedit";  
    }
}

