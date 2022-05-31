package com.its.membershipboard.service;

import com.its.membershipboard.dto.BoardDTO;
import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath="D:\\spring_img\\" + memberProfileName;
        // 5.
        if (!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
        }
        int result = memberRepository.save(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        return memberDTOList;
    }

    public MemberDTO findById(Long id) {
        MemberDTO memberDTO = memberRepository.findById(id);
        return memberDTO;
    }

    public boolean delete(Long id) {
        int result = memberRepository.delete(id);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean update(MemberDTO memberDTO) {
        int updateResult = memberRepository.update(memberDTO);
        if (updateResult > 0) {
            return true;
        } else {
            return false;
        }
    }
}