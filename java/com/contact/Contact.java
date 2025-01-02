package com.contact;

public class Contact {


	private int cid;
	private String name;
	private String username;
	private String subject;
	private String msg;
	
	public Contact(int cid,String name, String username, String subject, String msg) {
		this.cid = cid;
		this.name = name;
		this.username = username;
		this.subject = subject;
		this.msg = msg;
	}

	public int getcid() {
		return cid;
	}
	
	public String getname() {
		return name;
	}

	public String getusername() {
		return username;
	}

	public String getsubject() {
		return subject;
	}
	
	public String getmsg() {
		return msg;
	}

}

