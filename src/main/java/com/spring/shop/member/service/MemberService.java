package com.spring.shop.member.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public interface MemberService {

	public void addMember(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	public void memberDelete(MemberVO memberVO);
	public int passChk(MemberVO memberVO);
	public int idChk(MemberVO memberVO);
	public String find_id(HttpServletResponse response, String email) throws Exception;
	public String create_key();
	public String getToken(HttpServletRequest request, HttpServletResponse response, JSONObject json, String requestURL) throws Exception;
	public void send_mail(MemberVO memberVO,String div) throws Exception;
	public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception;
}