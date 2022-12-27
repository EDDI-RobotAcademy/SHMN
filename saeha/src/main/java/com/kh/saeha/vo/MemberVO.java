package com.kh.saeha.vo;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userName;
	private String userBirth;
	private String userTel;
	private String userMail;
	private String userAddress;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userBirth="
				+ userBirth + ", userTel=" + userTel + ", userMail=" + userMail + ", userAddress=" + userAddress + "]";
	}
	
	
	
	
	
	
}
