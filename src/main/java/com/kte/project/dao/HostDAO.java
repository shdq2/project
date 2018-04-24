package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.HostVO;
import com.kte.project.VO.HostchkVO;

@Service
public class HostDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int selectRoomCode() {
		return sqlsession.selectOne("Host.selectLastRoomcode");
	}
	
	public int insertHostCreate(HostVO vo) {
		return sqlsession.insert("Host.insertHostCreate",vo);
	}
	
	public int updateHostName(HostVO vo) {
		return sqlsession.update("Host.updateHostName", vo);
	}
	
	public int selectLastRoomImgCode() {
		return sqlsession.selectOne("Host.selectLastRoomImgcode");
	}
	
	public int insertHostImg(HostVO vo) {
		return sqlsession.insert("Host.insertHostImg", vo);
	}
	
	public List<HostVO> selectRoomImgList(int room_code) {
		return sqlsession.selectList("Host.selectRoomImgList", room_code);
	}
	
	public HostVO selectRoomImg(int room_img_code) {
		return sqlsession.selectOne("Host.selectRoomImg", room_img_code);
	}
	
	public int deleteRoomImg(int room_img_code) {
		return sqlsession.delete("Host.deleteRoomImg", room_img_code);
	}
	
	public HostVO selectHostBasic(int room_code) {
		return sqlsession.selectOne("Host.selectHostBasic", room_code);
	}
	
	public int updateHostBasic(HostVO vo) {
		return sqlsession.update("Host.updateHostBasic", vo);
	}
	
	public int updateRoomInOut(HostVO vo) {
		return sqlsession.update("Host.updateRoomInOut", vo);
	}
	
	public int insertRoomAmenity(HostchkVO vo) {
		return sqlsession.insert("Host.insertRoomAmenity", vo);
	}
	
	public int updateRoomAmenity(HostchkVO vo) {
		return sqlsession.update("Host.updateRoomAmenity", vo);
	}
	
	public int selectOptionRoomCode() {
		return sqlsession.selectOne("Host.selectOptionRoomCode");
	}
	
	public HostVO selectRoomInOut(int room_code) {
		return sqlsession.selectOne("Host.selectRoomInOut", room_code);
	}
}
