package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.service.EventService;
import com.kh.saeha.vo.EventVO;

@Service
public class EventServiceImpl implements EventService {

	@Inject EventDAO dao;
	
	// 게시글 작성
	@Override
	public void write(EventVO eventvo) throws Exception {
		dao.write(eventvo);
	}
	
	// 게시글 삭제
	@Override
	public void delete(int et_bno) throws Exception {
		dao.delete(et_bno);
	}

	// 게시글 상세보기
	@Override
	public EventVO read(int et_bno) throws Exception {
		return dao.read(et_bno);
	}

	// 사진 투표하기
	@Override
	public void vote(EventVO eventvo) throws Exception {
		dao.vote(eventvo);
	}

	// 게시글 불러오기(최신순)
	@Override
	public List<EventVO> recently() throws Exception {
		return dao.recently();
	}

	// 게시글 불러오기(투표순)
	@Override
	public List<EventVO> popular() throws Exception {
		return dao.popular();
	}

	// 해당 id 확인하기
	@Override
	public EventVO check(String et_memberid) throws Exception {
		return dao.check(et_memberid);
	}

}
