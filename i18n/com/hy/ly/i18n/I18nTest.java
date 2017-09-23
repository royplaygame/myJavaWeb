package com.hy.ly.i18n;

import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;

import org.junit.Test;

public class I18nTest {
	
	@Test
	public void testResourceBundle(){
		Locale locale=Locale.US;
		ResourceBundle resourceBundle=ResourceBundle.getBundle("i18n", locale);
		
		//System.out.println(resourceBundle.getString("date"));
		//System.out.println(resourceBundle.getString("salary"));
		
		String dateLable=resourceBundle.getString("date");
		String salaryLable=resourceBundle.getString("salary");
		
		String str="{0}: {1}, {2}: {3}";
		
		Date date=new Date();
		double salary=12345.66;
		
		DateFormat df=DateFormat.getDateInstance(DateFormat.MEDIUM, locale);
		String dateStr=df.format(date);
		
		NumberFormat nf=NumberFormat.getCurrencyInstance(locale);
		String salaryStr=nf.format(salary);
		
		String result=MessageFormat.format(str, dateLable,dateStr,salaryLable,salaryStr);
		System.out.println(result);
	}

	@Test
	public void testMessageFormat() {
		String str="Date: {0}, Salary: {1}";
		
		Locale locale=Locale.CHINA;
		Date date=new Date();
		double salary=12345.66;
		
		DateFormat df=DateFormat.getDateInstance(DateFormat.MEDIUM, locale);
		String dateStr=df.format(date);
		
		NumberFormat nf=NumberFormat.getCurrencyInstance(locale);
		String salaryStr=nf.format(salary);
		
		String result=MessageFormat.format(str, dateStr,salaryStr);
		System.out.println(result);
	}

	@Test
	public void testNumberFormat() {
		double d = 12315675623.236d;
		Locale aLocale = Locale.FRENCH;

		NumberFormat nf = NumberFormat.getNumberInstance(aLocale);
		String str = nf.format(d);
		System.out.println(str);

		NumberFormat cnf = NumberFormat.getCurrencyInstance(aLocale);
		System.out.println(cnf.format(d));
	}

	@Test
	public void testDateFormat2() throws ParseException {
		String str = "1990-11-23  22:11:35";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		Date date = df.parse(str);
		System.out.println(date);
	}

	@Test
	public void testDateFormat() {
		Locale aLocale = Locale.CHINA;
		Date date = new Date();
		System.out.println(date);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println(sdf.format(date));

		// DateFormat
		DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, aLocale);
		String str = df.format(date);
		System.out.println(str);
	}

	@Test
	public void testLocale() {
		Locale locale = Locale.CHINA;
		System.out.println(locale.getDisplayCountry());
		System.out.println(locale.getLanguage());

		locale = new Locale("en", "US");
		System.out.println(locale.getDisplayCountry());
		System.out.println(locale.getLanguage());
	}
}
