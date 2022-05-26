package com.its.membershipboard.service;

import com.its.membershipboard.dto.MemberDTO;
import com.its.membershipboard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) {
    int result = memberRepository.save(memberDTO);
    if(result>0){
        return true;
    } else {
        return false;
    }
    }

    public String duplicateCheck(String memberId) {
    String checkResult = memberRepository.duplicateCheck(memberId);
    if(checkResult==null){
        return "ok";
    } else {
        return "no";
    }
    }
}
