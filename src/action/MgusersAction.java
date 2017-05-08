package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import net.sf.json.JSONObject;
import com.opensymphony.xwork2.Action;
import dao.UserDao;
import entity.HibernateSessionFactory;
import entity.Mguser;

public class MgusersAction implements Action {

	private String name="%";
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String execute() throws Exception {
		HttpServletResponse sponse=ServletActionContext.getResponse();
		sponse.setCharacterEncoding("utf-8");
		List<Mguser> list=new ArrayList<Mguser>();
		try {
			StringBuffer hql=new StringBuffer();
			StringBuffer sb=new StringBuffer();
			UserDao dao=new UserDao();
			hql.append("from Mguser");
			sb.append("select count(*)  from Mguser");
			if(!name.equals("%")){
				hql.append(" where name like '%"+name);
				hql.append("%'");
				sb.append(" where name like '%"+name);
				sb.append("%'");
			}
			list=dao.select(hql.toString());
			Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map  
	        jsonMap.put("total",dao.count(sb.toString()));//total键 存放总记录数，必须的  
	        jsonMap.put("rows", list);//rows键 存放每页记录 list  
	        sponse.getWriter().write(JSONObject.fromObject(jsonMap).toString());
		} catch (Exception e) {
			return Action.ERROR;
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

}
