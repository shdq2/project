package com.kte.project.VO;

public class paymentVO {
	private String payment_date = null;
	private String payment_card = null;
	private String payment_name = null;
	private int reservation_code = 0;
	private int payment_card_type= 0;
	private int payment_type=0;
	private int payment_money = 0;
	private int payment_monthly=0;
	
	
	public int getPayment_money() {
		return payment_money;
	}
	public void setPayment_money(int payment_money) {
		this.payment_money = payment_money;
	}
	public int getPayment_monthly() {
		return payment_monthly;
	}
	public void setPayment_monthly(int payment_monthly) {
		this.payment_monthly = payment_monthly;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_card() {
		return payment_card;
	}
	public void setPayment_card(String payment_card) {
		this.payment_card = payment_card;
	}
	public String getPayment_name() {
		return payment_name;
	}
	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}
	public int getReservation_code() {
		return reservation_code;
	}
	public void setReservation_code(int reservation_code) {
		this.reservation_code = reservation_code;
	}

	public int getPayment_card_type() {
		return payment_card_type;
	}
	public void setPayment_card_type(int payment_card_type) {
		this.payment_card_type = payment_card_type;
	}
	public int getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}
}
