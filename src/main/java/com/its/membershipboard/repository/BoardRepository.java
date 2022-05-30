package com.its.membershipboard.repository;

import com.its.membershipboard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
        sql.update("Board.hits", id);
        BoardDTO boardDTO = sql.selectOne("Board.findById", id);
        return boardDTO;
    }
    public void saveFile(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }
    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }

    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update", boardDTO);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }
}
