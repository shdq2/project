package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.WishVO;

@Service
public class admin_wishDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public int wish_count() {
		return sql.selectOne("admin_wish.wish_count");
	}
	
	public List<WishVO> wish_list(int page){
		return sql.selectList("admin_wish.wish_list",page);
	}

	public int wish_all() {
		return sql.selectOne("admin_wish.wish_all");
	}
	
	public int wish_update(int code) {
		return sql.update("admin_wish.wish_update",code);
	}
	
	public WishVO wish_One(int code) {
		return sql.selectOne("admin_wish.wish_One",code);		
	}
	
	public int wish_pre(int code) {
		return sql.selectOne("admin_wish.wish_pre",code);
	}
	
	public int wish_next(int code) {
		return sql.selectOne("admin_wish.wish_next",code);
	}
}	
