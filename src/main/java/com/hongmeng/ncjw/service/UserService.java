package com.hongmeng.ncjw.service;

import java.util.List;

import com.hongmeng.ncjw.entity.UserEntity;

public interface UserService {

	UserEntity findOne(Long userId);
	
	UserEntity findByUsername(String username);
	
	void save(UserEntity user);
	
	List<UserEntity> list();
	
}
