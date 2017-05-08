package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import dao.*;
import entity.*;

public class IndexAction implements Action {

	private int id;
	private int type;

	public String execute() throws Exception {
		try {
			if (type == 110) {
				List<Tree> list = new ArrayList<Tree>();
				TreeDao dao = new TreeDao();
				list = dao.select(id);
				ActionContext.getContext().put("list", list);
			} else {
				List<Dh> list = new ArrayList<Dh>();
				DhDao dao = new DhDao();
				list = dao.select(id);
				if (list.size() > 0) {
					ActionContext.getContext().put("list", list);
				}
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}
	
	
	public String executes() throws Exception {
		try {
			if (type == 110) {
				List<Tree> list = new ArrayList<Tree>();
				TreeDao dao = new TreeDao();
				list = dao.select(id);
				ActionContext.getContext().put("list", list);
			} else {
				List<Dh> list = new ArrayList<Dh>();
				DhDao dao = new DhDao();
				list = dao.selects(id);
				if (list.size() > 0) {
					ActionContext.getContext().put("list", list);
				}
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}

	public String indexPage() {
		DhDao dao = new DhDao();
		ActionContext.getContext().put("map", dao.findMap());
		return Action.SUCCESS;
	}

	/*-----------------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
