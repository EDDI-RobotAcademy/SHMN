package com.kh.saeha.dao;

import com.kh.saeha.vo.MemberVO;

public interface MemberDAO {

	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//회원가입시 ID 중복체크
	public String over(MemberVO vo) throws Exception;
	
	//PW찾기시 ID,이름,MAIL 받아오기
	public MemberVO findfind(MemberVO vo) throws Exception;
	
	//임시비밀번호 발급
	public void memberPWupdate(MemberVO vo) throws Exception;
	
}
