package com.hongmeng.ncjw.repository;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.ncjw.entity.UserEntity;

public interface UserRepository extends CrudRepository<UserEntity, Long> {
	
	UserEntity findByUsername(String username);

}
