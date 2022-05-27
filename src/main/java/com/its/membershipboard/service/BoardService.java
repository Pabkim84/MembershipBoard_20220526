package com.its.membershipboard.service;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTO = boardRepository.findAll();
        return boardDTO;
    }

    public boolean save(BoardDTO boardDTO) {
        int result = boardRepository.save(boardDTO);
        if(result>0){
            return true;
        } else {
            return false;
        }
    }

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = boardRepository.findById(id);
        return boardDTO;
    }
}
