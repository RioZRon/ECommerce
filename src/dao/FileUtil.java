package dao;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import entity.Dhnr;

/**
 * 文件删除工具类
 * 2017.4.24
 * 
 */
public class FileUtil {

	// updata
	@SuppressWarnings("deprecation")
	public void deleFile(String text, String img, Dhnr nnr,
			HttpServletRequest request) {
		String url = request.getRealPath("").replace("\\", "/");
		if (img != null && !img.equals(nnr.getImg())) {
			String imgurl = url
					+ img.substring(img.indexOf("/", img.indexOf("/") + 1));// 缩略图路径
			File file = new File(imgurl);
			deleteFile(file);
		}
		if (text != null && !text.equals(nnr.getText())) {
			String regexvideo = "vcastr_file=/([\\w/\\.]*)&autostart";//删除flv文件
			String regexswf = "<embed src=\"/([\\w/\\.]*)\" type";//删除swf文件
			String regeximg = "<img src=\"/([\\w/\\.]*)\" alt";//删除png、jpg文件
			String regexflash = "href=\"/([\\w/\\.]*)\" target"; //删除rar,zip文件
			Pattern pv = Pattern.compile(regexvideo);
			Pattern ps = Pattern.compile(regexswf);
			Pattern pi = Pattern.compile(regeximg);
			Pattern pf = Pattern.compile(regexflash);
			Matcher mv = pv.matcher(text);
			Matcher ms = ps.matcher(text);
			Matcher mi = pi.matcher(text);
			Matcher mf = pf.matcher(text);
			while (mv.find()) {
				if (!nnr.getText().contains(mv.group(1))) {
					File file = new File(url + geturl(mv.group(1)));
					deleteFile(file);
				}
			}
			while (ms.find()) {
				if (!nnr.getText().contains(ms.group(1))) {
					File file = new File(url + geturl(ms.group(1)));
					deleteFile(file);
				}
			}
			while (mi.find()) {
				if (!nnr.getText().contains(mi.group(1))) {
					File file = new File(url + geturl(mi.group(1)));
					deleteFile(file);
				}
			}
			while (mf.find()) {
				if (!nnr.getText().contains(mf.group(1))) {
					File file = new File(url + geturl(mf.group(1)));
					deleteFile(file);
				}
			}
		}
	}

	// delete
	@SuppressWarnings("deprecation")
	public void deleFile(String text, String img, HttpServletRequest request) {
		// String url = request.getServletPath().replace("\\", "/");
		String url = request.getRealPath("").replace("\\", "/");
		if (img != null) {
			String imgurl = url
					+ img.substring(img.indexOf("/", img.indexOf("/") + 1));// 缩略图路径
			File file = new File(imgurl);
			if (file.exists() && file.isFile()) {
				deleteFile(file);
				System.out.println("图片删除成功");
			}
		}
		if (text != null) {
			String regexvideo = "vcastr_file=/([\\w/\\.]*)&autostart";//删除flv文件
			String regexswf = "<embed src=\"/([\\w/\\.]*)\" type";//删除swf文件
			String regeximg = "<img src=\"/([\\w/\\.]*)\" alt";//删除png、jpg文件
			String regexflash = "href=\"/([\\w/\\.]*)\" target"; //删除rar,zip文件
			Pattern pv = Pattern.compile(regexvideo);
			Pattern ps = Pattern.compile(regexswf);
			Pattern pi = Pattern.compile(regeximg);
			Pattern pf = Pattern.compile(regexflash);
			Matcher mv = pv.matcher(text);
			Matcher ms = ps.matcher(text);
			Matcher mi = pi.matcher(text);
			Matcher mf = pf.matcher(text);
			while (mv.find()) {
				File file = new File(url + geturl(mv.group(1)));
				deleteFile(file);
			}
			while (ms.find()) {
				File file = new File(url + geturl(ms.group(1)));
				deleteFile(file);
			}
			while (mi.find()) {
				File file = new File(url + geturl(mi.group(1)));
				deleteFile(file);
			}
			while (mf.find()) {
				File file = new File(url + geturl(mf.group(1)));
				deleteFile(file);
			}
		}
	}

	// 截取文件的路径
	public  String geturl(String str) {
		int index = str.indexOf("/");
		String path = str.substring(index);
		return path;
	}

	private int count = 0;//文件夹计数器

	// 文件删除方法
	private void deleteFile(File file) {
		if (file.exists() && file.isFile()&& count <= 2) {//文件删除
			boolean flag = file.delete();
			count++;
			System.out.println(file.getPath());
			System.out.println(flag+"文件删除成功");
			File f = new File(file.getParent());
			if (f.isDirectory()) {// 如果该文件所在的父文件夹是空的则把此文件夹一同删除
				deleteFile(f);
			}
		} else if(file.exists()&& count <= 2){//文件夹删除
			File[] files = file.listFiles();
			if(files.length<1){
				boolean flag = file.delete();
				count++;
				System.out.println(file.getPath());
				System.out.println(flag+"文件夹删除成功");
				File f = new File(file.getParent());
				if (f.isDirectory()) {// 如果该文件所在的父文件夹是空的则把此文件夹一同删除
					deleteFile(f);
				}
			}
		}else{
			System.out.println(file.getPath());
			System.out.println("没有此文件");
		}

	}
}
