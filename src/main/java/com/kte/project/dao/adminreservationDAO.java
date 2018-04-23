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
	
	public int profile_img(String id) {
		return sql.selectOne("admin_reservation.profile_img",id);
	}
	
	public ReservationVO select_reser(int code) {
		return sql.selectOne("admin_reservation.select_reser",code);
	}
	
	public int update_state(ReservationVO vo) {
		return sql.update("admin_reservation.update_state",vo);
	}
	
	public List<ReservationVO> state_count() {
		return sql.selectList("admin_reservation.state_count");
	}
	
	public int reser_count() {
		return sql.selectOne("admin_reservation.reser_count");
	}
	
	public CustomVO admin_show_profile(String id) {
		return sql.selectOne("admin_reservation.admin_show_profile",id);
	}
	
	public CustomVO admin_custom(String id) {
		return sql.selectOne("admin_reservation.admin_custom",id);
	}
	
	public int reser_member_count(String id) {
		return sql.selectOne("admin_reservation.reser_member_count",id);
	}
}	
