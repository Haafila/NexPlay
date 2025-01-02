package com.user;

public class User {
	private int userid;
	private String name;
	private String email;
	private String favGenre;
	private String bio;
	private String dob;
	private String username;
	private String password;
	private String createdAt;
	private int activeStatus;

	public User(int userid, String name, String email, String favGenre, String bio, String dob, String username, String password, String createdAt, int activeStatus) {
	
		this.userid = userid;
		this.name = name;
		this.email = email;
		this.favGenre = favGenre;
		this.bio = bio;
		this.dob = dob;
		this.username = username;
		this.password = password;
		this.createdAt = createdAt;
		this.activeStatus = activeStatus;
	}
	

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFavGenre() {
		return favGenre;
	}
	public void setFavGenre(String favGenre) {
		this.favGenre = favGenre;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public int getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(int activeStatus) {
		this.activeStatus = activeStatus;
	}
	
}
