package com.kte.project.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;

@Service
public class CustomDAO {
@Autowired
@Resource(name="sqlSession")
private SqlSession sqlsession = null;

	public int passwordEdit(String pw) {
		return sqlsession.update("custom.passwordEdit", pw);
	}
}
