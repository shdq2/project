package com.kte.project.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;


@Service
public class LoginDAO {
@Autowired
@Resource(name="sqlSession")
private SqlSession sqlsession = null;

	public CustomVO selectCustomOne(CustomVO vo) {
		
		return sqlsession.selectOne("login.selectCustomOne", vo);
	}
	
	public int confirmPw(CustomVO vo) {
		return sqlsession.selectOne("login.confirmPw", vo);
	}
}
