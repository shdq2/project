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
public class adminreservationDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public List<ReservationVO> reservation_all() {
		return sql.selectList("admin_reservation.reservation_all");
	}
	
}	
