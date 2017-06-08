package com.hongmeng.ncjw.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.ncjw.common.ReturnStatus;
import com.hongmeng.ncjw.common.utils.CiphersUtils;
import com.hongmeng.ncjw.common.utils.CurrentUserUtils;
import com.hongmeng.ncjw.entity.Output;
import com.hongmeng.ncjw.entity.OutputList;
import com.hongmeng.ncjw.entity.UserEntity;
import com.hongmeng.ncjw.entity.UserEntity.UserStatus;
import com.hongmeng.ncjw.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {

	static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Output login(@RequestParam String username, @RequestParam String password,
			@RequestParam(required = false) String deviceToken) {
		try {
			UserEntity user = userService.findByUsername(username);

			if (user == null) { // 用户不存在
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}
			
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) { // 用户被禁用
				return new Output(null, ReturnStatus.USER_STATUS_NO_VALID.status(), ReturnStatus.USER_STATUS_NO_VALID.msg());
			}
			
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(password), user.getPassword())) { // 密码错误
				return new Output(null, ReturnStatus.USER_PWD_ERROR.status(), ReturnStatus.USER_PWD_ERROR.msg());
			}

			CurrentUserUtils.getInstance().serUser(user);
			return new Output(user, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public Output logout(@RequestParam Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			if (user == null) {
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}
			
			CurrentUserUtils.getInstance().removeUser();
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String username, @RequestParam String password) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user != null) {
				return new Output(null, ReturnStatus.USER_EXISTED.status(), ReturnStatus.USER_EXISTED.msg());
			}

			user = new UserEntity(username, CiphersUtils.getInstance().MD5Password(password), new Date());
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.USER_REGISTER_SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			List<UserEntity> list = userService.list();
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/loginStatus", method = RequestMethod.POST)
	public Boolean loginStatus() {
		try {
			Object obj = request.getSession().getAttribute("cur_user");
			if (obj == null || !(obj instanceof UserEntity)) {
				return false;
			}
			return true;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return false;
		}
	}
	
	@RequestMapping(value = "/status", method = RequestMethod.POST)
	public Output status(@RequestParam Long userId, @RequestParam Integer status) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setStatus(status);
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}