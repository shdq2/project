package com.kte.project.VO;

public class RoomVO {

   private String room_code = null; // 占쏙옙占쏙옙 占쏙옙占� 占쏙옙호 => 占쏙옙占쏙옙 占쏙옙占쏙옙 vo 占쏙옙占쏙옙
   // 占쏙옙 占싱뱄옙占쏙옙
   private byte[] room_img=null;
   private String room_img_code = null;
   
   private String room_img_date =null; // �̹��� ��� ��¥


   private String ro_option = null;   // 占쏙옙占쏙옙 占썩본 占심쇽옙
   private String ro_option2 = null;   // 占쏙옙占쏙옙 占쌩곤옙占심쇽옙
   private String ro_security = null;   // 占쏙옙占쏙옙 占쏙옙占싫삼옙占쏙옙
   private String ro_date = null;      // 占심쇽옙 占쏙옙占� 占쏙옙占쏙옙

   private String room_name = null;   //占쏙옙占쏙옙 占싱몌옙
   private String room_content = null;   //占쏙옙占쏙옙 占쏙옙占쏙옙
   private String room_price = null;   //占쏙옙占쏙옙 占쏙옙占쏙옙 (1占쌘깍옙占쏙옙)
   private String room_date = null;   //占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
   private int room_block= 0;   //占쏙옙占쌀몌옙 占쏙옙占쏙옙트占쏙옙 占쌩곤옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
   private String room_addr = null;   //占쏙옙占쏙옙 占쌍쇽옙
   private String room_type = null;   //占쏙옙占쏙옙 占쌍쇽옙
   private int room_like = 0;   //占쏙옙占쏙옙 占쌍쇽옙
   private int room_day = 0;
   private int room_month = 0;
   
   private String custom_id = null;
   private String custom_name = null;
   private String map_lat = null;
   private String map_lng = null;

   private String region_name = null;   //���Ұ� ��ϵ� ���� �̸�
   private int region_no = 0;         //���� ��ȣ

   private int page = 0;
   private String txt = null;
   private int state = 0;
   private int room_count = 0;
   private int room_min_day = 0;
   private int room_max_day = 0;
 
public int getRoom_max_day() {
	return room_max_day;
}
public void setRoom_max_day(int room_max_day) {
	this.room_max_day = room_max_day;
}
public int getRoom_min_day() {
	return room_min_day;
}
public void setRoom_min_day(int room_min_day) {
	this.room_min_day = room_min_day;
}
public int getRoom_count() {
	return room_count;
}
public void setRoom_count(int room_count) {
	this.room_count = room_count;
}
public String getTxt() {
	return txt;
}
public void setTxt(String txt) {
	this.txt = txt;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public int getRoom_block() {
	return room_block;
}
public void setRoom_block(int room_block) {
	this.room_block = room_block;
}
public String getCustom_name() {
	return custom_name;
}
public void setCustom_name(String custom_name) {
	this.custom_name = custom_name;
}
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
   public String getRoom_code() {
      return room_code;
   }
   public void setRoom_code(String room_code) {
      this.room_code = room_code;
   }
   
   public byte[] getRoom_img() {
	return room_img;
	}
	public void setRoom_img(byte[] room_img) {
		this.room_img = room_img;
	}
	public String getRoom_img_code() {
		return room_img_code;
	}
	public void setRoom_img_code(String room_img_code) {
		this.room_img_code = room_img_code;
	}
	public String getRoom_img_date() {
      return room_img_date;
   }
   public void setRoom_img_date(String room_img_date) {
      this.room_img_date = room_img_date;
   }
   public String getRo_option() {
      return ro_option;
   }
   public void setRo_option(String ro_option) {
      this.ro_option = ro_option;
   }
   public String getRo_option2() {
      return ro_option2;
   }
   public void setRo_option2(String ro_option2) {
      this.ro_option2 = ro_option2;
   }
   public String getRo_security() {
      return ro_security;
   }
   public void setRo_security(String ro_security) {
      this.ro_security = ro_security;
   }
   public String getRo_date() {
      return ro_date;
   }
   public void setRo_date(String ro_date) {
      this.ro_date = ro_date;
   }
   public String getRoom_name() {
      return room_name;
   }
   public void setRoom_name(String room_name) {
      this.room_name = room_name;
   }
   public String getRoom_content() {
      return room_content;
   }
   public void setRoom_content(String room_content) {
      this.room_content = room_content;
   }
   public String getRoom_price() {
      return room_price;
   }
   public void setRoom_price(String room_price) {
      this.room_price = room_price;
   }
   public String getRoom_date() {
      return room_date;
   }
   public void setRoom_date(String room_date) {
      this.room_date = room_date;
   }
   public String getRoom_addr() {
      return room_addr;
   }
   public void setRoom_addr(String room_addr) {
      this.room_addr = room_addr;
   }
   public String getRegion_name() {
      return region_name;
   }
   public void setRegion_name(String region_name) {
      this.region_name = region_name;
   }
   public int getRegion_no() {
      return region_no;
   }
   public void setRegion_no(int region_no) {
      this.region_no = region_no;
   }

   public String getMap_lat() {
      return map_lat;
   }
   public void setMap_lat(String map_lat) {
      this.map_lat = map_lat;
   }
   public String getMap_lng() {
      return map_lng;
   }
   public void setMap_lng(String map_lng) {
      this.map_lng = map_lng;
   }
   public String getRoom_type() {
      return room_type;
   }
   public void setRoom_type(String room_type) {
      this.room_type = room_type;
   }
   public int getRoom_like() {
      return room_like;
   }
   public void setRoom_like(int room_like) {
      this.room_like = room_like;
   }
   public int getRoom_day() {
      return room_day;
   }
   public void setRoom_day(int room_day) {
      this.room_day = room_day;
   }
   public int getRoom_month() {
      return room_month;
   }
   public void setRoom_month(int room_month) {
      this.room_month = room_month;
   }
}