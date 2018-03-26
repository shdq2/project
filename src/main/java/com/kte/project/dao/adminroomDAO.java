package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.RoomVO;

@Service
public class adminroomDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public List<RoomVO> roomList(RoomVO vo){
		return sql.selectList("admin_room.select_room",vo);
	}
	
	public int total_room_count() {
		return sql.selectOne("admin_room.total_room_count");
	}

}	
