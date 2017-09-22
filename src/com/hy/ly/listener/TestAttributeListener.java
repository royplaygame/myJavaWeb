package com.hy.ly.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class TestAttributeListener implements ServletContextAttributeListener,ServletRequestAttributeListener,HttpSessionAttributeListener{

	
	@Override
	public void attributeAdded(ServletRequestAttributeEvent arg0) {
		System.out.println(" Request attributeAdded"+arg0.getName()+" "+arg0.getValue());
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent arg0) {
		System.out.println(" Request attributeRemoved"+arg0.getName()+" "+arg0.getValue());
		
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent arg0) {
		System.out.println(" Request attributeReplaced"+arg0.getName()+" "+arg0.getValue());
		
	}

	@Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
		System.out.println(" ServletContext attributeAdded"+arg0.getName()+" "+arg0.getValue());
		
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		System.out.println(" ServletContext attributeRemoved"+arg0.getName()+" "+arg0.getValue());
		
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println(" ServletContext attributeReplaced"+arg0.getName()+" "+arg0.getValue());
		
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		System.out.println(" HttpSession attributeAdded"+arg0.getName()+" "+arg0.getValue());	
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		System.out.println(" HttpSession attributeRemoved"+arg0.getName()+" "+arg0.getValue());	
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		System.out.println(" HttpSession attributeReplaced"+arg0.getName()+" "+arg0.getValue());	
		
	}

}
