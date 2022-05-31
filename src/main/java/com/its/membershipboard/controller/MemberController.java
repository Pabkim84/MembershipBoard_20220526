package com.its.membershipboard.controller;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/member")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/")
    public String index() {
        return "index";
    }
    @GetMapping("/save")
    public String save(){
    return "member/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
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
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberDTOList", memberDTOList);
        return "member/memberList";
    }
    @GetMapping("/finaadById")
    public @ResponseBody MemberDTO findById(@RequestParam("id") Long id){
        MemberDTO memberDTO = memberService.findById(id);
        return memberDTO;
    }
    @GetMapping("/delete")
    public String delete(@RequestParam ("id") Long id, HttpSession session) {
        boolean result = memberService.delete(id);
        if(result){
            if(session.getAttribute("loginMemberId").equals("admin")){
                return "redirect:/member/findAll";
            } else {
                session.invalidate();
                return "/index";
            }
        } else {
            return "member/delete-failed";
        }
    }
    @GetMapping("/update")
    public String updateForm(HttpSession session, Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberUpdate", memberDTO);
        return "member/update";
    }
    //수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean updateResult = memberService.update(memberDTO);
        return "redirect:/member/detail?id=" + memberDTO.getId();
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
            session.setAttribute("loginPassword", loginMember.getMemberPassword());
            return "redirect:/board/paging";
        } else {

            return "member/login-failed";
        }
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id")Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO" ,memberDTO);
        return "member/myPage";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "/index";
    }
}
