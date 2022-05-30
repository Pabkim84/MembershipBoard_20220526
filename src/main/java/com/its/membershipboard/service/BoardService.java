package com.its.membershipboard.service;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.dto.PageDTO;
import com.its.membershipboard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTO = boardRepository.findAll();
        return boardDTO;
    }
    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = boardRepository.findById(id);
        return boardDTO;
    }

    public void saveFile(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1.
        String boardFileName = boardFile.getOriginalFilename(); // 2.
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2.1.
        String savePath="D:\\spring_img\\" + boardFileName; // 4.
        // 5.
        if (!boardFile.isEmpty()) {
            boardDTO.setBoardFileName(boardFileName); // 3.
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.saveFile(boardDTO); // 6.
    }

    private static final int PAGE_LIMIT = 3; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 2; // 보여줄 필요 페이지 수


    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount(); // 글 갯수 조회
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); // 필요한 전체 페이지 갯수(소숫점 올림)
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1; // 시작페이지 1 4 7 10
        int endPage = startPage + BLOCK_LIMIT - 1; // 끝페이지 3 6 9 12
        if(endPage > maxPage)
            endPage = maxPage; // end페이지가 필요페이지보다 크면 end페이지를 필요페이지와 동일하게 한다.
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }

    public boolean update(BoardDTO boardDTO) {
        int updateResult = boardRepository.update(boardDTO);
        if(updateResult>0) {
            return true;
        } else {
            return false;
        }
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }
}
