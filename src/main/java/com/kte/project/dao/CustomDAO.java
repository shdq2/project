package com.kte.project.dao;

import java.util.List;

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
	
	public CustomVO selectmember(String id) {
		return sqlsession.selectOne("custom.selectCustomOne",id);
	}
	
	public int customedit(CustomVO vo) {
		return sqlsession.update("custom.custom_edit",vo);
	}
	
	public List<CustomVO> bank_list() {
		return sqlsession.selectList("custom.bank_list");
	}
	
	public int delete_phone(String id) {
		return sqlsession.update("custom.delete_phone",id);
	}
}
