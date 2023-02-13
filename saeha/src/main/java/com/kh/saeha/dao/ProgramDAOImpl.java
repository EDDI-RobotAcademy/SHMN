package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<ProgramVO> programlist(String type) throws Exception {
		return sql.selectList("programMapper.plistPage",type);
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





}
