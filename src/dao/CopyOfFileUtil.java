package dao;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import entity.Dhnr;

public class CopyOfFileUtil {

	// updata
	public void deleFile(String text, String img, Dhnr nnr,
			HttpServletRequest request) {
		String url = request.getRealPath("").replace("\\", "/");
		if (img != null&&!img.equals(nnr.getImg())) {
			String imgurl = url
					+ img.substring(img.indexOf("/", img.indexOf("/") + 1));// 缩略图路径
			File file = new File(imgurl);
			if (file.isFile()) {
				file.delete();
			}
		}
		if (text!=null&&!text.equals(nnr.getText())) {
			String regexvideo = "<embed src=\"/([\\w/\\.]*)\" type";
			String regeximg = "<img src=\"/([\\w/\\.]*)\" alt";
			String regexflash = "href=\"/([\\w/\\.]*)\" target";
			Pattern pv = Pattern.compile(regexvideo);
			Pattern pi = Pattern.compile(regeximg);
			Pattern pf = Pattern.compile(regexflash);
			Matcher mv = pv.matcher(text);
			Matcher mi = pi.matcher(text);
			Matcher mf = pf.matcher(text);
			while (mv.find()) {
				// System.out.println(url+geturl(mv.group(1))+",**********");
				if (!nnr.getText().contains(mv.group(1))) {
					File file = new File(url + geturl(mv.group(1)));
					System.out.println(url + geturl(mv.group(1)));
					if (file.isFile()) {
						file.delete();
						System.out.println("文件删除成功");
					} else {
						System.out.println("没有此文件");
					}
				}
			}
			while (mi.find()) {
				if (!nnr.getText().contains(mi.group(1))) {
					File file = new File(url + geturl(mi.group(1)));
					System.out.println(url + geturl(mi.group(1)));
					if (file.isFile()) {
						file.delete();
						System.out.println("文件删除成功");
					} else {
						System.out.println("没有此文件");
					}
				}
			}
			while (mf.find()) {
				if (!nnr.getText().contains(mf.group(1))) {
					File file = new File(url + geturl(mf.group(1)));
					System.out.println(url + geturl(mf.group(1)));
					if (file.isFile()) {
						file.delete();
						System.out.println("文件删除成功");
					} else {
						System.out.println("没有此文件");
					}
				}
			}
		}
	}

	// delete
	public void deleFile(String text, String img, HttpServletRequest request) {
//		String url = request.getServletPath().replace("\\", "/");
		String url = request.getRealPath("").replace("\\", "/");
		if (img != null) {
			String imgurl = url
					+ img.substring(img.indexOf("/", img.indexOf("/") + 1));// 缩略图路径
			File file = new File(imgurl);
			if (file.isFile()) {
				file.delete();
				System.out.println("图片删除成功");
			}
		}
		if (text != null) {
			String regexvideo = "<embed src=\"/([\\w/\\.]*)\" type";
			String regeximg = "<img src=\"/([\\w/\\.]*)\" alt";
			String regexflash = "href=\"/([\\w/\\.]*)\" target";
			Pattern pv = Pattern.compile(regexvideo);
			Pattern pi = Pattern.compile(regeximg);
			Pattern pf = Pattern.compile(regexflash);

			Matcher mv = pv.matcher(text);
			Matcher mi = pi.matcher(text);
			Matcher mf = pf.matcher(text);
			while (mv.find()) {
				File filev = new File(url + geturl(mv.group(1)));
				if (filev.isFile()) {
					filev.delete();
					System.out.println("文件删除成功");
				} else {
					System.out.println("没有此文件");
				}
			}
			while (mi.find()) {
				File filei = new File(url + geturl(mi.group(1)));
				if (filei.isFile()) {
					filei.delete();
					System.out.println("文件删除成功");
				} else {
					System.out.println("没有此文件");
				}
			}
			while (mf.find()) {
				File filef = new File(url + geturl(mf.group(1)));
				if (filef.isFile()) {
					filef.delete();
					System.out.println("文件删除成功");
				} else {
					System.out.println("没有此文件");
				}
			}
		}
	}

	public static String geturl(String str) {
		int index = str.indexOf("/");
		System.out.println(index);
		String result = str.substring(index);
		return result;
	}
}
