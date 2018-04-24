package com.kte.project.VO;

public class HostVO {
	
	private int room_code = 0;
	
	//host_name
	private String name_title = null;
	private String name_content = null;
	
	//host_create
	private String create_building_type = null;
	private String create_room_type = null;
	private String create_basic_member = null;
	
	//host_basic
	private int room_number = 0;
	private int room_bed_number = 0;
	private int room_bath_number = 0;
	private String room_type = null;
	private String room_building_type = null;
	private int room_space = 0;
	
	//host_imgs
	private int room_img_code = 0;
	private byte[] room_img = null;
	private String room_img_date = null;
	
	//host_inout
	private String room_in = null;
	private String room_out = null;
	
	
	
	
	
	
	public String getRoom_in() {
		return room_in;
	}
	public void setRoom_in(String room_in) {
		this.room_in = room_in;
	}
	public String getRoom_out() {
		return room_out;
	}
	public void setRoom_out(String room_out) {
		this.room_out = room_out;
	}
	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	public int getRoom_bed_number() {
		return room_bed_number;
	}
	public void setRoom_bed_number(int room_bed_number) {
		this.room_bed_number = room_bed_number;
	}
	public int getRoom_bath_number() {
		return room_bath_number;
	}
	public void setRoom_bath_number(int room_bath_number) {
		this.room_bath_number = room_bath_number;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getRoom_building_type() {
		return room_building_type;
	}
	public void setRoom_building_type(String room_building_type) {
		this.room_building_type = room_building_type;
	}
	public int getRoom_space() {
		return room_space;
	}
	public void setRoom_space(int room_space) {
		this.room_space = room_space;
	}
	public int getRoom_img_code() {
		return room_img_code;
	}
	public void setRoom_img_code(int room_img_code) {
		this.room_img_code = room_img_code;
	}
	public byte[] getRoom_img() {
		return room_img;
	}
	public void setRoom_img(byte[] room_img) {
		this.room_img = room_img;
	}
	public String getRoom_img_date() {
		return room_img_date;
	}
	public void setRoom_img_date(String room_img_date) {
		this.room_img_date = room_img_date;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public String getCreate_building_type() {
		return create_building_type;
	}
	public void setCreate_building_type(String create_building_type) {
		this.create_building_type = create_building_type;
	}
	public String getCreate_room_type() {
		return create_room_type;
	}
	public void setCreate_room_type(String create_room_type) {
		this.create_room_type = create_room_type;
	}
	public String getCreate_basic_member() {
		return create_basic_member;
	}
	public void setCreate_basic_member(String create_basic_member) {
		this.create_basic_member = create_basic_member;
	}
	public String getName_title() {
		return name_title;
	}
	public void setName_title(String name_title) {
		this.name_title = name_title;
	}
	public String getName_content() {
		return name_content;
	}
	public void setName_content(String name_content) {
		this.name_content = name_content;
	}

	
}
