package com.kh.saeha.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.saeha.dao.GoodsBoardDAO;
import com.kh.saeha.vo.GoodsBoardImgVO;
import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class GoodsBoardServiceImpl implements GoodsBoardService {


	@Inject GoodsBoardDAO dao;
	
	
	@Override
	public void write(GoodsBoardVO GoodsBoardVO) throws Exception {
		
		dao.write(GoodsBoardVO);
	}

	@Override
	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}

	@Override
	public GoodsBoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void update(GoodsBoardVO boardVO) throws Exception {
		
		dao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public double devideCount(SearchCriteria scri) throws Exception {
		return dao.devideCount(scri);
	}

	// 이미지 저장
	@Override
	public void fileSave(Map<String, String> fileMap) throws Exception {
		dao.fileSave(fileMap);
	}
	
	// pd_bno얻기
	@Override
	public int productbno(GoodsBoardVO GoodsBoardVO) throws Exception {
		return dao.productbno(GoodsBoardVO);
	}

	//이미지 삭제(테이블)
	@Override
	public void idelete(int gw_bno) throws Exception {
		dao.idelete(gw_bno);
	}

	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	@Override
	public String getImg(int gw_bno) throws Exception {
		return dao.getImg(gw_bno);
	}

	// 게시글 사진 얻어오기
	@Override
	public List<GoodsBoardImgVO> imglist(int gw_bno) throws Exception {
		return dao.imglist(gw_bno);
	}

}
