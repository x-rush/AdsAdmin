package com.erpdemo.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.erpdemo.config.WebMvcConfig;
import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.SysUserService;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;

/**
 * 系统用户
 * 
 */
@Controller
@RequestMapping("/sys/fileupload")
public class SysFileUploadController extends AbstractController {
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private WebMvcConfig webMvcConfig;
	
	
	/**
	 * 保存用户
	 */
	@RequestMapping("/save")
	public String save(HttpServletRequest req,
			String op, String name) {

		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)req;
		
		MultipartFile file = mreq.getFile("file");
		
		List<MultipartFile> files = mreq.getFiles("file");
		
		
		String fileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 获取真实物理路径
		String realPath = webMvcConfig.getFileUploadProperteis().getUploadFolder();
		// 文件上传子路径
		
		String subPath = "";
		
		// 新文件名
		String newFileName = sdf.format(new Date());
		
		// 文件后缀
		String subfilename = fileName.substring(fileName.lastIndexOf('.'));
		
		// 上传路径+文件名称
		String uploadPath = realPath+subPath+newFileName+"."+subfilename;
		
		FileOutputStream fos;
		
		try {
			fos = new FileOutputStream(uploadPath);
			
			fos.write(file.getBytes());
			
			fos.flush();
			
			fos.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// Excel解析
		
		
		
		return "sys/fileupload.html";
	}

	
	
	
	
}
