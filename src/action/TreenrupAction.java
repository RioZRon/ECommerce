package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.TreenrDao;

import entity.HibernateSessionFactory;
import entity.Treenr;

public class TreenrupAction implements Action {

	private int id;
	private String dan;

	public String execute() throws Exception {
		try {
			List<Treenr> list = new ArrayList<Treenr>();
			TreenrDao dao = new TreenrDao();
			list = dao.select(id);
			System.out.println(list.size());
			ActionContext.getContext().put("list", list);

		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		if (dan.equals("yes")) {
			return Action.INPUT;
		} else {
			return Action.SUCCESS;
		}
	}

	// 查询内容拿来修改
	public String select() {
		try {
			List<Treenr> list = new ArrayList<Treenr>();
			TreenrDao dao = new TreenrDao();
			list = dao.selectid(id);
			ActionContext.getContext().put("list", list);
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.LOGIN;
	}

	/*--------------------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

}
