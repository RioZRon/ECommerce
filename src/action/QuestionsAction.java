package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import dao.DhnrDao;
import dao.QuestionsDao;
import entity.Questions;

public class QuestionsAction implements Action {

	private int pageNumber =1;// 页数
	private int pageSize =10;// 页面大小
	private String hnid;// 内容id
	private String did;// 内容的did
	private Questions questions;
	private QuestionsDao dao = new QuestionsDao();
	private ArrayList<Questions> qlist = new ArrayList<Questions>();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String execute() throws Exception {
		response.setCharacterEncoding("utf-8");
		request.setAttribute("hnid", hnid);
		request.getRequestDispatcher("mg/addtest.jsp").forward(request,
				response);
		return null;
	}

	public String showQuestions() {
		response.setCharacterEncoding("utf-8");
		qlist = (ArrayList<Questions>) dao
				.findByHid(hnid, pageSize, pageNumber);
		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("dhnr") || name.equals("subject")) {// 解析json时候过滤掉这两个字段
					return true;
				} else {
					return false;
				}
			}
		});
		try {
			Map<String, Object> jsonMap = new HashMap<String, Object>();// 定义map
			int i=dao.count(hnid);
			jsonMap.put("total", i);// total键 存放总记录数，必须的
			jsonMap.put("rows", qlist);// rows键 存放每页记录 list
			response.getWriter().write(
					JSONObject.fromObject(jsonMap, cfg).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//页面显示对应的试题
	public String showQuestionsList() {
		qlist = (ArrayList<Questions>) dao.findByHid(hnid, did);
		return "qlist";
	}
	
	
	
//删除
	public String delete() {
		try {
			int flag = dao.delete(questions.getId());
			response.getWriter().write(Integer.toString(flag));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String update() {
		try {
			dao.update(questions);
			response.getWriter().write("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String insert() {
		try {
			int flag = dao.insert(questions);
			if(flag>0){
				new DhnrDao().update(questions.getDhnr().getId());
			}
			response.getWriter().write(Integer.toString(flag));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// **********************************************************************

	public String getHnid() {
		return hnid;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setHnid(String hnid) {
		this.hnid = hnid;
	}

	public QuestionsDao getDao() {
		return dao;
	}

	public void setDao(QuestionsDao dao) {
		this.dao = dao;
	}

	public ArrayList<Questions> getQlist() {
		return qlist;
	}

	public void setQlist(ArrayList<Questions> qlist) {
		this.qlist = qlist;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public Questions getQuestions() {
		return questions;
	}

	public void setQuestions(Questions questions) {
		this.questions = questions;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

}
