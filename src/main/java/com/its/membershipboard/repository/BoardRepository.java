package com.its.membershipboard.repository;

import com.its.membershipboard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<BoardDTO> findAll() {
        return sql.selectList("Board.boardList");
    }

    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.save", boardDTO);
    }

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.findById", id);
        return boardDTO;
    }
}
