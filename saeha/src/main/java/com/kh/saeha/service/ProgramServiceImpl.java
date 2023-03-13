package com.kh.saeha.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.ProgramDAO;
import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class ProgramServiceImpl implements ProgramService {
	
	@Inject
	ProgramDAO dao;

	@Override
	public void upload(ProgramVO vo) throws Exception {
		dao.upload(vo);
	}

	@Override
	public void programUpdate(ProgramVO vo) throws Exception {
		dao.programUpdate(vo);
	}



	

	@Override
	public List<ProgramVO> programlist(String pg_type) throws Exception {
		return dao.programlist(pg_type);
	}

	

	@Override
	public ProgramVO programread(int bno) throws Exception {
		return dao.programread(bno);
	}

	@Override
	public int plistCount(SearchCriteria scri) throws Exception {
		return dao.plistCount(scri);
	}

	@Override
	public ProgramVO bookview(int bno) throws Exception {
		return dao.bookview(bno);
	}

	@Override
	public void programDelete(int bno) throws Exception {
		dao.programDelete(bno);
	}

	@Override
	public void pfileSave(Map<String, String> fileMap) throws Exception {
		dao.pfileSave(fileMap);
	}

	@Override
	public int programbno(ProgramVO vo) throws Exception {
		return dao.programbno(vo);
	}

	@Override
	public void pidelete(int pg_bno) throws Exception {
		dao.pidelete(pg_bno);
	}

	@Override
	public String pgetImg(int pg_bno) throws Exception {
		return dao.pgetImg(pg_bno);
	}

	@Override
	public List<ImgVO> pimglist(int pg_bno) throws Exception {
		return dao.pimglist(pg_bno);
	}

	

	

}
