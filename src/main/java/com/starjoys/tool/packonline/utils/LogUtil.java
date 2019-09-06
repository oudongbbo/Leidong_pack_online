package com.starjoys.tool.packonline.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogUtil extends Thread {
	InputStream is;
	String type;
	OutputStream os;

	private static int sdk = 0;

	public static void sdks(int sdks) {
		sdk = sdks;
	}

	public LogUtil(InputStream is, String type) {
		this(is, type, null);
	}

	LogUtil(InputStream is, String type, OutputStream redirect) {
		this.is = is;
		this.type = type;
		this.os = redirect;
	}

	public void run() {
		InputStreamReader isr = null;
		BufferedReader br = null;
		PrintWriter pw = null;
		try {
			if (os != null)
				pw = new PrintWriter(os);

			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null) {
				if (pw != null){
					pw.println(line);
				}
				if (line.contains("zip warning") || line.contains("inflating:") ||line.contains("creating:") ||line.contains("zip warning") ) {
					//解压缩相关的消息太多，先屏蔽
				}else {
					LogUtil.showLog(type + ">" + line);
				}
			}

			if (pw != null) {
				pw.flush();
				pw.close();
			}

			br.close();
			isr.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			
		}
	}
	
	public static void printStream(Process proc){
		try {
			LogUtil errorGobbler = new LogUtil(	proc.getErrorStream(), "Error");
			errorGobbler.start();
			LogUtil outputGobbler = new LogUtil(proc.getInputStream(),	"Output");
			outputGobbler.start();
		} catch (Exception e) {
			e.printStackTrace();
			showLog("打印输出流 报错");
		}
	}
	
	public static void showLog(String msg){
		
//		try {
//			byte[] bytes = msg.getBytes();
//			String message = new String(bytes, "GBK");
//			System.out.println(new Date()+"-->"+message);
//			
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//			System.out.println(getDate()+"-->"+msg);
//		}
		
		System.out.println(getDate()+"-->"+msg);
		
//		if (UI_Common.logText!=null) {
//			UI_Common.logText.append(getDate()+"-->"+msg+System.getProperty("line.separator"));
//			UI_Common.logText.setCaretPosition(UI_Common.logText.getText().length());
//			UI_Common.logText.invalidate();
//		}
	}
	
	public static String getDate(){
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formater.format(new Date());
	}
	
	public enum LogLevel{
		
		LEVEL_1,	
		LEVLE_2,	
		LEVLE_3,
		LEVLE_DEBUG; 
		
	}
	
	public static void log(String msg){
		
		log(msg, LogLevel.LEVLE_3);
	}
	
	public static void log(String msg,LogLevel level){
		
		StringBuffer loginfo = new StringBuffer();
		boolean isPrintLog = true;
		switch (level) {
		case LEVEL_1:
			loginfo.append(">>>>>>>>>>>>>>>").append(msg).append("<<<<<<<<<<<<<<<");
			
			break;
		case LEVLE_DEBUG:
			isPrintLog = true; 
			
			loginfo.append("-->").append(msg).append("<--");
			
			break;
		default:
			
			loginfo.append("***>").append(msg).append("<***");
			
			break;
		}
		
		if (isPrintLog) {
			
			LogUtil.showLog(loginfo.toString());
		}
		
	}
	
	
	
	
}