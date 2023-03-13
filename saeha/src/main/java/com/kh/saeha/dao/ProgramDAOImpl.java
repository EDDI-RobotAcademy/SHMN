package com.kh.saeha.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class ProgramDAOImpl implements ProgramDAO {
	
	@Inject SqlSession sql;

	@Override
	public void upload(ProgramVO vo) throws Exception {
		sql.insert("programMapper.upload", vo);
	}

	@Override
	public void programUpdate(ProgramVO vo) throws Exception {
		sql.update("programMapper.programUpdate", vo);
	}

	

	@Override
	public List<ProgramVO> programlist(String pg_type) throws Exception {
		return sql.selectList("programMapper.plistPage",pg_type);
	}

	


	@Override
	public ProgramVO programread(int bno) throws Exception {
		return sql.selectOne("programMapper.programread",bno);
	}

	@Override
	public int plistCount(SearchCriteria scri) throws Exception {
		return sql.selectOne("programMapper.plistCount",scri);
	}

	@Override
	public ProgramVO bookview(int bno) throws Exception {
		return sql.selectOne("programMapper.bookview",bno);
	}

	@Override
	public void programDelete(int bno) throws Exception {
		sql.delete("programMapper.programDelete",bno);
		
	}

	@Override
	public void pfileSave(Map<String, String> fileMap) throws Exception {
		sql.insert("programMapper.pfileSave", fileMap);		
	}

	@Override
	public int programbno(ProgramVO vo) throws Exception {
		
		int pgnum;
		
		pgnum = sql.selectOne("programMapper.maxbno");
		return pgnum;
	}

	@Override
	public void pidelete(int pg_bno) throws Exception {
		sql.delete("programMapper.idelete",pg_bno);
	}

	@Override
	public String pgetImg(int pg_bno) throws Exception {
		return sql.selectOne("programMapper.pgetimg",pg_bno);
	}

	@Override
	public List<ImgVO> pimglist(int pg_bno) throws Exception {
		return sql.selectList("programMapper.pimglist", pg_bno);
	}





}
