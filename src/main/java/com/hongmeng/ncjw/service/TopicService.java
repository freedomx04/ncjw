package com.hongmeng.ncjw.service;

import java.util.List;

import com.hongmeng.ncjw.entity.TopicEntity;

public interface TopicService {
	
	TopicEntity findOne(Long topicId);
	
	void save(TopicEntity topic);
	
	void update(TopicEntity topic, String title);
	
	void delete(List<Long> topicIds);
	
	void delete(Long topicId);
	
	List<TopicEntity> list();
	
	List<TopicEntity> listPaging(int page, int size);

}
