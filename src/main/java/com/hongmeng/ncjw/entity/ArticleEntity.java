package com.hongmeng.ncjw.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

@Entity
@Table(name = "article", indexes = { 
	@Index(name = "INDEX_ARTICLE_UPDATETIME", columnList = "updateTime"),	
	@Index(name = "INDEX_ARTICLE", columnList = "type, updateTime") 
})
public class ArticleEntity extends BaseEntity {

	public class ArticleType {
		public static final int ORGANIZATION_STRUCTURE = 1; // 组织结构
		public static final int PHOTO_NEWS = 2; // 图片新闻
		public static final int INTEGRITY_NEWS = 3; // 南城廉政
		public static final int INFORMATION_PUBLISH = 4; // 信息公开
		public static final int EXPOSURE_STATION = 5; // 曝光台
		public static final int INTEGRITY_EDUCATION = 6; // 廉政教育
		public static final int WORK_DYNAMIC = 7; // 工作动态
		public static final int TOPIC_COLLECTION = 8; // 专题集锦
	}

	private Integer type; // 文章类型

	private String title; // 标题

	private String source; // 来源

	private String linkPath; // 文章地址

	private String content; // 文章内容

	private String imagePath; // 图片地址

	@Column(name = "topic_id")
	private Long topicId; // 专题ID

	public ArticleEntity() {
		// TODO Auto-generated constructor stub
	}

	public ArticleEntity(Integer type, String title, String source, String linkPath, String imagePath, Long topicId,
			Date createTime, Date updateTime) {
		super();
		this.type = type;
		this.title = title;
		this.source = source;
		this.linkPath = linkPath;
		this.imagePath = imagePath;
		this.topicId = topicId;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

}