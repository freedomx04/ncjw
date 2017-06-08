package com.hongmeng.ncjw.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hongmeng.ncjw.common.PathFormat;
import com.hongmeng.ncjw.common.ReturnStatus;
import com.hongmeng.ncjw.common.utils.ConfigUtils;
import com.hongmeng.ncjw.common.utils.FileUtils;
import com.hongmeng.ncjw.entity.Output;

@RestController
@RequestMapping("common")
public class CommonController {

	static Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public Output uploadImage(@RequestParam("uploadImage") MultipartFile uploadImage) {
		try {
			String imageName = uploadImage.getOriginalFilename();
			String savePath = ConfigUtils.get("customize.path.upload.image");
			String suffix = FileUtils.getSuffixByFilename(imageName);
			
			savePath = savePath + suffix;
			savePath = PathFormat.parse(savePath, "");
			
			String projectPath = ConfigUtils.get("customize.path.upload");
			
			Path relPath = Paths.get(projectPath, savePath);
			File file = relPath.toFile();
			FileUtils.sureDirExists(file, true);
			
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(uploadImage.getBytes());
			stream.close();
			
			return new Output(savePath, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}