package com.its.membershipboard.controller;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
            session.setAttribute("id",loginMember.getId());
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            return "redirect:/board/paging";
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
    @GetMapping("/detail")
    public String detail(@RequestParam("id")Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO" ,memberDTO);
        return "member/myPage";
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
    @GetMapping("/update")
    public String updateForm(@RequestParam ("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("boardUpdate", memberDTO);
        return "board/update";
    }
    //수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean updateResult = memberService.update(memberDTO);
        return "redirect:/member/detail?id=" + memberDTO.getId();
    }
}
