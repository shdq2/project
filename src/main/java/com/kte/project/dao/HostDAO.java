package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.HostConfirmVO;
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
	
	public HostVO selectRoomName(int room_code) {
		return sqlsession.selectOne("Host.selectRoomName", room_code);
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
	
	public int updateHostPrice_Bank(HostVO vo) {
		return sqlsession.update("Host.updateHostPrice_Bank", vo);
	}
	
	public int updateHostPrice_Weekend(HostVO vo) {
		return sqlsession.update("Host.updateHostPrice_Weekend", vo);
	}
	
	public List<HostVO> selectRoomList (HostVO vo) {
		return sqlsession.selectList("Host.selectRoomList", vo);
	}
	public int selectLastListImgCode(int room_code) {
		return sqlsession.selectOne("Host.selectLastListImgCode", room_code);
	}
	public int host_list_del1(int room_code) {
		return sqlsession.delete("Host.host_list_del1", room_code);
	}
	public int host_list_del2(int room_code) {
		return sqlsession.delete("Host.host_list_del2", room_code);
	}
	public int host_list_del3(int room_code) {
		return sqlsession.delete("Host.host_list_del3", room_code);
	}
	public int host_list_del4(int room_code) {
		return sqlsession.delete("Host.host_list_del4", room_code);
	}
	public int host_list_del5(int room_code) {
		return sqlsession.delete("Host.host_list_del5", room_code);
	}
	public int host_list_del6(int room_code) {
		return sqlsession.delete("Host.host_list_del6", room_code);
	}
	public int host_list_del7(int room_code) {
		return sqlsession.delete("Host.host_list_del7", room_code);
	}
	public int host_list_del8(int room_code) {
		return sqlsession.delete("Host.host_list_del8", room_code);
	}
	
	public int insertRoomSetConfirm(int room_code) {
		return sqlsession.insert("Host.insertRoomSetConfirm", room_code);
	}
	public int updateRoomSetConfirm1(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm1", room_code);
	}
	public int updateRoomSetConfirm2(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm2", room_code);
	}
	public int updateRoomSetConfirm3(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm3", room_code);
	}
	public int updateRoomSetConfirm4(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm4", room_code);
	}
	public int updateRoomSetConfirm5(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm5", room_code);
	}
	public int updateRoomSetConfirm6(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm6", room_code);
	}
	public int updateRoomSetConfirm7(int room_code) {
		return sqlsession.update("Host.updateRoomSetConfirm7", room_code);
	}
	public HostConfirmVO selectRoomSetConfirm(int room_code) {
		return sqlsession.selectOne("Host.selectRoomSetConfirm", room_code);
	}
	public int updateRoomAddr(HostVO vo) {
		return sqlsession.update("Host.updateRoomAddr", vo);
	}
	public HostVO selectRoomAddr(int room_code) {
		return sqlsession.selectOne("Host.selectRoomAddr", room_code);
	}
	
	public int updateHostBlock(int room_code) {
		return sqlsession.update("Host.updateHostBlock", room_code);
	}
	
	public int selectRoomBlock(int room_code) {
		return sqlsession.selectOne("Host.selectRoomBlock", room_code);
	}
	
	public List<HostVO> selectBankList() {
		return sqlsession.selectList("Host.selectBankList");
	}
	
}
