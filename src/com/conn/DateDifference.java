package com.conn;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateDifference 
{
	public long getDateDifference(String stdate,String lsdate) 
	{
		
		System.out.println("st date "+stdate);
		System.out.println("ls date "+lsdate);
		long diff=0;
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date d1 = null;
		Date d2 = null;
		long diffDays=0;

		try {
			d1 = format.parse(stdate);
			d2 = format.parse(lsdate);
			diff = d2.getTime() - d1.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000);

			System.out.println(diffDays + " days, ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return diffDays;
	}
}
