package com.hongmeng.ncjw.entity;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "topic", indexes = { 
	@Index(name = "INDEX_TOPIC", columnList = "updateTime") 
})
public class TopicEntity extends BaseEntity {

	private String title; // 专题标题

	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "topic_id")
	@OrderBy(value = "updateTime desc")
	private List<ArticleEntity> articles = new LinkedList<>(); // 专题文章

	public TopicEntity() {
		// TODO Auto-generated constructor stub
	}

	public TopicEntity(String title, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<ArticleEntity> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticleEntity> articles) {
		this.articles = articles;
	}

}