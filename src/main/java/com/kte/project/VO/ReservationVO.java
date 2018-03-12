package com.kte.project.VO;

public class ReservationVO {
	/*
	 * 예약 vo
	 * */
	private int reservation_code = 0;		//예약 테이블 기본키
	private String reservation_date = null;	//예약일자
	/*
	 * 예약 vo
	 * */
	/*
	 * 예약상태 vo
	 * */
	private int reser_code = 0;				//여행상태 기본키
	private String reser_title = null;		//여행상태 명(ex) 예약 대기, 예약완료, 결제중, 결제완료, 취소 등등)
	private String reser_date=null;			
	/*
	 * 예약상태 vo
	 * */
	
	public int getReservation_code() {
		return reservation_code;
	}
	public void setReservation_code(int reservation_code) {
		this.reservation_code = reservation_code;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getReser_code() {
		return reser_code;
	}
	public void setReser_code(int reser_code) {
		this.reser_code = reser_code;
	}
	public String getReser_title() {
		return reser_title;
	}
	public void setReser_title(String reser_title) {
		this.reser_title = reser_title;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	

	
	
}	
