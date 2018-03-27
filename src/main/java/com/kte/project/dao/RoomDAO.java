package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.RoomVO;

@Service
public class RoomDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;

	public List<RoomVO> selectRoomData() {
		return sqlsession.selectList("room.selectRoomData");
	}
}
