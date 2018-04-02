package com.hongmeng.ncjw.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.ncjw.entity.TopicEntity;

public interface TopicRepository extends PagingAndSortingRepository<TopicEntity, Long> {
	
	Iterable<TopicEntity> findByIdIn(List<Long> topicIds);
	
	List<TopicEntity> findAllByOrderByUpdateTimeDesc();
	
	Page<TopicEntity> findAllByOrderByUpdateTimeDesc(Pageable pageable);

}
