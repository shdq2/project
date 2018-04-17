package com.kte.project.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.HostVO;




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
	
	public int selectRoomImgCode() {
		return sqlsession.selectOne("Host.selectLastRoomImgcode");
	}
	
	public int insertHostImg(HostVO vo) {
		return sqlsession.insert("Host.insertHostImg", vo);
	}
	
}
