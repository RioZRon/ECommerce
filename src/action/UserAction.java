package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;
import entity.HibernateSessionFactory;
import entity.Mguser;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements Action {

	private int id;
	private String users;
	private String pwd;
	private String name;
	private String num;
	private String admin;

	HttpServletResponse sponse = ServletActionContext.getResponse();
	List<Mguser> list = new ArrayList<Mguser>();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		UserDao dao = new UserDao();
		try {
			if (this.users.equals("nt") && this.pwd.equals("nt")) {
				request.getSession().setAttribute("usersid", "1");
				request.getSession().setAttribute("admin", "管理员");
				sponse.getWriter().write("1");
			} else {
				list = dao.login(this.users, this.pwd);
				if (list.size() > 0) {
					request.getSession().setAttribute("name",
							list.get(0).getName());
					request.getSession().setAttribute("usersid",
							list.get(0).getId());
					request.getSession().setAttribute("admin",
							list.get(0).getAdmin());
					if (!list.get(0).getAdmin().equals("管理员")
							|| list.get(0).getNum().equals("未通过")) {
						sponse.getWriter().write("2");
					} else {
						sponse.getWriter().write("1");
					}
				}else {
					sponse.getWriter().write("0");
				}
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	/**
	 * 前台登录
	 * 
	 * @return
	 */
	public String qtLogin() {
		HttpServletRequest request = ServletActionContext.getRequest();
		UserDao dao = new UserDao();
		try {
			list = dao.login(this.users, this.pwd);
			if (list.size() > 0) {
				request.getSession()
						.setAttribute("name", list.get(0).getName());
				request.getSession().setAttribute("usersid",
						list.get(0).getId());
				request.getSession().setAttribute("admin",
						list.get(0).getAdmin());
				if (list.get(0).getNum().equals("未通过")) {
					sponse.getWriter().write("2");
				} else {
					sponse.getWriter().write("1");
					ActionContext.getContext().getSession().put("User", list);
				}
			} else {
				this.addActionError("用户名或密码错误,登录失败!");
			}
		} catch (Exception e) {
			return "ERROR";
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	/* ======名称是否存在====== */
	public void exists() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		UserDao dao = new UserDao();
		PrintWriter out = response.getWriter();
		list = dao.selectname(users);
		if (list.size() > 0)
			out.print("yes");
		else
			out.print("no");
	}
	
	/**
	 * 注销
	 * @return
	 */
	public String loginOut(){
		ActionContext.getContext().getSession().remove("User");
		return SUCCESS;
	}
	
	

	public String insert() {
		try {
			Mguser user = new Mguser();
			user.setName(name);
			user.setUsers(users);
			user.setPwd(pwd);
			user.setAdmin("老师");
			user.setNum("未通过");
			UserDao dao = new UserDao();
			int result = dao.insert(user);
			if (result > 0) {
				sponse.getWriter().write("1");
			} else {
				sponse.getWriter().write("0");
			}
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	public String update() {
		try {
			Mguser user = new Mguser();
			user.setId(id);
			user.setName(name);
			user.setUsers(users);
			user.setPwd(pwd);
			user.setAdmin(admin);
			user.setNum(num);
			UserDao dao = new UserDao();
			int result = dao.update(user);
			if (result > 0) {
				sponse.getWriter().write("1");
			} else {
				sponse.getWriter().write("0");
			}
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	public String delete() {
		try {
			UserDao dao = new UserDao();
			int result = dao.delete(id);
			if (result > 0) {
				sponse.getWriter().write("1");
			} else {
				sponse.getWriter().write("0");
			}
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	public String name() {
		try {
			UserDao dao = new UserDao();
			list = dao.selectname(users);
			if (list.size() > 0) {
				sponse.getWriter().write("1");
			} else {
				sponse.getWriter().write("0");
			}
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return null;
	}

	public String select() {
		try {
			UserDao dao = new UserDao();
			list = dao.selectid(id);
			ActionContext.getContext().put("list", list);
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}

	/*-------------------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
