package com.its.membershipboard.repository;

import com.its.membershipboard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {
    return sql.insert("Member.save", memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.memberId", memberId);
    }
}