package com.hy.ly.utils;

import java.util.HashMap;
import java.util.Map;

public class FileUploadProperties {
	
	private static Map<String,String> properties=new HashMap<String,String>();

	private static FileUploadProperties  instance=  new FileUploadProperties();

	private FileUploadProperties() {
	}

	public static FileUploadProperties  getFileUploadProperties() {
		return instance;
	}
	
	public void addProperties(String name,String value){
		properties.put(name, value);
	}
	
	public String getPropertiy(String name){
		return properties.get(name);
	}
}
