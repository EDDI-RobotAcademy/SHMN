package com.kh.saeha.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.ProductDAO;
import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;

	// 굿즈 등록
	@Override
	public void productwrite(ProductVO productVO) throws Exception {
		dao.productwrite(productVO);
	}

	// 굿즈 리스트
	@Override
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception {
		return dao.goodslist(scri);
	}

	// 한복 리스트
	@Override
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception {
		
		return dao.hanboklist(scri);
	}

	// 굿즈 조회
	@Override
	public ProductVO read(int pd_bno) throws Exception {
		return dao.read(pd_bno);
	}

	// 굿즈 수정
	@Override
	public void update(ProductVO productVO) throws Exception {
		dao.update(productVO);
	}

	// 굿즈 삭제
	@Override
	public void delete(int pd_bno) throws Exception {
		dao.delete(pd_bno);
	}

	// 굿즈 총 개수
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return dao.glistCount(scri);
	}

	// 굿즈 조회수 증가
	@Override
	public ProductVO readcount(int pd_bno) throws Exception {
		return dao.readcount(pd_bno);
	}
	
	// 한복 총 개수
	@Override
	public int hlistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.hlistCount(scri);
	}
	
	// 이미지 저장
	@Override
	public void fileSave(Map<String, String> fileMap) throws Exception {
		
		dao.fileSave(fileMap);
		
	}
	
	
	// pd_bno얻기
	@Override
	public int productbno(ProductVO productVO) throws Exception {
		return dao.productbno(productVO);
	}
	
	//이미지 삭제(테이블)
	@Override
	public void idelete(int pd_bno) throws Exception {
		dao.idelete(pd_bno);
	}
	
	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	@Override
	public String getImg(int pd_bno) throws Exception {
		return dao.getImg(pd_bno);
	}
	
	// 게시글 사진 얻어오기
	@Override
	public List<ImgVO> imglist(int pd_bno) throws Exception {
		
		return dao.imglist(pd_bno);
	}

}
