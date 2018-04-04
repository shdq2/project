package com.kte.project.VO;

public class ReservationVO {
	/*
	 * ���� vo
	 * */
	private int reservation_code = 0;		//���� ���̺� �⺻Ű
	private String reservation_date = null;	//��������
	/*
	 * ���� vo
	 * */
	/*
	 * ������� vo
	 * */
	private int reser_code = 0;				//������� �⺻Ű
	private String reser_title = null;		//������� ��(ex) ���� ���, ����Ϸ�, ������, �����Ϸ�, ��� ���)
	private String reser_date=null;			
	/*
	 * ������� vo
	 * */
	
	private String reservation_start = null;
	private String reservation_end = null;
	
	private int reser_day = 0;
	private String room_name = null;
	
	private int page=0;
	private String custom_id=null;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getReservation_start() {
		return reservation_start;
	}
	public void setReservation_start(String reservation_start) {
		this.reservation_start = reservation_start;
	}
	public String getReservation_end() {
		return reservation_end;
	}
	public void setReservation_end(String reservation_end) {
		this.reservation_end = reservation_end;
	}
	public int getReser_day() {
		return reser_day;
	}
	public void setReser_day(int reser_day) {
		this.reser_day = reser_day;
	}
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
