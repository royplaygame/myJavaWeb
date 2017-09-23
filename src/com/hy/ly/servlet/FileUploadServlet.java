package com.hy.ly.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.hy.ly.exception.InvalidExtNameException;
import com.hy.ly.po.FileUploadBean;
import com.hy.ly.utils.FileUploadProperties;
import com.hy.ly.utils.FileUtils;

@WebServlet("/app/fileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String FILE_PATH = "/WEB-INF/files/";
	
	private static final String TEMP_DIR = "//";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletFileUpload upload = getServletFileUpload();
		String path= null;
		try {
			Map<String, FileItem> uploadFiles = new HashMap<>();
			// 解析文件
			List<FileItem> items = upload.parseRequest(request);

			// 1. 构建FileUploadBean集合，同时填充uploadFiles
			List<FileUploadBean> beans = buildFileUploadBeans(items, uploadFiles);
			// 2. 校验文件扩展名
			validateExtName(beans);

			// 3. 校验文件大小（在解析时已经校验，只需通过异常得到结果）

			// 4.进行文件上传
			upload(uploadFiles);

			// 5.保存到数据库中
			saveFileUploadBeans(beans);
			
			//6. 删除临时文件夹的临时文件
			FileUtils.delAllFile(TEMP_DIR);
			path="/app/success.jsp";
		} catch (Exception ex) {
			ex.printStackTrace();
			path="/app/upload.jsp";
			request.setAttribute("message", ex.getMessage());
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void saveFileUploadBeans(List<FileUploadBean> beans) {
		//dao.save(beans); 

	}

	private void upload(Map<String, FileItem> uploadFiles) throws IOException{
		for(Map.Entry<String, FileItem> entry:uploadFiles.entrySet()){
			String filePath=entry.getKey();
			FileItem item=entry.getValue();
			upload( filePath,  item.getInputStream());
		}
	}

	private void upload(String filePath, InputStream inputStream) throws IOException {
		OutputStream out = new FileOutputStream(filePath);
		
		byte [] buffer = new byte[1024];
		int len = 0;
		
		while((len = inputStream.read(buffer)) != -1){
			out.write(buffer, 0, len);
		}
		
		inputStream.close();
		out.close();
		
		System.out.println(filePath);
	}

	private void validateExtName(List<FileUploadBean> beans) {
		String exts = FileUploadProperties.getFileUploadProperties().getPropertiy("exts");
		List<String> extList = Arrays.asList(exts.split(","));
		System.out.println(extList);
		
		for(FileUploadBean bean: beans){
			String fileName = bean.getFileName();
			System.out.println(fileName.indexOf(".")); 
			
			String extName = fileName.substring(fileName.lastIndexOf(".") + 1);
			System.out.println(extName); 
			
			if(!extList.contains(extName)){
				throw new InvalidExtNameException(fileName + " 文件的扩展名不合法");
			}
		}

	}

	private List<FileUploadBean> buildFileUploadBeans(List<FileItem> items, Map<String, FileItem> uploadFiles)
			throws UnsupportedEncodingException {
		List<FileUploadBean> beans = new ArrayList<>();

		Map<String, String> descs = new HashMap<>();

		for (int i = 0; i < items.size(); i++) {
			FileItem item = items.get(i);

			if (item.isFormField()) {
				// desc1 或 desc2 ...
				String fieldName = item.getFieldName();
				String desc = item.getString("UTF-8");

				descs.put(fieldName, desc);
			}
		}

		for (int i = 0; i < items.size(); i++) {
			FileItem item = items.get(i);
			FileUploadBean bean = null;
			if (!item.isFormField()) {
				String fieldName = item.getFieldName();
				String descName = "desc" + fieldName.substring(fieldName.length() - 1);
				String desc = descs.get(descName);

				// 对应文件名
				String fileName = item.getName();
				String filePath = getFilePath(fileName);

				bean = new FileUploadBean(fileName, filePath, desc);
				beans.add(bean);

				uploadFiles.put(bean.getFilePath(), item);
			}
		}

		return beans;
	}

	private String getFilePath(String fileName) {
		String extName = fileName.substring(fileName.lastIndexOf("."));
		Random random = new Random();

		String filePath = getServletContext().getRealPath(FILE_PATH) + "\\" + System.currentTimeMillis()
				+ random.nextInt(100000) + extName;
		return filePath;
	}

	private ServletFileUpload getServletFileUpload() {
		// 获取参数文件
		String fileMaxSize = FileUploadProperties.getFileUploadProperties().getPropertiy("file.max.size");
		String totalFileMaxSize = FileUploadProperties.getFileUploadProperties().getPropertiy("total.file.max.size");

		// System.out.println(exts+"\t"+fileMaxSize+"\t"+totalFileMaxSize);
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Set factory constraints
		factory.setSizeThreshold(1024 * 500);
		File tempDirectory = new File("d:\\tmp");
		factory.setRepository(tempDirectory);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Set overall request size constraint
		upload.setSizeMax(Integer.parseInt(totalFileMaxSize));
		upload.setFileSizeMax(Integer.parseInt(fileMaxSize));
		return upload;
	}

}
