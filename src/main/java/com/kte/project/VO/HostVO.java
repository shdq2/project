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
