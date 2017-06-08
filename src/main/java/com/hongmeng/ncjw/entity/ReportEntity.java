package com.hongmeng.ncjw.entity;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

@Entity
@Table(name = "report", indexes = { 
	@Index(name = "INDEX_REPORT_SEARCHCODE", columnList = "searchCode"),
	@Index(name = "INDEX_REPORT_CREATETIME", columnList = "createTime")
})
public class ReportEntity extends BaseEntity {

	// 举报人信息
	private String name;

	private String identityCard;

	private String telephone;

	private String address;

	/**
	 *  0:	中国共产党党员	 1: 中共预备党员	2:	共青团员
	 *  3:	民主党派人士	 4:	无党派民主人士	5:	群众
	 */
	private Integer political = 5;

	/**
	 * 	0: 正省部级	1: 副省部级	2: 正厅局级
	 *  3: 中管正厅局级	4: 副厅局级	5: 正县处级
	 *  6: 副县处级	7: 正乡科级	8: 副乡科级
	 *  9: 一般干部	10: 军队		11: 金融机构
	 *  12: 一般企业	13: 事业		14: 农村
	 *  15: 其他
	 */
	private Integer level = 15;

	// 被举报人
	private String respondentName;

	private String respondentUnit;

	private String respondentPosition;

	private String respondentArea;

	private Integer respondentLevel;

	// 举报信息
	private String title;

	private Integer type;

	private Integer subType;

	private String content;

	private String fileName;

	private String filePath;

	// 答复内容
	private String searchCode;

	private String reply = "";
	
	public ReportEntity() {
		// TODO Auto-generated constructor stub
	}

	public ReportEntity(String name, String identityCard, String telephone, String address, Integer political,
			Integer level, String respondentName, String respondentUnit, String respondentPosition,
			String respondentArea, Integer respondentLevel, String title, Integer type, Integer subType,
			String content) {
		this.name = name;
		this.identityCard = identityCard;
		this.telephone = telephone;
		this.address = address;
		this.political = political;
		this.level = level;
		this.respondentName = respondentName;
		this.respondentUnit = respondentUnit;
		this.respondentPosition = respondentPosition;
		this.respondentArea = respondentArea;
		this.respondentLevel = respondentLevel;
		this.title = title;
		this.type = type;
		this.subType = subType;
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPolitical() {
		return political;
	}

	public void setPolitical(Integer political) {
		this.political = political;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getRespondentName() {
		return respondentName;
	}

	public void setRespondentName(String respondentName) {
		this.respondentName = respondentName;
	}

	public String getRespondentUnit() {
		return respondentUnit;
	}

	public void setRespondentUnit(String respondentUnit) {
		this.respondentUnit = respondentUnit;
	}

	public String getRespondentPosition() {
		return respondentPosition;
	}

	public void setRespondentPosition(String respondentPosition) {
		this.respondentPosition = respondentPosition;
	}

	public String getRespondentArea() {
		return respondentArea;
	}

	public void setRespondentArea(String respondentArea) {
		this.respondentArea = respondentArea;
	}

	public Integer getRespondentLevel() {
		return respondentLevel;
	}

	public void setRespondentLevel(Integer respondentLevel) {
		this.respondentLevel = respondentLevel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getSubType() {
		return subType;
	}

	public void setSubType(Integer subType) {
		this.subType = subType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSearchCode() {
		return searchCode;
	}

	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}