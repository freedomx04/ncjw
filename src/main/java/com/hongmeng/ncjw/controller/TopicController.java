package com.hongmeng.ncjw.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.ncjw.common.ReturnStatus;
import com.hongmeng.ncjw.entity.Output;
import com.hongmeng.ncjw.entity.OutputList;
import com.hongmeng.ncjw.entity.TopicEntity;
import com.hongmeng.ncjw.service.TopicService;

@RestController
@RequestMapping("topic")
public class TopicController {
	
	static Logger log = LoggerFactory.getLogger(TopicController.class);
	
	@Autowired
	TopicService topicService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String title) {
		try {
			Date now = new Date();
			TopicEntity topic = new TopicEntity(title, now, now);
			topic.setCreateTime(new Date());
			topicService.save(topic);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long topicId, @RequestParam String title) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			topicService.update(topic, title);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam Long topicId) {
		try {
			topicService.delete(topicId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/top", method = RequestMethod.POST)
	public Output top(@RequestParam Long topicId) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			topic.setUpdateTime(new Date());
			topicService.save(topic);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long topicId) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			return new Output(topic, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(topicService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(topicService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}