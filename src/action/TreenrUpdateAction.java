package action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import dao.TreenrDao;
import entity.HibernateSessionFactory;
import entity.Treenr;

public class TreenrUpdateAction implements Action {

	private int id;
	private String title;
	private String name;
	private String time;
	private String count;
	private String text;
	private int tid;
	private String encrypt;
	

	public String getEncrypt() {
		return encrypt;
	}


	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}

	HttpServletResponse response = ServletActionContext.getResponse();

	public String execute() throws Exception {
		try {
			Treenr tree = new Treenr();
			tree.setId(id);
			tree.setCount(count);
			tree.setName(name);
			tree.setText(text);
			tree.setTid(tid);
			tree.setTime(time);
			tree.setTitle(title);
			TreenrDao dao = new TreenrDao();
			int result = dao.update(tree);
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


	/*----------------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}
}
