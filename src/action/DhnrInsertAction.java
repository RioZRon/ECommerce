package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import dao.DhnrDao;
import entity.Dhnr;
import entity.HibernateSessionFactory;

public class DhnrInsertAction implements Action {

	private int id;
	private String title;
	private String img;
	private String name;
	private String time;
	private int count;
	private String text;
	private int hid;

	HttpServletResponse response = ServletActionContext.getResponse();

	public String execute() throws Exception {
		try {
			Dhnr dhnr = new Dhnr();
			dhnr.setCount(count);
			dhnr.setHid(hid);
			if (img.length() == 0) {
				dhnr.setImg(dhnr.getImg());
			} else {
				dhnr.setImg(img);
			}
			dhnr.setName(name);
			dhnr.setText(text);
			dhnr.setTime(time);
			dhnr.setTitle(title);
			DhnrDao dao = new DhnrDao();
			int result = dao.insert(dhnr);
			if (result > 0) {
				response.getWriter().write("1");
			} else {
				response.getWriter().write("0");
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	public String update() {
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			Dhnr dhnr = new Dhnr();
			dhnr.setCount(count);
			dhnr.setHid(hid);
			dhnr.setId(id);
			if (img.length() == 0) {
				dhnr.setImg(dhnr.getImg());
			} else {
				dhnr.setImg(img);
			}
			dhnr.setName(name);
			dhnr.setText(text);
			dhnr.setTime(time);
			dhnr.setTitle(title);
			DhnrDao dao = new DhnrDao();
			int result = dao.update(dhnr,request);
			if (result > 0) {
				response.getWriter().write("1");
			} else {
				response.getWriter().write("0");
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	/*-------封装------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

}
