package com.kh.saeha.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 상품 등록
	@Override
	public void productwrite(ProductVO productVO) throws Exception {
		sqlSession.insert("productMapper.insert", productVO);
	}
	
	
	// 굿즈 리스트
	@Override
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("productMapper.goodslist", scri);
	}
	
	// 한복 리스트
	@Override
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("productMapper.hanboklist", scri);
	}
	
	// 상품 조회
	@Override
	public ProductVO read(int pd_bno) throws Exception {
		return sqlSession.selectOne("productMapper.read", pd_bno);
	}
	
	// 상품 수정
	@Override
	public void update(ProductVO productVO) throws Exception {
		sqlSession.update("productMapper.update", productVO);
	}
	
	
	// 상품 삭제
	@Override
	public void delete(int pd_bno) throws Exception {
		sqlSession.delete("productMapper.delete", pd_bno);
	}

	// 굿즈 카운트
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("productMapper.glistCount", scri);
	}

	// 상품 조회수
	@Override
	public ProductVO readcount(int pd_bno) throws Exception {
		return sqlSession.selectOne("productMapper.readCount", pd_bno);
	}

	// 한복 카운트
	@Override
	public int hlistCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("productMapper.hlistCount", scri);
	}

	
	// 이미지 저장
	@Override
	public void fileSave(Map<String, String> fileMap) throws Exception {
		sqlSession.insert("productMapper.fileSave", fileMap);
	}

	// pd_bno얻기
	@Override
	public int productbno(ProductVO productVO) throws Exception {
		
		int pnum;
		
		pnum = sqlSession.selectOne("productMapper.maxbno");
		
		return pnum;
	}

	
	// 이미지 삭제(테이블)
	@Override
	public void idelete(int pd_bno) throws Exception {
		sqlSession.delete("productMapper.idelete", pd_bno);
	}

	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	@Override
	public String getImg(int pd_bno) throws Exception {
		return sqlSession.selectOne("productMapper.getimg", pd_bno);
	}

	// 게시글 사진 가져오기
	@Override
	public List<ImgVO> imglist(int pd_bno) throws Exception {
		return sqlSession.selectList("productMapper.imglist", pd_bno);
	}



}
