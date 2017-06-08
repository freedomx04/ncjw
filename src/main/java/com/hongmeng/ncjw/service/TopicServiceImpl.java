package com.hongmeng.ncjw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.ncjw.entity.TopicEntity;
import com.hongmeng.ncjw.repository.TopicRepository;

@Service
public class TopicServiceImpl implements TopicService {
	
	@Autowired
	TopicRepository topicRepository;

	@Override
	public TopicEntity findOne(Long topicId) {
		return topicRepository.findOne(topicId);
	}

	@Override
	public void save(TopicEntity topic) {
		topicRepository.save(topic);
	}

	@Override
	public void update(TopicEntity topic, String title) {
		topic.setTitle(title);
		topicRepository.save(topic);
	}

	@Override
	public void delete(List<Long> topicIds) {
		Iterable<TopicEntity> it = topicRepository.findByIdIn(topicIds);
		topicRepository.delete(it);
	}
	
	@Override
	public void delete(Long topicId) {
		topicRepository.delete(topicId);
	}

	@Override
	public List<TopicEntity> list() {
		return (List<TopicEntity>) topicRepository.findAllByOrderByUpdateTimeDesc();
	}

	@Override
	public List<TopicEntity> listPaging(int page, int size) {
		Page<TopicEntity> topicPage = topicRepository.findAllByOrderByUpdateTimeDesc(new PageRequest(page, size));
		return topicPage.getContent();
	}

}