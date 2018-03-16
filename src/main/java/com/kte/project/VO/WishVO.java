package com.kte.project.VO;

import java.util.List;

public class WishVO {
	private int wish_code = 0;
	private String wish_name = null;
	private int wish_number = 0;
	private String wish_phone = null;
	private String wish_start = null;
	private String wish_end = null;
	private String wish_msg = null;
	private String wish_region = null;
	private String wish_price = null;
	private String wish_date = null;
	private String wish_email = null;
	private int wish_chk = 0;
	private List<WishchkVO> list = null;
	
	
	
	
	public int getWish_chk() {
		return wish_chk;
	}
	public void setWish_chk(int wish_chk) {
		this.wish_chk = wish_chk;
	}
	public List<WishchkVO> getList() {
		return list;
	}
	public void setList(List<WishchkVO> list) {
		this.list = list;
	}
	public String getWish_email() {
		return wish_email;
	}
	public void setWish_email(String wish_email) {
		this.wish_email = wish_email;
	}
	public int getWish_number() {
		return wish_number;
	}
	public void setWish_number(int wish_number) {
		this.wish_number = wish_number;
	}
	public int getWish_code() {
		return wish_code;
	}
	public void setWish_code(int wish_code) {
		this.wish_code = wish_code;
	}
	public String getWish_name() {
		return wish_name;
	}
	public void setWish_name(String wish_name) {
		this.wish_name = wish_name;
	}
	public String getWish_phone() {
		return wish_phone;
	}
	public void setWish_phone(String wish_phone) {
		this.wish_phone = wish_phone;
	}
	public String getWish_start() {
		return wish_start;
	}
	public void setWish_start(String wish_start) {
		this.wish_start = wish_start;
	}
	public String getWish_end() {
		return wish_end;
	}
	public void setWish_end(String wish_end) {
		this.wish_end = wish_end;
	}
	public String getWish_msg() {
		return wish_msg;
	}
	public void setWish_msg(String wish_msg) {
		this.wish_msg = wish_msg;
	}
	public String getWish_region() {
		return wish_region;
	}
	public void setWish_region(String wish_region) {
		this.wish_region = wish_region;
	}
	public String getWish_price() {
		return wish_price;
	}
	public void setWish_price(String wish_price) {
		this.wish_price = wish_price;
	}
	public String getWish_date() {
		return wish_date;
	}
	public void setWish_date(String wish_date) {
		this.wish_date = wish_date;
	}
	
	
}
