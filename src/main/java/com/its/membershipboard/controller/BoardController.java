package com.its.membershipboard.controller;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.service.BoardService;
import com.its.membershipboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/board")
@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/save")
    public String save(){
        return "board/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO){
        System.out.println("boardDTO = " + boardDTO);
        boolean result = boardService.save(boardDTO);
        return "redirect:/board/findAll";
    }
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardDTOList", boardDTOList);
        return "board/list";
    }
    @GetMapping("/list")
    public String list(){
        return "board/list";
    }
    @GetMapping("/findById")
    public String findById(@RequestParam ("id") Long id, Model model){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        return "board/list";
    }
}
