package com.kte.project.VO;

public class CustomVO {
	
	/*
	 * 회원 vo
	 * */
	private String custom_id = null; 	// 고객 id => 고객관련 외래키
   private String custom_name = null;   // 고객 이름
   private String custom_pw = null;		// 고객 비밀번호
   private String custom_bank = null;	// 고객 은행
   private String custom_cash = null;	// 고객 계좌번호
   private String custom_phone = null;	// 고객 전화번호
   private int custom_block = 0;		// 고객 차단 여부
   private String custom_date = null;	// 회원가입 일자
   /*
	 * 회원 vo
	 * */
   
   /*
	 * 찜목록 vo
	 * */
   	private String wish_date=null;		//찜목록 등록 일자
   
   /*
	 * 찜목록 vo
	 * */
   
   	/*
	 * 호스트 vo
	 * */
   	
   	 private String host_date=null;		//호스트 등록 일자
   	
   	/*
	 * 호스트 vo
	 * */
   	/*
 	 * 고객 여행 목록 vo
 	 * */
   	 private int reser_code = 0;		//여행목록 기본키
   	 private String reservation_date = null;	//예약 일자
   	/*
 	 * 고객 여행 목록 vo
 	 * */
   	 
   	 
   public String getCustom_name() {
      return custom_name;
   }
   public String getWish_date() {
	return wish_date;
}
public void setWish_date(String wish_date) {
	this.wish_date = wish_date;
}
public String getHost_date() {
	return host_date;
}
public void setHost_date(String host_date) {
	this.host_date = host_date;
}
public int getReser_code() {
	return reser_code;
}
public void setReser_code(int reser_code) {
	this.reser_code = reser_code;
}
public String getReservation_date() {
	return reservation_date;
}
public void setReservation_date(String reservation_date) {
	this.reservation_date = reservation_date;
}
public void setCustom_name(String custom_name) {
      this.custom_name = custom_name;
   }
   public String getCustom_id() {
      return custom_id;
   }
   public void setCustom_id(String custom_id) {
      this.custom_id = custom_id;
   }
   public String getCustom_pw() {
      return custom_pw;
   }
   public void setCustom_pw(String custom_pw) {
      this.custom_pw = custom_pw;
   }
   public String getCustom_bank() {
      return custom_bank;
   }
   public void setCustom_bank(String custom_bank) {
      this.custom_bank = custom_bank;
   }
   public String getCustom_cash() {
      return custom_cash;
   }
   public void setCustom_cash(String custom_cash) {
      this.custom_cash = custom_cash;
   }
   public String getCustom_phone() {
      return custom_phone;
   }
   public void setCustom_phone(String custom_phone) {
      this.custom_phone = custom_phone;
   }
   public int getCustom_block() {
      return custom_block;
   }
   public void setCustom_block(int custom_block) {
      this.custom_block = custom_block;
   }
   public String getCustom_date() {
      return custom_date;
   }
   public void setCustom_date(String custom_date) {
      this.custom_date = custom_date;
   }
}