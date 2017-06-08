package com.hongmeng.ncjw.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hongmeng.ncjw.common.ReturnStatus;
import com.hongmeng.ncjw.entity.ArticleEntity;
import com.hongmeng.ncjw.entity.Output;
import com.hongmeng.ncjw.entity.OutputList;
import com.hongmeng.ncjw.service.ArticleService;
import com.hongmeng.ncjw.service.LuceneService;
import com.hongmeng.ncjw.service.UeditorService;

@RestController
@RequestMapping("article")
public class ArticleController {

	static Logger log = LoggerFactory.getLogger(ArticleController.class);

	@Autowired
	LuceneService luceneService;

	@Autowired
	ArticleService articleService;

	@Autowired
	UeditorService ueditorService;

	@Value("${customize.path.upload}")
	private String filePath;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam("type") Integer type, @RequestParam("title") String title,
			@RequestParam("source") String source, @RequestParam("content") String content,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage,
			@RequestParam(name = "topicId", required = false) Long topicId) {
		try {
			String imagePath = "";
			if (uploadImage != null && !uploadImage.isEmpty()) {
				imagePath = ueditorService.saveImage(uploadImage);
			}

			String linkPath = ueditorService.save(content);
			Date now = new Date();
			ArticleEntity article = new ArticleEntity(type, title, source, linkPath, imagePath, topicId, now, now);
			articleService.save(article);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam("articleId") Long articleId, @RequestParam("type") Integer type,
			@RequestParam("title") String title, @RequestParam("source") String source,
			@RequestParam("content") String content,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage,
			@RequestParam(name = "topicId", required = false) Long topicId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);

			String imagePath = article.getImagePath();
			if (uploadImage != null && !uploadImage.isEmpty()) {
				imagePath = ueditorService.saveImage(uploadImage);
			}

			String linkPath = ueditorService.update(article.getLinkPath(), content);
			articleService.update(article, type, title, source, linkPath, imagePath, topicId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam Long articleId) {
		try {
			articleService.delete(articleId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/top", method = RequestMethod.POST)
	public Output top(@RequestParam Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			article.setUpdateTime(new Date());
			articleService.save(article);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);

			File file = new File(filePath + File.separator + article.getLinkPath());
			String content = FileUtils.readFileToString(file, "UTF-8");

			article.setContent(content);
			return new Output(article, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByType", method = RequestMethod.POST)
	public OutputList listByType(Integer type) {

		try {
			List<ArticleEntity> list = articleService.listByType(type);

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByTypePaging", method = RequestMethod.POST)
	public OutputList listByTypePaging(Integer type, int page, int size) {
		try {
			List<ArticleEntity> list = articleService.listByTypePaging(type, page, size);
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByCount", method = RequestMethod.POST)
	public OutputList listByCount() {
		try {
			List<?> list = articleService.listByCount();
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public Output search(String keywords, Integer page, Integer size) {
		try {
			List<ArticleEntity> list = articleService.list();
			for (ArticleEntity article : list) {
				luceneService.updateIndex("id", String.valueOf(article.getId()), article);
			}
			// title content textfield 现在使用的分词器是单字分词..
			Map<String, Object> map = null;
			try {
				map = luceneService.search(keywords, (page - 1) * size, page * size);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return new Output(map, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}