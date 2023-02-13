package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject SqlSession sqlSession;
	private static String namespace = "faqMapper";


	//게시글 목록
	@Override
	public List<FaqVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}
	//Mapper.xml에서 id가 list인것을 가져와서 반환

	
	//게시글 작성
	@Override
	public void insert(FaqVO faqVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("faqMapper.insert", faqVO);
	}

	//게시글 조회
	@Override
	public FaqVO read(int faq_bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("daoimpl 조회");
		return sqlSession.selectOne("faqMapper.read", faq_bno);
	}
	
	//게시글 수정
	@Override
	public void update(FaqVO faqVO) throws Exception{
		
		sqlSession.update("faqMapper.update", faqVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(int faq_bno) throws Exception{
		sqlSession.delete("faqMapper.delete", faq_bno);
	

	}
}
