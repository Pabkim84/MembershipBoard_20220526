package com.its.membershipboard.controller;

import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

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
    @GetMapping("/login")
    public String login(){
        return "member/login";
    }
    @PostMapping("/login")
    public String login (@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            return "board/list";
        } else {

            return "member/login-failed";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "/index";
    }
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberDTOList", memberDTOList);
        return "member/memberList";
    }
    @GetMapping("/findById")
    public @ResponseBody MemberDTO findById(@RequestParam("id") Long id){
        MemberDTO memberDTO = memberService.findById(id);
        return memberDTO;
    }
    @GetMapping("/delete")
    public String delete(@RequestParam ("id") Long id) {
        boolean result = memberService.delete(id);
        if(result){
            return "redirect:/member/findAll";
        } else {
            return "member/delete-failed";
        }
    }

}
