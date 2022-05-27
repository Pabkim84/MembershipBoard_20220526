package com.its.membershipboard.controller;

import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save")
    public String save(){
        return "board/save";
    }
    @GetMapping("/list")
    public String list(){
        return "board/list";
    }
}
