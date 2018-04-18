package com.hongmeng.ncjw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.ncjw.entity.ArticleEntity;
import com.hongmeng.ncjw.entity.TopicEntity;
import com.hongmeng.ncjw.service.ArticleService;
import com.hongmeng.ncjw.service.TopicService;

@Controller
public class BaseController {

	static Logger log = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	TopicService topicService;

	@RequestMapping("/login")
	String login() {
		return "login";
	}

	@RequestMapping(value = { "/", "/index" })
	String index() {
		return "index";
	}
	
	@RequestMapping(value = "/m")
	String m(ModelMap modelMap) {
		Page<ArticleEntity> list = null;
		
		// 图片新闻
		list = articleService.listPaging(2, 0, 5);
		modelMap.addAttribute("photonewsList", list.getContent());
		
		// 南城廉政
		list = articleService.listPaging(3, 0, 6);
		modelMap.addAttribute("integritynewsList", list.getContent());
		
		// 曝光台
		list = articleService.listPaging(5, 0, 6);
		modelMap.addAttribute("exposureList", list.getContent());
		
		// 组织结构
		list = articleService.listPaging(1, 0, 6);
		modelMap.addAttribute("organizationList", list.getContent());	
		
		// 专题集锦
		List<TopicEntity> topicList = topicService.listPaging(0, 6);
		modelMap.addAttribute("topicList", topicList);
		
		// 信息公开
		list = articleService.listPaging(4, 0, 6);
		modelMap.addAttribute("publishList", list.getContent());
		
		// 工作动态
		list = articleService.listPaging(7, 0, 6);
		modelMap.addAttribute("workDynamicList", list.getContent());
		
		// 廉政教育
		list = articleService.listPaging(6, 0, 6);
		modelMap.addAttribute("educationList", list.getContent());
		
		return "m/index";
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