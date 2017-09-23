package com.hy.ly.listener;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.hy.ly.utils.FileUploadProperties;

@WebListener
public class FileUploadListener implements ServletContextListener {

    public FileUploadListener() {
        // TODO Auto-generated constructor stub
    }
    public void contextInitialized(ServletContextEvent arg0)  { 
         // 获取文件
    	InputStream inStream=this.getClass().getClassLoader().getResourceAsStream("/upload.properties");
    	
    	Properties properties=new Properties();
    	try {
			properties.load(inStream);
			
			for(Map.Entry<Object, Object> entry:properties.entrySet()){
				String name=(String)entry.getKey();
				String value=(String)entry.getValue();
				FileUploadProperties.getFileUploadProperties().addProperties(name, value);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }

    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
