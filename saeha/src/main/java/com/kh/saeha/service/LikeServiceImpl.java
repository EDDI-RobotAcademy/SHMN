package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.LikeDAO;
import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.LikelistVO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	LikeDAO dao;

	@Override
	public int likecount(LikeVO lvo) throws Exception {
		return dao.likecount(lvo);
	}

	@Override
	public int likegetinfo(LikeVO lvo) throws Exception {
		return dao.likegetinfo(lvo);
	}

	@Override
	public void like(LikeVO lvo) throws Exception {
		dao.like(lvo);
	}

	@Override
	public void likeupdate(LikeVO lvo) throws Exception {
		dao.likeupdate(lvo);
	}

	@Override
	public List<LikelistVO> likelist(String userId) throws Exception {
		return dao.likelist(userId);
	}

}
