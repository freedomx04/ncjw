package com.hongmeng.ncjw.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.hongmeng.ncjw.entity.OutputList;
import com.hongmeng.ncjw.entity.ReportEntity;
import com.hongmeng.ncjw.service.ReportService;

@RestController
@RequestMapping("report")
public class ReportController {

	static Logger log = LoggerFactory.getLogger(ReportController.class);

	@Value("${customize.path.upload}")
	private String uploadPath;

	@Autowired
	ReportService reportService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam("name") String name, @RequestParam("identityCard") String identityCard,
			@RequestParam("telephone") String telephone, @RequestParam("address") String address,
			@RequestParam("political") Integer political, @RequestParam("level") Integer level,
			@RequestParam("respondentName") String respondentName,
			@RequestParam("respondentUnit") String respondentUnit,
			@RequestParam("respondentPosition") String respondentPosition,
			@RequestParam("respondentArea") String respondentArea,
			@RequestParam("respondentLevel") Integer respondentLevel, @RequestParam("title") String title,
			@RequestParam("type") Integer type, @RequestParam("subType") Integer subType,
			@RequestParam("content") String content, @RequestParam("uploadFile") MultipartFile uploadFile) {
		try {
			ReportEntity report = new ReportEntity(name, identityCard, telephone, address, political, level,
					respondentName, respondentUnit, respondentPosition, respondentArea, respondentLevel, title, type,
					subType, content);

			// 有上传文件
			if (!uploadFile.isEmpty()) {
				String filename = uploadFile.getOriginalFilename();
				String filePath = ConfigUtils.get("customize.path.upload.image");
				filePath = PathFormat.parse(filePath + FileUtils.getSuffixByFilename(filename), "");

				Path relpath = Paths.get(uploadPath, filePath);
				File file = relpath.toFile();
				FileUtils.sureDirExists(file, true);

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(uploadFile.getBytes());
				stream.close();

				report.setFileName(filename);
				report.setFilePath(filePath);
			}

			// 生产查询号
			String searchCode = createSearchCode();
			report.setSearchCode(searchCode);

			// 保存数据库
			report.setCreateTime(new Date());
			reportService.save(report);
			return new Output(searchCode, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public Output search(@RequestParam String searchCode) {
		try {
			ReportEntity report = reportService.findBySearchCode(searchCode);
			String reply = (report == null) ? "" : report.getReply();
			return new Output(reply, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long reportId) {
		try {
			ReportEntity report = reportService.findOne(reportId);
			return new Output(report, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			List<ReportEntity> list = reportService.list();
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public Output reply(@RequestParam Long reportId, @RequestParam String reply) {
		try {
			ReportEntity report = reportService.findOne(reportId);
			report.setReply(reply);
			report.setUpdateTime(new Date());
			reportService.save(report);
			return new Output(reply, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> downloadFile(@RequestParam Long reportId) {
		try {
			ReportEntity report = reportService.findOne(reportId);
			File file = Paths.get(uploadPath, report.getFilePath()).toFile();
			if (!file.exists()) {
				return null;
			}
			FileSystemResource fsr = new FileSystemResource(file);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
			headers.add("Content-Disposition", String.format("attachment; filename=\"%s\"",
					new String(report.getFileName().getBytes("UTF-8"), "ISO8859-1")));
			headers.add("Pragma", "no-cache");
			headers.add("Expires", "0");

			return ResponseEntity.ok().headers(headers).contentLength(fsr.contentLength())
					.contentType(MediaType.parseMediaType("application/octet-stream"))
					.body(new InputStreamResource(fsr.getInputStream()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}

	public String createSearchCode() {
		synchronized (ReportController.class) {
			Date now = new Date();
			String code = String.valueOf(now.getTime());
			return StringUtils.substring(code, 1);
		}
	}
	
	public class ReportCount {
		
		private Integer reply = 0;
		
		private Integer noreply = 0;
		
		public ReportCount() {
			// TODO Auto-generated constructor stub
		}
		
		public Integer getReply() {
			return reply;
		}
		public void setReply(Integer reply) {
			this.reply = reply;
		}
		public Integer getNoreply() {
			return noreply;
		}
		public void setNoreply(Integer noreply) {
			this.noreply = noreply;
		}
	}
	
	@RequestMapping(value = "/listByCount", method = RequestMethod.POST)
	public Output listByCount() {
		try {
			ReportCount ret = new ReportCount();
			
			List<ReportEntity> list = reportService.list();
			for (ReportEntity report: list) {
				if (StringUtils.isEmpty(report.getReply())) {
					ret.setNoreply(ret.getNoreply() + 1);
				} else {
					ret.setReply(ret.getReply() + 1);
				}
			}
			
			return new Output(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}