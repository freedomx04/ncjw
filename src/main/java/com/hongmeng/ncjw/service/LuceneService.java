package com.hongmeng.ncjw.service;

import java.io.IOException;
import java.util.Map;

import com.hongmeng.ncjw.entity.ArticleEntity;

public interface LuceneService {
	
	void addIndex(ArticleEntity article) throws IOException;
	
    void delIndex(String fieldName,String fieldValue) throws IOException;
    
    void updateIndex(String fieldName, String fieldValue, ArticleEntity article) throws IOException;
    
    Map<String, Object> search(String keywords,int start,int rows) throws Exception;
}
