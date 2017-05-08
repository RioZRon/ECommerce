package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import dao.DhnrDao;
import entity.Dhnr;
import entity.HibernateSessionFactory;

public class CopyOfDhnrUpAction implements Action {
	private int id;
	private String dan;

	public String execute() throws Exception {
		try {
			List<Dhnr> list = new ArrayList<Dhnr>();
			DhnrDao dao = new DhnrDao();
			list = dao.select(id);
			ActionContext.getContext().put("hid", id);
			ActionContext.getContext().put("list", list);
			if (dan.equals("no")) {
				return Action.INPUT;
			}
			if (dan.equals("up")) {
				// dan=up时是后台列表修改内容跳转页面
				list = dao.selectid(id);
				ActionContext.getContext().put("list", list);
				return Action.NONE;
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}

	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();

	public String delete() {
		try {
			DhnrDao dao = new DhnrDao();
			int result = dao.deleteid(id,request);
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

	public String count() {
		try {
			int count = Integer.parseInt(request.getParameter("count"));
			DhnrDao dao = new DhnrDao();
			dao.updatecount(count + 1, id);
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	/*-------------------------*/
	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
