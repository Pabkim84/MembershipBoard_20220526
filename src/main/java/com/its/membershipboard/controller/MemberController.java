package com.its.membershipboard.controller;

import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/member")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save")
    public String save(){
    return "member/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
      boolean result = memberService.save(memberDTO);
      if(result){
          return "index";
      }else {
          return "index";
      }

    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        System.out.println("memberId = " + memberId);
        return memberService.duplicateCheck(memberId);
    }
}
