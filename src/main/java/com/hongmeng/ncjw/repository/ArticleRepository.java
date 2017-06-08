package com.hongmeng.ncjw.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.ncjw.entity.ArticleEntity;

public interface ArticleRepository extends PagingAndSortingRepository<ArticleEntity, Long> {
	
	Iterable<ArticleEntity> findByIdIn(List<Long> articleIds);
	
	List<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type);
	
	Page<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type, Pageable pageable);
	
	@Query(value = "select type, count(*) as count from article GROUP BY type", nativeQuery=true)
	List<?> listByCount();

	List<ArticleEntity> findAllByOrderByCreateTimeDesc();
}
