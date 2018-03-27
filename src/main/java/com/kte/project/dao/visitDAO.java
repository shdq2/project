package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;

@Service
public class visitDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;

	public int visit_chk(String id) {
		return sql.selectOne("admin_visit.visit_chk",id);
	}
	
	public int visit_insert(String id){
		return sql.insert("admin_visit.visit_insert",id);
	}
	
	public int today_visit() {
		return sql.selectOne("admin_visit.today_visit");
	}
	public int month_visit() {
		return sql.selectOne("admin_visit.month_visit");
	}
}	
