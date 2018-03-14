package com.kte.project.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.WishVO;

@Service
public class MainDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int selectLastWishcNo() {
		return sqlsession.selectOne("Wish.selectLastWishcNo");
	}
	
	public int selectLastWishcode() {
		return sqlsession.selectOne("Wish.selectLastWishcode");
	}
	
	public int insertWish(WishVO vo) {
		return sqlsession.insert("Wish.insertWish", vo);
	}
	
}
