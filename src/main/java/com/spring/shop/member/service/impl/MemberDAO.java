package com.spring.shop.member.service.impl;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.member.service.MemberVO;


@Repository
public class MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	

	public void insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		 sqlSession.insert("memberMapper.insertMember",memberVO);
	}
	public MemberVO login(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.login",memberVO);
	}
	public void updateMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.update("memberMapper.updateMember",memberVO);
	}
	public void memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("memberMapper.memberDelete", memberVO);
	}
	
	public int passChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("memberMapper.passChk", memberVO);
		return result;
	}
	
	public int idChk(MemberVO memberVO) {
		int result = sqlSession.selectOne("memberMapper.idChk", memberVO);
		return result;
	}
	
	public String find_id(String email) throws Exception {
		return sqlSession.selectOne("memberMapper.find_id", email);
	}

	public int update_pw(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.update_pw",memberVO);
	}
}
