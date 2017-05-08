package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import dao.*;
import entity.*;

public class DhAction implements Action {

	private int id;
	private int num;

	public String execute() throws Exception {
		// 修改导航排序
		try {
			DhDao dao = new DhDao();
			int result = dao.uppx(id, num);
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

	HttpServletResponse response = ServletActionContext.getResponse();

	public String select() {
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Dh> list = new ArrayList<Dh>();
		try {
			response.setContentType("text/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			DhDao dao = new DhDao();
			list = dao.select(id);
			StringBuffer json = new StringBuffer("[");
			String data = "";
			for (int i = 0; i < list.size(); i++) {
				json.append("{id:" + list.get(i).getId() + ",");
				json.append("pId:" + list.get(i).getPid() + ",");
				json.append("name:\"" + list.get(i).getName() + "\",");
				if (list.get(i).getIsparent().equals("true")) {
					json.append("isParent:" + list.get(i).getIsparent() + ",");
				}
				json.append("dan:\"" + list.get(i).getDan() + "\",");
				json.append("type:\"" + list.get(i).getType() + "\",");
				json.append("num:\"" + list.get(i).getNum() + "\",");
				data = json.substring(0, json.lastIndexOf(",")) + "},";
				json = new StringBuffer(data);
			}
			data = json.substring(0, json.length() - 1) + "]";
			response.getWriter().write(data);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			HibernateSessionFactory.getSession().close();
		}
		return null;
	}

	// 导航添加根目录
	public String insert() {
		HttpServletRequest quest = ServletActionContext.getRequest();
		try {
			String name = quest.getParameter("name");
			String dan = quest.getParameter("dan");
			DhDao dao = new DhDao();
			Dh dh = new Dh();
			dh.setName(name.trim());
			dh.setPid(0);
			dh.setType(1);
			// dh.setUrl("dan.action?title="+name.trim()+"&pid=0");
			dh.setDan(dan);
			dh.setIsparent("false");
			dh.setNum(0);
			int result = dao.insert(dh);
			if (result > 0) {
				dao.upurl(result, "dnr.action?id=" + result);
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

	// 根据id查询下级作为页面左侧三四级导航
	public String selectleft() {
		response.setCharacterEncoding("utf-8");
		try {
			List<Dh> list = new ArrayList<Dh>();
			DhDao dao = new DhDao();
			list = dao.select(id);
			JSONArray jsonArray = JSONArray.fromObject(list);
			response.getWriter().write(jsonArray.toString());
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	/*-------------------*/
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
