package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.DhDao;
import entity.Dh;

public class HeaderAction implements Action {

	public String execute() throws Exception {
		DhDao dao=new DhDao();
		List<Dh> list=new ArrayList<Dh>();
		list=dao.select(0);
		ActionContext.getContext().put("list", list);
		return Action.SUCCESS;
	}
	
	public String executes(){
		DhDao dao=new DhDao();
		List<Dh> list=new ArrayList<Dh>();
		list=dao.select(0);
		ActionContext.getContext().put("list", list);
		return Action.SUCCESS;
	}

}
