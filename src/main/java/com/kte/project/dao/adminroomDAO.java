package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.RoomVO;

@Service
public class adminroomDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public List<RoomVO> roomList(RoomVO vo){
		return sql.selectList("admin_room.select_room",vo);
	}
	
	public int total_room_count(String id) {
		return sql.selectOne("admin_room.total_room_count",id);
	}

	public List<RoomVO> allroomList(ReservationVO vo){
		return sql.selectList("admin_room.all_room",vo);
	}
	
	public int room_count() {
		return sql.selectOne("admin_room.room_count");
	}
	
	public int state_change(RoomVO vo) {
		return sql.update("admin_room.state_change",vo);
	}
	
	public RoomVO room_img(String room_code) {
		return sql.selectOne("admin_room.room_img",room_code);
	}
	
	public List<RoomVO> room_search(RoomVO vo){
		return sql.selectList("admin_room.room_search",vo);
	}
	
	public int room_search_count(RoomVO vo){
		return sql.selectOne("admin_room.room_search_count",vo);
	}
}	
