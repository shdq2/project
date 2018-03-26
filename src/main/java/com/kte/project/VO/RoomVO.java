package com.kte.project.VO;

public class RoomVO {
	/*
	 * �� �̹��� vo
	 * */
	private String room_code = null; // ���� ��� ��ȣ => ���� ���� vo ����
	// �� �̹���
	private byte[] room_img1=null;
	private byte[] room_img2=null;
	private byte[] room_img3=null;
	private byte[] room_img4=null;
	private byte[] room_img5=null;
	// �� �̹���
	private String room_img_date =null; // �̹��� ��� ��¥
	/*
	 * �� �̹��� vo
	 * */
	
	/*
	 * �� �ɼ� vo
	 * */
	private String ro_option = null;	// ���� �⺻ �ɼ�
	private String ro_option2 = null;	// ���� �߰��ɼ�
	private String ro_security = null;	// ���� ���Ȼ���
	private String ro_date = null;		// �ɼ� ��� ����
	
	/*
	 * �� �ɼ� vo
	 * */
	
	/*
	 * �� vo
	 * */
	private String room_name = null;	//���� �̸�
	private String room_content = null;	//���� ����
	private String room_price = null;	//���� ���� (1�ڱ���)
	private String room_date = null;	//���� ��� ����
	private String room_block= null;	//���Ҹ� ����Ʈ�� �߰����� ���� ����
	private String room_addr = null;	//���� �ּ�
	/*
	 * �� vo
	 * */
	
	/*
	 * ���� vo
	 * */
	private String region_name = null;	//���Ұ� ��ϵ� ���� �̸�
	private int region_no = 0;			//���� ��ȣ
	
	
	/*
	 * ���� vo
	 * */
	
	private int page = 0;
	private String custom_id = null;
	
	
	
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
	public byte[] getRoom_img1() {
		return room_img1;
	}
	public void setRoom_img1(byte[] room_img1) {
		this.room_img1 = room_img1;
	}
	public byte[] getRoom_img2() {
		return room_img2;
	}
	public void setRoom_img2(byte[] room_img2) {
		this.room_img2 = room_img2;
	}
	public byte[] getRoom_img3() {
		return room_img3;
	}
	public void setRoom_img3(byte[] room_img3) {
		this.room_img3 = room_img3;
	}
	public byte[] getRoom_img4() {
		return room_img4;
	}
	public void setRoom_img4(byte[] room_img4) {
		this.room_img4 = room_img4;
	}
	public byte[] getRoom_img5() {
		return room_img5;
	}
	public void setRoom_img5(byte[] room_img5) {
		this.room_img5 = room_img5;
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
	public String getRoom_block() {
		return room_block;
	}
	public void setRoom_block(String room_block) {
		this.room_block = room_block;
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

	
	
}
