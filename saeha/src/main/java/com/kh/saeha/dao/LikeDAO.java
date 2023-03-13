package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.LikelistVO;

public interface LikeDAO {

	
	public int likecount(LikeVO lvo) throws Exception;	
	
	public int likegetinfo(LikeVO lvo) throws Exception;
	
	public void like(LikeVO lvo) throws Exception;
	
	public void likeupdate(LikeVO lvo) throws Exception;	
	
	public List<LikelistVO> likelist(String userId) throws Exception;
	
}
