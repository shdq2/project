package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;

@Service
public class admin_wishDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public int wish_count() {
		return sql.selectOne("admin_wish.wish_count");
	}
	

}	
