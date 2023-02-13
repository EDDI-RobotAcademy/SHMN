package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.ProgramDAO;
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
	public List<ProgramVO> programlist(String type) throws Exception {
		return dao.programlist(type);
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

	

	

}
