package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.Action;

import dao.DhDao;
import dao.DhnrDao;
import entity.Dh;
import entity.Dhnr;
import entity.HibernateSessionFactory;

public class CopyOfUpDhAction implements Action {

	private int id;
	private String name;
	private int pid;
	private String dan;
	private String encrypt;
	private int type;
	private int num;

	HttpServletResponse response = ServletActionContext.getResponse();

	public String execute() throws Exception {
		try {
			response.setContentType("text/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			DhDao dao = new DhDao();
			Dh dh = new Dh();
			dh.setId(id);
			dh.setName(name.trim());
			if (dao.select(id).size() > 0) {
				dh.setIsparent("true");
			} else {
				dh.setIsparent("false");
			}
			dh.setPid(pid);
			dh.setDan(dan);
			dh.setEncrypt(encrypt);
			dh.setUrl("dnr.action?id=" + id);
			dh.setType(type);
			dh.setNum(num);
			int result = dao.update(dh);
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

	// 导航添加子项
	public String insert() {
		try {
			DhDao dao = new DhDao();
			Dh dh = new Dh();
			dh.setName(name.trim());
			dh.setPid(id);
			dh.setDan(dan);
			dh.setEncrypt(encrypt);
			dh.setType(type + 1);
			// dh.setUrl("dan.action?title="+name.trim()+"&pid="+id);
			dh.setIsparent("flase");
			dh.setNum(0);
			int result = dao.insert(dh);
			if (result > 0) {
				dao.updatedh(id);
				dao.upurl(result, "dnr.action?id=" + result);
				Dhnr nr = new Dhnr();
				nr.setTitle(name.trim());
				nr.setHid(result);
				DhnrDao nrdao = new DhnrDao();
				nrdao.insert(nr);
//				nrdao.delete(id);
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

	public String delect() {
		try {
			DhDao dao = new DhDao();
			List<Dh> list = new ArrayList<Dh>();
			int result = dao.delete(id);
			if (result > 0) {
				DhnrDao ndao = new DhnrDao();
//				ndao.delete(id);
				list = dao.select(pid);
				if (list.size() == 0) {

					list = dao.selecttitle(pid);
					if (list.get(0).getPid() != 0) {
						dao.updatedhpid(pid);
						Dhnr nr = new Dhnr();
						nr.setHid(pid);
						nr.setTitle(list.get(0).getName());
						ndao.insert(nr);
					}
				}
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

	/*------------------------*/
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

	public String getEncrypt() {
		return encrypt;
	}

	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}
	
}
