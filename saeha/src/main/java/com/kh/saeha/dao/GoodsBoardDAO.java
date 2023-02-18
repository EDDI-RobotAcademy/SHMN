package com.kh.saeha.dao;

import java.util.List;
import java.util.Map;

import com.kh.saeha.vo.GoodsBoardImgVO;
import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;

public interface GoodsBoardDAO {
	
	public void write(GoodsBoardVO boardVO) throws Exception;

	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

	public GoodsBoardVO read(int bno) throws Exception;

	public void update(GoodsBoardVO boardVO) throws Exception;

	public void delete(int bno) throws Exception;
	
	public double devideCount(SearchCriteria scri) throws Exception;
	
	// 이미지 저장
	public void fileSave(Map<String, String> fileMap) throws Exception;
	
	// gw_bno 얻기
	public int productbno(GoodsBoardVO GoodsBoardVO) throws Exception;
	
	//이미지 삭제(테이블)
	public void idelete(int gw_bno) throws Exception;
	
	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	public String getImg(int gw_bno) throws Exception;
	
	// 게시글 사진 얻어오기
	public List<GoodsBoardImgVO> imglist(int gw_bno) throws Exception;
	
}
