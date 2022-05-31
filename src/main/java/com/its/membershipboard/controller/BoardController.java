package com.its.membershipboard.controller;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.dto.CommentDTO;
import com.its.membershipboard.service.BoardService;
import com.its.membershipboard.dto.PageDTO;
import com.its.membershipboard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RequestMapping("/board")
@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;
    @GetMapping("/save")
    public String saveFileForm() {
        return "board/save";
    }
    //파일첨부 글작성 처리
    @PostMapping("/save")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        boardService.saveFile(boardDTO);
        return "redirect:/board/paging";
    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/pagingList";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam ("id") Long id, Model model,
                           @RequestParam (value = "page", required = false, defaultValue = "1") int page){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList =   commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "board/detail";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam ("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardUpdate", boardDTO);
        return "board/update";
    }
    //수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boolean updateResult = boardService.update(boardDTO);
        return "redirect:/board/detail?id=" + boardDTO.getId();
    }
    @GetMapping("/delete")
    private String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "board/pagingList";
    }
}
