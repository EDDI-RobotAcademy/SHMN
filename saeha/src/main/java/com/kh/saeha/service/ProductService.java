package com.kh.saeha.service;

import java.util.List;
import java.util.Map;

import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

public interface ProductService {

	// 상품 등록
	public void productwrite(ProductVO productVO) throws Exception;

	// 굿즈상품 리스트
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception;

	// 한복상품 리스트
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception;

	// 등록 상품 조회
	public ProductVO read(int pd_bno) throws Exception;

	// 등록 상품 수정
	public void update(ProductVO productVO) throws Exception;

	// 등록상품 삭제
	public void delete(int pd_bno) throws Exception;

	// 굿즈 총 개수
	public int glistCount(SearchCriteria scri) throws Exception;
	
	// 한복 총 개수
	public int hlistCount(SearchCriteria scri) throws Exception;

	// 상품 조회수 증가
	public ProductVO readcount(int pd_bno) throws Exception;
	
	// 이미지 저장
	public void fileSave(Map<String, String> fileMap) throws Exception;
	
	// pd_bno얻기
	public int productbno(ProductVO productVO) throws Exception;
	
	// 이미지 삭제(테이블)
	public void idelete(int pd_bno) throws Exception;
	
	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	public String getImg(int pd_bno) throws Exception;
	
	// 게시물 사진 가져오기
	public List<ImgVO> imglist(int pd_bno) throws Exception;
}
