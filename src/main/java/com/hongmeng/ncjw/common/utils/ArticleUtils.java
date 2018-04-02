package com.hongmeng.ncjw.common.utils;

import java.text.SimpleDateFormat;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;

import com.hongmeng.ncjw.entity.ArticleEntity;

public class ArticleUtils {
	
    /**
     * 将article 转换成document
     * @param article
     * @return
     */
    public static Document articleToDocument(ArticleEntity article) {
        Document document = new Document();
        document.add(new StringField("id", String.valueOf(article.getId()), Field.Store.YES));
        document.add(new TextField("title", article.getTitle(), Field.Store.YES));
        document.add(new TextField("type", String.valueOf(article.getType()), Field.Store.YES));
        document.add(new TextField("source", article.getSource(), Field.Store.NO));
        document.add(new TextField("createTime", Long.toString(article.getCreateTime().getTime()), Field.Store.YES));
        return document;
        
    }
    
    public static ArticleEntity documentToAriticle(Document doc) {  
    	SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ArticleEntity article = new ArticleEntity();  
        article.setId(Integer.parseInt(doc.get("id"))); 
        article.setType(Integer.parseInt(doc.get("type"))); 
        article.setTitle(doc.get("title"));  
        try {
			article.setCreateTime(format.parse(format.format(Long.parseLong(doc.get("createTime")))));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return article;  
    }  
    
}
