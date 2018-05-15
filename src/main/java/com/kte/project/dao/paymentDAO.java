package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.paymentVO;

@Service
public class paymentDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public int payment(paymentVO vo) {
		return sql.insert("payment.payment",vo);
	}
	
	public paymentVO select_payment(int code) {
		return sql.selectOne("payment.select_payment",code);
	}
}	
