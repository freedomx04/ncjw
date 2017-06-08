package com.hongmeng.ncjw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.ncjw.entity.UserEntity;
import com.hongmeng.ncjw.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	@Override
	public UserEntity findOne(Long userId) {
		return userRepository.findOne(userId);
	}

	@Override
	public UserEntity findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void save(UserEntity user) {
		userRepository.save(user);
	}

	@Override
	public List<UserEntity> list() {
		return (List<UserEntity>) userRepository.findAll();
	}

}
