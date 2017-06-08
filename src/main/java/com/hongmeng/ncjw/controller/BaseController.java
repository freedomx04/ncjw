package com.hongmeng.ncjw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {

	static Logger log = LoggerFactory.getLogger(BaseController.class);

	@RequestMapping("/login")
	String login() {
		return "login";
	}

	@RequestMapping(value = { "/", "/index" })
	String index() {
		return "index";
	}

	@RequestMapping("/manager")
	String manager() {
		return "manager";
	}

	@RequestMapping("/demo")
	String demo() {
		return "demo";
	}

	@RequestMapping("/demoPage")
	String demoPage(String page) {
		return "demo/" + page;
	}

	@RequestMapping("/column")
	String column() {
		return "column";
	}

	@RequestMapping("/article")
	String article() {
		return "article";
	}

	@RequestMapping("/rpguide")
	String rpguide() {
		return "report_guide";
	}

	@RequestMapping("/website")
	String website() {
		return "website";
	}
	
	@RequestMapping("/report")
	String report() {
		return "report";
	}

}