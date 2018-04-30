package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;

@Service
public class adminmemberDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	

	public List<CustomVO> AdminUserMain(int page){
		return sql.selectList("admin_member.AdminUserMain",page);
	}
	
	public int room_count(String custom_id){
		return sql.selectOne("admin_member.room_count",custom_id);
	}
	
	public int member_block(CustomVO vo) {
		return sql.update("admin_member.member_block",vo);
	}
	
	public CustomVO admin_member_select(String id) {
		return sql.selectOne("admin_member.admin_member_select",id);
	}
	
	public List<ReservationVO> reser_list(ReservationVO vo){
		return sql.selectList("admin_reservation.reservation_member",vo);
	}
	public int reser_total(String id) {
		return sql.selectOne("admin_reservation.reser_total",id);
	}
}	
