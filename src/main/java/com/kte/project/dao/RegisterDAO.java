package com.kte.project.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;

@Service
public class RegisterDAO {
@Autowired
@Resource(name="sqlSession")
private SqlSession sqlsession = null;

	public int insertRegister(CustomVO vo) {
		return sqlsession.insert("register.insertRegister", vo);
	}
	
	public int id_check(String id) {
	    return sqlsession.selectOne("register.id_check",id);
	}
}
