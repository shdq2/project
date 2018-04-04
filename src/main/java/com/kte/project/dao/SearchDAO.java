package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.RoomVO;
import com.kte.project.VO.boundVO;

@Service
public class SearchDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;

	/*public List<RoomVO> selectRoomData() {
		return sqlsession.selectList("room.selectRoomData");
	}*/
	
	public List<RoomVO> getMarker(boundVO vo) {
		return sqlsession.selectList("search.getMarker", vo);
	}
	
	public int getCount(boundVO vo) {
		return sqlsession.selectOne("search.getMarker_count", vo);
	}
}
