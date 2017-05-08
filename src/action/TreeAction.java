package action;

import java.util.*;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.Action;
import dao.TreeDao;
import entity.*;

public class TreeAction implements Action {

	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	HttpServletResponse response = ServletActionContext.getResponse();
	public String execute() throws Exception {
		List<Tree> list = new ArrayList<Tree>();
		try {
			response.setContentType("text/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			TreeDao dao=new TreeDao();
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
				json.append("encrypt:\"" + list.get(i).getEncrypt() + "\",");
				json.append("url:\"" + list.get(i).getUrl() + "\",");
				json.append("num:\"" + list.get(i).getNum() + "\",");
				data = json.substring(0, json.lastIndexOf(",")) + "},";
				json = new StringBuffer(data);
			}
			data=json.substring(0, json.length()-1)+"]";
			response.getWriter().write(data);
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.getSession().close();
		}
		return null;
	}
	
	public String select(){
		List<Tree> list = new ArrayList<Tree>();
		try {
			response.setContentType("text/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			TreeDao dao=new TreeDao();
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
				json.append("encrypt:\"" + list.get(i).getEncrypt() + "\",");
				json.append("num:\"" + list.get(i).getNum() + "\",");
				data = json.substring(0, json.lastIndexOf(",")) + "},";
				json = new StringBuffer(data);
			}
			data=json.substring(0, json.length()-1)+"]";
			response.getWriter().write(data);
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.getSession().close();
		}
		return null;
	}
}
