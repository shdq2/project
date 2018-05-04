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
	
	public void insertHostCreate(HostVO vo) {
		System.out.println(vo.toString());
		sqlsession.selectOne("Host.insertHostCreate",vo);
	}
	
	/*public int insertHostCreate(HostVO vo) {
		return sqlsession.insert("Host.insertHostCreate",vo);
	}*/
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
	
	public HostchkVO selectRoomAmenity(int room_code) {
		return sqlsession.selectOne("Host.selectRoomAmenity", room_code);
	}
	
	public HostVO selectHostPrice(int room_code) {
		return sqlsession.selectOne("Host.selectHostPrice", room_code);
	}
	
	public int updateHostPrice_MinMax(HostVO vo) {
		return sqlsession.update("Host.updateHostPrice_MinMax", vo);
	}
	
	public int updateHostPrice_Basic(HostVO vo) {
		return sqlsession.update("Host.updateHostPrice_Basic", vo);
	}
	
	public int selectLongPricecode() {
		return sqlsession.selectOne("Host.selectLongPricecode");
	}
	
	public int insertLongPrice(HostVO vo) {
		return sqlsession.insert("Host.insertLongPrice", vo);
	}
	public int updateLongPrice(HostVO vo) {
		return sqlsession.update("Host.updateLongPrice", vo);
	}
	
	public List<HostVO> selectLongPrice(int room_code){
		return sqlsession.selectList("Host.selectLongPrice", room_code);
	}
	
	public int deletePriceDel1_1(int price_code) {
		return sqlsession.delete("Host.deletePriceDel1_1", price_code);
	}
	
	public int deletePriceDel1_2(int price_code) {
		return sqlsession.delete("Host.deletePriceDel1_2", price_code);
	}
	
	public int deletePriceDel2(int rt_code) {
		System.out.println(rt_code);
		return sqlsession.delete("Host.deletePriceDel2", rt_code);
	}
	
	public int selectRtCode() {
		return sqlsession.selectOne("Host.selectRtCode");
	}
	
	public int insertRoomTermPlus(HostVO vo) {
		return sqlsession.insert("Host.insertRoomTermPlus", vo);
	}
	
	public List<HostVO> selectRoomTermPlus(int price_code){
		return sqlsession.selectList("Host.selectRoomTermPlus", price_code);
	}
}
