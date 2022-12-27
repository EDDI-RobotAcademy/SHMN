package com.kh.saeha.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;
	
	//회원가입
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
		
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		
		return sql.selectOne("memberMapper.login", vo);
	}
	
	//서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		
		//vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace
		//아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		sql.update("memberMapper.memberUpdate", vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		//MemberVO에 담긴 값들을 보내줍니다.
		//그럼 xml에서 memberMapper.memberDelete에 보시면
		//#{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요
		sql.delete("memberMapper.memberDelete", vo);
	}

	@Override
	public String over(MemberVO vo) throws Exception {
		//MemberVO에 담긴 값을 가져옵니다.
		//그 후, member_id 데이터 값들과 비교합니다.
		//데이터 값이 있을 경우 값을 받아오고(중복상태), 없을경우 null을 받아와 사용할 수 있게 합니다.(사용가능한상태)
		return sql.selectOne("memberMapper.over", vo);
	}

	@Override
	public MemberVO findfind(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.findfind", vo);
	}

	@Override
	public void memberPWupdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberPWupdate", vo);
	}
}
