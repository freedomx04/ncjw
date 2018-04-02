package com.hongmeng.ncjw.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {
	
	/**
	 * 用户状态 0：无效 1：有效
	 */
	public class UserStatus {
		public static final int STATUS_NO_VALID = 0;	
		public static final int STATUS_VALID = 1;
	}
	
	@Column(unique = true)
	private String username; // 用户名
	
	private String password; // MD5加密后的密码
	
	private Integer status = UserStatus.STATUS_VALID; // 用户状态
	
	public UserEntity() {
		// TODO Auto-generated constructor stub
	}

	public UserEntity(String username, String password, Date createTime) {
		super();
		this.username = username;
		this.password = password;
		this.createTime = createTime;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}