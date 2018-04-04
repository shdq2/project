package com.kte.project.VO;

public class boundVO {
	private double ne_lat = 0;
	private double ne_lng = 0;
	private double sw_lat = 0;
	private double sw_lng = 0;
	private int min_price = 0;
	private int max_price = 9999999;
	private int order = 0;
	private int page = 0;
	private String day_type = null;
	private String active_tab = null;
	
	public double getNe_lat() {
		return ne_lat;
	}
	public void setNe_lat(double ne_lat) {
		this.ne_lat = ne_lat;
	}
	public double getNe_lng() {
		return ne_lng;
	}
	public void setNe_lng(double ne_lng) {
		this.ne_lng = ne_lng;
	}
	public double getSw_lat() {
		return sw_lat;
	}
	public void setSw_lat(double sw_lat) {
		this.sw_lat = sw_lat;
	}
	public double getSw_lng() {
		return sw_lng;
	}
	public void setSw_lng(double sw_lng) {
		this.sw_lng = sw_lng;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getMin_price() {
		return min_price;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	public int getMax_price() {
		return max_price;
	}
	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getDay_type() {
		return day_type;
	}
	public void setDay_type(String day_type) {
		this.day_type = day_type;
	}
	public String getActive_tab() {
		return active_tab;
	}
	public void setActive_tab(String active_tab) {
		this.active_tab = active_tab;
	}
}
