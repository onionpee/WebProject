package com.beans;

public class UserDTO {

private String user_name;
	
	private String user_id;
	
	private String user_pw;
	
	private String user_ip;
	
	private String user_Num;
	
	private String user_Type;
	
	private String user_mail;
	
	private String user_qa;
	
	private String subject;
	
	private String location;
	
	private String hsname;
	
	private String hsnum;
	
	private int admin;
	
	public UserDTO () {
		super();
	}
	
	public UserDTO (String user_name, String user_id, String user_mail, String user_Num, int admin) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_mail = user_mail;
		this.user_Num = user_Num;
		this.setAdmin(admin);
	}
	
	public UserDTO (String user_name, String user_id, String user_pw, String user_ip, String user_mail, String user_qa, String user_Num) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_ip = user_ip;
		this.user_mail = user_mail;
		this.user_qa = user_qa;
		this.user_Num = user_Num;
	}
	
	public String getUser_name() {
		return user_name;
	}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_pw() {
		return user_pw;
	}
	
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	public String getUser_ip () {
		return user_ip;
	}
	
	public void setUser_ip (String user_ip) {
		this.user_ip = user_ip;
	}
	
	public String getUser_mail() {
		return user_mail;
	}
	
	public void setUser_mail (String user_mail) {
		this.user_mail = user_mail;
	}
	
	public String getUser_qa() {
		return user_qa;
	}
	
	public void setUser_qa(String user_qa) {
		this.user_qa = user_qa;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getHsname() {
		return hsname;
	}
	
	public void setHsname(String hsname) {
		this.hsname = hsname;
	}
	
	public String getHsnum() {
		return hsnum;
	}
	
	public void setHsnum(String hsnum) {
		this.hsnum = hsnum;
	}
	
	public UserDTO(String subject, String location, String hsname, String hsnum) {
		super();
		this.subject = subject;
		this.location = location;
		this.hsname = hsname;
		this.hsnum = hsnum;
	}
	
	public void setUser_Num(String user_Num) {
		this.user_Num = user_Num;
	}
	
	public String getUser_Num() {
		return user_Num;
	}
	
	public String getUserType() {
		return user_Type;
	}
	
	public void setUserType(String user_Type) {
		this.user_Type = user_Type;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}
}
