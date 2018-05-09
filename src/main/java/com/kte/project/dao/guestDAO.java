package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.SortableVO;

@Service
public class guestDAO {
@Autowired
@Resource(name="sqlSession")
private SqlSession sqlsession = null;

	public List<ReservationVO> guest_reser(String id){
		return sqlsession.selectList("guest.guest_reser", id);
	}
	
	public List<ReservationVO> guest_reser_list(String id){
		return sqlsession.selectList("guest.guest_reser_list", id);
	}
	
	public List<ReservationVO> select_guest_reser_list(ReservationVO vo){
		return sqlsession.selectList("guest.select_guest_reser_list",vo);
	}
	
	public ReservationVO select_guest_reser(int code) {
		return sqlsession.selectOne("guest.select_guest_reser",code);
	}
	
	public CustomVO host_info(String id) {
		return sqlsession.selectOne("guest.host_info",id);
	}
}
