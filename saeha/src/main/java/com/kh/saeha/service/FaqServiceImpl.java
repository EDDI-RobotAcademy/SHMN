package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.FaqDAO;
import com.kh.saeha.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	 private FaqDAO dao;

	//목록
	@Override
	public List<FaqVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}	//dao.list(); dao에있는 list()함수를 호출해서 반환

	//작성
	@Override
	public void insert(FaqVO faqVO) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(faqVO);
	}

	//조회
	@Override
	public FaqVO read(int faq_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(faq_bno);
	}

	//수정
	@Override
	public void update(FaqVO faqVO) throws Exception{
		
		dao.update(faqVO);
	}
	//삭제
	@Override
	public void delete(int faq_bno) throws Exception{
		
		dao.delete(faq_bno);
	}
	
}
