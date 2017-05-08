package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.TreenrDao;
import entity.HibernateSessionFactory;
import entity.Treenr;

public class TreenrAction implements Action {

	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String execute() throws Exception {
		try {
			List<Treenr> list = new ArrayList<Treenr>();
			TreenrDao dao = new TreenrDao();
			list = dao.select(id);
			if (list.size() > 1) {
				ActionContext.getContext().put("listlie", list);
			} else {
				ActionContext.getContext().put("listdan", list);
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}
}
