package com.kh.saeha.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.MemberDAO;
import com.kh.saeha.vo.MemberVO;

@Service
public class MemberServiceimpl implements MemberService{

	@Inject
	MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception{
		
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{

		System.out.println("vo============");
		System.out.println(vo);
		return dao.login(vo);
	}
	
	//Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		//받은 vo를 DAO로 보내줍니다.
		dao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		dao.memberDelete(vo);
	}

	@Override
	public String Over(MemberVO vo) throws Exception {
		//dao에서 받아온 기능을 service에서 사용합니다.
		return dao.over(vo);
	}

	@Override
	public MemberVO findfind(MemberVO vo) throws Exception {
		//비밀번호찾기에서 ID, 이름, MAIL 받아오는 것
		return dao.findfind(vo);
	}

	@Override
	public void memberPWupdate(MemberVO vo) throws Exception {
		dao.memberPWupdate(vo);
	}
}
