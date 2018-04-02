package com.hongmeng.ncjw.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hongmeng.ncjw.common.utils.ArticleUtils;
import com.hongmeng.ncjw.common.utils.LuceneUtils;
import com.hongmeng.ncjw.entity.ArticleEntity;

@Service
public class LuceneServiceImp implements LuceneService {

	static Logger logger = LoggerFactory.getLogger(LuceneService.class);

	/**
	 * 增删改索引都是通过indexWriter 对象来完成...
	 * 
	 * @throws IOException
	 *
	 */
	public void addIndex(ArticleEntity article) throws IOException {
		Document doc = ArticleUtils.articleToDocument(article);
		IndexWriter indexWriter = null;
		try {
			IndexWriterConfig config = new IndexWriterConfig(LuceneUtils.getAnalyzer());
			indexWriter = new IndexWriter(LuceneUtils.getDirectory(), config);
			indexWriter.addDocument(doc);
		} catch (Exception e) {
			logger.error("IndexDao.save error", e);
		} finally {
			LuceneUtils.closeIndexWriter(indexWriter);
		}
	}

	/**
	 *
	 * 删除索引，根据字段对应的值进行删除...
	 *
	 * @param fieldName
	 * @param fieldValue
	 * @throws IOException
	 */
	public void delIndex(String fieldName, String fieldValue) throws IOException {
		IndexWriter indexWriter = null;
		try {
			Term term = new Term(fieldName, fieldValue);
			IndexWriterConfig config = new IndexWriterConfig(LuceneUtils.getAnalyzer());
			indexWriter = new IndexWriter(LuceneUtils.getDirectory(), config);
			indexWriter.deleteDocuments(term);// 删除含有指定term的所有文档
		} catch (Exception e) {
			logger.error("IndexDao.save error", e);
		} finally {
			LuceneUtils.closeIndexWriter(indexWriter);
		}
	}

	/**
	 *
	 * 先删除符合条件的记录，再创建一个符合条件的记录....
	 * 
	 * @param fieldName
	 * @param fieldValue
	 * @param article
	 * @throws IOException
	 */
	public void updateIndex(String fieldName, String fieldValue, ArticleEntity article) throws IOException {

		Document doc = ArticleUtils.articleToDocument(article);
		IndexWriter indexWriter = null;
		try {
			Term term = new Term(fieldName, fieldValue);
			IndexWriterConfig config = new IndexWriterConfig(LuceneUtils.getAnalyzer());
			indexWriter = new IndexWriter(LuceneUtils.getDirectory(), config);
			indexWriter.updateDocument(term, doc);// 先删除，后创建。
		} catch (Exception e) {
			logger.error("IndexDao.save error", e);
		} finally {
			LuceneUtils.closeIndexWriter(indexWriter);
		}
	}

	/**
	 *
	 * 显示第一页 的数据 0,10
	 * 
	 * 显示第二页 的数据 10,10
	 * 
	 * 显示第三页 的数据 20,10
	 * 
	 * @param keywords
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> search(String keywords, int start, int rows) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ArticleEntity> list = new ArrayList<ArticleEntity>();
		DirectoryReader ireader = DirectoryReader.open(LuceneUtils.getDirectory());
		// 2、第二步，创建搜索器
		IndexSearcher isearcher = new IndexSearcher(ireader);

		// 3、第三步，类似SQL，进行关键字查询
		String[] fields = { "title", "content", "source" };
		QueryParser parser = new MultiFieldQueryParser(fields, LuceneUtils.getAnalyzer());
		Query query = parser.parse(keywords);

		TopDocs topDocs = isearcher.search(query, start + rows);
		int count = topDocs.totalHits;// 总记录数
		// System.out.println("总记录数为：" + topDocs.totalHits);// 总记录数
		ScoreDoc[] hits = topDocs.scoreDocs;// 第二个参数，指定最多返回前n条结果

		// 处理结果
		int endIndex = Math.min(start + rows, hits.length);
		for (int i = start; i < endIndex; i++) {
			Document hitDoc = isearcher.doc(hits[i].doc);
			ArticleEntity article = ArticleUtils.documentToAriticle(hitDoc);
			list.add(article);
		}
		map.put("list", list);
		map.put("count", count);
		ireader.close();
		return map;

	}
}
