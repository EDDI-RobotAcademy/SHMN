package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.LikelistVO;
@Repository
public class LikeDAOImpl implements LikeDAO {
	
	@Inject SqlSession sql;

	@Override
	public int likecount(LikeVO lvo) throws Exception {
	    return sql.selectOne("likeMapper.likecount", lvo);
	}

	@Override
	public int likegetinfo(LikeVO lvo) throws Exception {
		return sql.selectOne("likeMapper.likegetinfo",lvo);
	}

	@Override
	public void like(LikeVO lvo) throws Exception {
		sql.insert("likeMapper.like", lvo);

	}

	@Override
	public void likeupdate(LikeVO lvo) throws Exception {
		sql.update("likeMapper.likeupdate", lvo);
	}

	@Override
	public List<LikelistVO> likelist(String userId) throws Exception {
		return sql.selectList("likeMapper.likelist", userId);
	}

}
