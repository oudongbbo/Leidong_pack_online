package com.starjoys.tool.packonline.utils;


import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class FileUtil{


	public static boolean copyFile(File sourceFile, File targetFile) {

		try {
			FileInputStream input = new FileInputStream(sourceFile);
			BufferedInputStream inBuff = new BufferedInputStream(input);

			FileOutputStream output = new FileOutputStream(targetFile);
			BufferedOutputStream outBuff = new BufferedOutputStream(output);

			byte[] b = new byte[1024 * 5];
			int len;
			while ((len = inBuff.read(b)) != -1) {
				outBuff.write(b, 0, len);
			}
			outBuff.flush();

			inBuff.close();
			outBuff.close();
			output.close();
			input.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	public static void copyDirectiory(String sourceDir, String targetDir,boolean reset) {
		
		System.out.println("来自于："+sourceDir);
		System.out.println("复制到："+targetDir);
		
		if (SystemUtils.getOSName() == SystemUtils.IS_LINUX_OS ) {
			copyDirectioryInLinux(sourceDir, targetDir, reset);
		}else {
			copyDirectioryNormal(sourceDir, targetDir, reset);
			
		}
		
	}

	public static void copyDirectioryNormal(String sourceDir, String targetDir,boolean reset) {
		(new File(targetDir)).mkdirs();
		File[] files = (new File(sourceDir)).listFiles();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				File sourceFile = files[i];
				String filename = files[i].getName();
				File targetFile = new File(
						new File(targetDir).getAbsolutePath() + File.separator+ filename);
				copyFile(sourceFile, targetFile);
			}
			if (files[i].isDirectory()) {
				String dir1 = sourceDir + File.separator + files[i].getName();
				String dir2 = targetDir + File.separator + files[i].getName();
				copyDirectioryNormal(dir1, dir2, reset);
			}
		}
	}
		public static void copyDirectioryInLinux(String sourceDir, String targetDir,
				boolean reset) {

			(new File(targetDir)).mkdirs();
			File[] file = (new File(sourceDir)).listFiles();
			for (int i = 0; i < file.length; i++) {
				if (file[i].isFile()) {
					File sourceFile = file[i];
					String filename = file[i].getName();//.toLowerCase();
					String filename2 = file[i].getName();//.toLowerCase();
					String filename_lowercase = filename2.toLowerCase();
					File targetFile = new File(
							new File(targetDir).getAbsolutePath() + File.separator
									+ filename);
					File targetFile_lowercase = new File(
							new File(targetDir).getAbsolutePath() + File.separator
							+ filename_lowercase);
					
					if (filename!=null && !"".equals(filename)  && filename_lowercase!=null && !"".equals(filename_lowercase) ) {
						if (!filename.equals(filename_lowercase)) {
							if (targetFile_lowercase.exists()) {
								System.out.println("源文件："+sourceFile.getAbsolutePath());
								System.out.println("目标文件："+targetFile.getAbsolutePath());
								System.out.println("目标文件，小写："+targetFile_lowercase.getAbsolutePath());
								targetFile_lowercase.delete();
							}
						}
					}
					
					copyFile(sourceFile, targetFile);
				}
				if (file[i].isDirectory()) {
					String dir1 = sourceDir + File.separator + file[i].getName();
					String dir2 = targetDir + File.separator + file[i].getName();
					copyDirectioryInLinux(dir1, dir2, reset);
				}
			}
		}
	/**
	 * 
	 * @param filePath
	 * @return
	 */
	public static String read(String filePath) {
		BufferedReader br = null;
		String line = null;
		StringBuffer buf = new StringBuffer();

		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));

			while ((line = br.readLine()) != null) {
				if (buf.length() != 0) {
					buf.append(System.getProperty("line.separator"));
				}
				buf.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					br = null;
				}
			}
		}

		return buf.toString();
	}

	/**
	 * 
	 * @param filePath
	 * @param content
	 */
	public static void write(String filePath, String content) {
		BufferedWriter bw = null;

		try {
			//bw = new BufferedWriter(new FileWriter(filePath));
			bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath),"UTF-8"));
			bw.write(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
					bw = null;
				}
			}
		}
	}

	private static void listFolder(String path, String sStr, String xStr) {

		String ssStr = sStr.replaceAll("\\.", "/");
		String xxStr = xStr.replaceAll("\\.", "/");

		File file = new File(path);
		File[] list = file.listFiles();
		for (int i = 0; i < list.length; i++) {
			if (list[i].isDirectory())
				listFolder(list[i].getPath(), sStr, xStr);
			else {
				String filePath = list[i].getPath();
				String content = read(filePath);
				content = content.replaceAll(sStr, xStr);
				content = content.replaceAll(ssStr, xxStr);
				write(filePath, content);
				// LogUtil.showLog(filePath+" OK");
			}
		}
	}

	public static void delDir(File file) {
		if (file.exists()) {
			if (file.isFile()) {
				file.delete();
			} else if (file.isDirectory()) {
				File files[] = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					delDir(files[i]);
				}
			}
			file.delete();
		} else {
			LogUtil.showLog("要删除的文件不存在" + '\n');
		}
	}

	public static void replaceDir(File file,final String content,final String replacement){
		
        File[] files = file.listFiles(); 
        for (int i = 0; i < files.length; i++) { 
            if (files[i].isDirectory()) { 
            	replaceDir(files[i],content,replacement); 
            } else { 
				String sContent = FileUtil.read(files[i].getAbsolutePath());
				
				//TODO ?
				if(sContent.contains(content)){
					 LogUtil.showLog("�ҵ��滻����Ϊ��"+content+"�� ���ļ�:"+files[i].getName());
				}
				
				sContent = sContent.replaceAll(content, replacement);
				FileUtil.write(files[i].getAbsolutePath(), sContent);  
				
            } 
        }
       
	}
	
	/*
	 * @dataTime 2015��1��13��11:20:22
	 */
	public static void replaceDir(File file,final String content,final String replacement,FileFilter filter){
		
		if (!file.exists()) {
			
			LogUtil.showLog("������"+file.getAbsolutePath()+"----- ����������");
			return;
		}
		
        File[] files = file.listFiles(filter);
        for (int i = 0; i < files.length; i++) {
        	
//        	LogUtil.showLog("-----readFile:"+files[i].getAbsolutePath()+"------");
        	
            if (files[i].isDirectory()) { 
            	replaceDir(files[i],content,replacement,filter); 
            } else { 
				String sContent = FileUtil.read(files[i].getAbsolutePath());
				
				if(sContent.contains(content)){
					LogUtil.showLog("�ҵ��滻����Ϊ��"+content+"�� ���ļ�:"+files[i].getName());

					sContent = sContent.replaceAll(content, replacement);
					FileUtil.write(files[i].getAbsolutePath(), sContent);
				}
				
            } 
        }
       
	}
	
	/**
	 * @param filePath
	 */
	public static void delPayFiles(String filePath) {
		File root = new File(filePath);
		File[] files = root.listFiles();
		for (File file : files) {
			if (file.isDirectory()) {
				
				delPayFiles(file.getAbsolutePath());

			} else {

			}
			if (file.getName().equals("alipay")
					|| file.getName().equals("unionpay")) {
				FileUtil.delDir(file);
			}
		}
	}
	
	
	public static void main(String[] args) {
		LogUtil.showLog("com.app.lo->"+getFilePathFrom("com.app.lo"));
	}
	
	/**
	 * @param sdkplugin
	 * @param prop
	 * @param map
	 */
	public static  void repleaseContent(String sdkplugin, Properties prop, 
			Map<String, String> map){
		
		String content = FileUtil.read(sdkplugin);
		
		Pattern p = null;
		Matcher m = null;
		String propKey="";
		String propValue="";
		Object[] mapValue = null ;
		Object[] mapKey = null;
		
		if(map.keySet().toArray().length != 0){
			
			mapValue = map.values().toArray();
			mapKey = map.keySet().toArray();
		}
		
		try {
			
			if(mapKey != null && mapValue != null){
				
				for (int i = 0; i < map.size(); i++) {
					
					 propKey = mapKey[i].toString();
					 propValue = mapValue[i].toString();
					 p = Pattern.compile("<meta-data android:name=\""+propValue+"\" android:value=\"(.*?)\"");
					 m = p.matcher(content);
					 m.find();
					 String key = m.group(1);
					 LogUtil.showLog("key========="+key);
					 content = content.replaceAll("android:name=\""+propValue+"\" android:value=\""+key, "android:name=\""+propValue+"\" android:value=\""+prop.getProperty(propKey));
					 LogUtil.showLog(propKey+">>>>>>>"+propValue+"--->"+prop.getProperty(propKey));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.showLog("����metaֵʱ����:"+e.toString());
		}
		
		FileUtil.write(sdkplugin, content);
		
	}
	
	
	/**
	 * ��ȡ��Ҫ�滻��Դ���ļ�·��
	 * 
	 * @param filePath
	 *            �ļ�·��
	 * @return
	 */
	public static List<String>  readReplasePath(String filePath) {
		
		BufferedReader br = null;
		String line = null;
		StringBuffer buf = new StringBuffer();
		List listPath = new ArrayList<String>();
		
		File file_path = new File(filePath);
		
		if(!file_path.isFile()){
			LogUtil.log("��ǰ��ȡ�Ĳ���һ���ļ�,��ȡʧ�ܣ�");
			return null;
		}
		
		try {
			// �����ļ�·����������������
			br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
			
			// ѭ����ȡ�ļ���ÿһ��, ����Ҫ�޸ĵ��н����޸�, ���뻺�������
			while ((line = br.readLine()) != null) {
				buf.append(line);
				listPath.add(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// �ر���
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					br = null;
				}
			}
		}
		
		return listPath;
	}
	
	/**
	 * �ļ�������
	 * 
	 * @param path
	 *            �ļ�Ŀ¼
	 * @param oldName
	 *            ԭ�����ļ���
	 * @param newName
	 *            ���ļ���
	 */
	public static void renameFile(String path, String oldName, String newName) {
		
		if (!oldName.equals(newName)) {// �µ��ļ�������ǰ�ļ�����ͬʱ,���б�Ҫ����������
			File oldfile = new File(path + "/" + oldName);
			File newfile = new File(path + "/" + newName);
			if (!oldfile.exists()) {
				LogUtil.showLog("���������ļ�������!");
				return;// �������ļ�������
			}
			if (newfile.exists()){// ���ڸ�Ŀ¼���Ѿ���һ���ļ������ļ�����ͬ��������������
				LogUtil.showLog(newName + "�Ѿ����ڣ�ɾ��"+oldfile+"�ļ�");
				FileUtil.delDir(oldfile);
			}else {
				oldfile.renameTo(newfile);
			}
		} else {
			LogUtil.showLog("���ļ����;��ļ�����ͬ...");
		}
		
	}
	
	/**
	 * 读取一行内容
	 * @param filePath 文件路径
	 * @param content 当前行包含的字段
	 * @return
	 */
	public static String readLine(String filePath,String content){
		
		if (content==null || "".equals(content) ) {
			
			return null;
		}
		
		BufferedReader br = null;
		String line = null;
		
 		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
			
			while ((line = br.readLine()) != null) {
				
					if(line.contains(content) ){
						
						return line;
					}
			}

		} catch (Exception e) {
			
		} finally {
			
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					br = null;
				}
			}}

		return line;
	}
	
	
	/**获取含有某个字段的所有行数
	 * @param filePath
	 * @param content
	 * @return
	 */
	public static ArrayList<String> readAllLines(String filePath,String content){
		
		if (content==null || "".equals(content) ) {
			return null;
		}
		
		ArrayList<String> contentLines = new ArrayList<String>();
		BufferedReader br = null;
		String line = null;
		
 		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
			
			while ((line = br.readLine()) != null) {
				if (line.contains(content)) {
					contentLines.add(line);
				}
				
			}

		} catch (Exception e) {
			
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					br = null;
				}
			}}

		return contentLines;
	}


	public static String getFilePathFrom(String name){
		
		StringBuilder namePath =  new StringBuilder();
		
		if (name != null && !"".equals(name)  && name.contains(".")) {
			
			String[] names = name.split("\\.");
			
			
			for (int i = 0; i < names.length; i++) {
				
				LogUtil.showLog("��˳���������-name:"+names[i]);
				
				if (i==names.length-1) {
					namePath.append(names[i]);
				}else {
					namePath.append(names[i]+File.separator);
				}
			}
			
			LogUtil.showLog(name + " �滻���·��Ϊ��"+namePath.toString());
			
			return namePath.toString();
			
		}else {
			LogUtil.showLog("\n\n����Ϊ�գ����߲�����\".\"���޷�ת����\n\n");
			return  null;
		}
		
	}
	
	public static List<String> getFileList(String filePath,String name){
		
		List<String> namePaths = new ArrayList<String>();
		
		File file = new File(filePath);
		
		if (file.exists()) {
			File[] files = file.listFiles();
			if (files.length>1) {
				//文件大于1
				for (File tempFile : files) {
					if (tempFile.isDirectory()) {
						//继续查找，如果结果大于等于1，则加入上级list表
						List<String> tempLists = getFileList(filePath, name);
						if (tempLists.size()>=1) {
							namePaths.addAll(tempLists);
						}
					}else {
						//匹配
						String tempName = tempFile.getName();
						if (name.equals(tempName)) {
							//添加到表中
							namePaths.add(tempFile.getAbsolutePath());
						}
					}
				}
			}
		}
		
		return namePaths;
		
	}


	public static boolean createDir(File dirFile) {
		if (!dirFile.exists()) {
			return dirFile.mkdirs();
		} else {
			return false;
		}
 	}

}
