package com.hongmeng.ncjw.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hongmeng.ncjw.entity.ArticleEntity;

public interface ArticleService {

	ArticleEntity findOne(Long articleId);

	void save(ArticleEntity article);

	void update(ArticleEntity article, Integer type, String title, String source, String linkPath, String imagePath,
			Long topicId);

	void delete(List<Long> articleIds);

	void delete(Long articleId);

	List<ArticleEntity> listByType(Integer type);

	List<ArticleEntity> listByTypePaging(Integer type, int page, int size);
	
	List<?> listByCount();
	
	List<ArticleEntity> list();
	
	// m
	Page<ArticleEntity> listPaging(Integer type, int page, int size);

}
