package com.hongmeng.ncjw.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.ncjw.entity.ArticleEntity;
import com.hongmeng.ncjw.repository.ArticleRepository;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleRepository articleRepository;

	@Override
	public ArticleEntity findOne(Long articleId) {
		return articleRepository.findOne(articleId);
	}

	@Override
	public void save(ArticleEntity article) {
		articleRepository.save(article);
	}

	@Override
	public void update(ArticleEntity article, Integer type, String title, String source, String linkPath,
			String imagePath, Long topicId) {
		article.setType(type);
		article.setTitle(title);
		article.setSource(source);
		article.setLinkPath(linkPath);
		article.setImagePath(imagePath);
		article.setTopicId(topicId);
		article.setUpdateTime(new Date());
		articleRepository.save(article);
	}

	@Override
	public void delete(List<Long> articleIds) {
		Iterable<ArticleEntity> it = articleRepository.findByIdIn(articleIds);
		articleRepository.delete(it);
	}

	@Override
	public void delete(Long articleId) {
		articleRepository.delete(articleId);
	}

	@Override
	public List<ArticleEntity> listByType(Integer type) {
		return articleRepository.findByTypeOrderByUpdateTimeDesc(type);
	}

	@Override
	public List<ArticleEntity> listByTypePaging(Integer type, int page, int size) {
		Page<ArticleEntity> articlePage = articleRepository.findByTypeOrderByUpdateTimeDesc(type,
				new PageRequest(page, size));
		return articlePage.getContent();
	}

	@Override
	public List<?> listByCount() {
		return articleRepository.listByCount();
	}

	@Override
	public List<ArticleEntity> list() {
		return (List<ArticleEntity>) articleRepository.findAllByOrderByCreateTimeDesc();
	}

}