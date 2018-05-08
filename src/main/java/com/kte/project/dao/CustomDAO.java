package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.SortableVO;

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
	
	public int phone_edit(CustomVO vo) {
		return sqlsession.update("custom.phone_edit",vo);
	}
	
	public List<CustomVO> upload_profile(CustomVO vo) {
		return sqlsession.selectList("custom.upload_profile",vo);
	}
	
	public List<CustomVO> select_profile(String id) {
		return sqlsession.selectList("custom.select_profile",id);
	}
	
	public CustomVO show_profile(int id) {
		return sqlsession.selectOne("custom.show_profile",id);
	}
	
	public List<CustomVO> delete_profile(CustomVO vo) {
		return sqlsession.selectList("custom.delete_profile",vo);
	}
	
	public int profile_sortable(SortableVO vo) {
		return sqlsession.update("custom.profile_sortable",vo);
	}
	
	
}
