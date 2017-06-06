package action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.*;

import dao.*;
import entity.*;

public class DhnrAction implements Action {

	private int id;
	private int did;
	private String title;
	private List<Dhnr> dhnrlist = new ArrayList<Dhnr>();

	/**
	 * 根据hid获取相应数据
	 * 
	 * @return
	 */
	public String findDhnrById() {
		try {
			DhnrDao dhnrDao = new DhnrDao();
			dhnrlist = dhnrDao.select(id);
		} catch (Exception e) {
			return Action.ERROR;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return Action.SUCCESS;
	}
	
	
	public String search() throws UnsupportedEncodingException{
		DhnrDao dao = new DhnrDao();
		title=new String(title.getBytes("iso8859-1"),"UTF-8");//编码处理
		dhnrlist = dao.search(title);
		return Action.SUCCESS;
	}
	
	
	public String execute() throws Exception {
		try {
			DhDao dao = new DhDao();
			List<Dh> list = new ArrayList<Dh>();
			list = dao.selecttitle(id);
			ActionContext.getContext().put("id", id);
			if (list.get(0).getType() == 1) {
				// 当前为点击一级目录
				// list1是查出底下所有二级目录
				List<Dh> list1 = new ArrayList<Dh>();
				list1 = dao.select(list.get(0).getId());
				// 判断是否有二级导航
				if (list1.size() > 0) {
					// list2是查出第一个二级导航下是否有三级导航，有即相当于点击了三级导航
					List<Dh> list2 = new ArrayList<Dh>();
					list2 = dao.select(list1.get(0).getId());
					// 判断是否有三级导航
					if (list2.size() > 0) {
						// list3是查出第一个三级导航下是否有四级导航，有即相当于点击了四级导航
						List<Dh> list3 = new ArrayList<Dh>();
						list3 = dao.select(list2.get(0).getId());
						// 判断四级导航是否有内容
						if (list3.size() > 0) {
							dhnr(list3.get(0).getId());
							ActionContext.getContext().put("siname",
									">> " + list3.get(0).getName());
						} else {
							// 四级导航无内容即查询三级导航
							dhnr(list2.get(0).getId());
						}
						ActionContext.getContext().put("sanname",
								">> " + list2.get(0).getName());
						ActionContext.getContext().put("sanurl",
								list2.get(0).getUrl());
					} else {
						// 没有三级导航的话即查询二级导航内容
						dhnr(list1.get(0).getId());
					}
					ActionContext.getContext().put("erurl",
							list1.get(0).getUrl());
					ActionContext.getContext().put("name",
							list1.get(0).getName());
					ActionContext.getContext().put("list", list1);
				}
				// 二级导航也无内容就直接返回
				ActionContext.getContext().put("url", list.get(0).getUrl());
				ActionContext.getContext().put("title", list.get(0).getName());
			} else if (list.get(0).getType() == 2) {
				// list1是查出一级导航内容
				List<Dh> list1 = new ArrayList<Dh>();
				list1 = dao.selecttitle(list.get(0).getPid());
				ActionContext.getContext().put("url", list1.get(0).getUrl());
				ActionContext.getContext().put("title", list1.get(0).getName());
				ActionContext.getContext().put("name", list.get(0).getName());
				ActionContext.getContext().put("erurl", list.get(0).getUrl());
				// list2是查询是否有三级导航
				List<Dh> list2 = new ArrayList<Dh>();
				list2 = dao.select(list.get(0).getId());
				if (list2.size() > 0) {
					// list3是查询是否有四级导航
					List<Dh> list3 = new ArrayList<Dh>();
					list3 = dao.select(list2.get(0).getId());
					if (list3.size() > 0) {
						// 有四级导航即直接查询内容
						dhnr(list3.get(0).getId());
						ActionContext.getContext().put("siname",
								">> " + list3.get(0).getName());
					} else {
						// 无四级导航情况即查询三级导航内容
						dhnr(list2.get(0).getId());
					}
					ActionContext.getContext().put("sanname",
							">> " + list2.get(0).getName());
					ActionContext.getContext().put("sanurl",
							list2.get(0).getUrl());
				} else {
					// 无三级导航直接查询二级导航内容
					dhnr(id);
				}
				// 查出一级导航下所有的二级作为左侧的导航
				List<Dh> list4 = new ArrayList<Dh>();
				list4 = dao.select(list.get(0).getPid());
				ActionContext.getContext().put("list", list4);
			} else if (list.get(0).getType() == 3) {
				// 当前为点击三级导航，根据此三级导航的pid往上查询二级导航
				List<Dh> list1 = new ArrayList<Dh>();
				list1 = dao.selecttitle(list.get(0).getPid());
				// 根据查询出来的二级导航往上查询一级导航
				List<Dh> list2 = new ArrayList<Dh>();
				list2 = dao.selecttitle(list1.get(0).getPid());
				// 查到一级导航后查询所有二级导航
				List<Dh> list3 = new ArrayList<Dh>();
				list3 = dao.select(list2.get(0).getId());
				ActionContext.getContext().put("erurl", list1.get(0).getUrl());
				ActionContext.getContext().put("name", list1.get(0).getName());
				ActionContext.getContext().put("sanname",
						">> " + list.get(0).getName());
				ActionContext.getContext().put("list", list3);
				ActionContext.getContext().put("url", list2.get(0).getUrl());
				ActionContext.getContext().put("title", list2.get(0).getName());
				// 查询被点击的三级导航下是否有四级导航
				List<Dh> list4 = new ArrayList<Dh>();
				list4 = dao.select(list.get(0).getId());
				if (list4.size() > 0) {
					// 有四级导航即便查询四级导航
					dhnr(list4.get(0).getId());
					ActionContext.getContext().put("siname",
							">> " + list4.get(0).getName());
				} else {
					// 无四级导航直接查询三级导航内容
					dhnr(list.get(0).getId());
				}
			} else if (list.get(0).getType() == 4) {
				// 当前为点击四级导航，根据此三级导航的pid往上查询三级导航
				List<Dh> list1 = new ArrayList<Dh>();
				list1 = dao.selecttitle(list.get(0).getPid());
				// 根据查询出来的三级导航往上查询二级导航
				List<Dh> list2 = new ArrayList<Dh>();
				list2 = dao.selecttitle(list1.get(0).getPid());
				// 根据查询出来的二级导航往上查询一级导航
				List<Dh> list3 = new ArrayList<Dh>();
				list3 = dao.selecttitle(list2.get(0).getPid());
				// 查到一级导航后查询所有二级导航
				List<Dh> list4 = new ArrayList<Dh>();
				list4 = dao.select(list3.get(0).getId());
				ActionContext.getContext().put("erurl", list2.get(0).getUrl());
				ActionContext.getContext().put("name", list2.get(0).getName());
				ActionContext.getContext().put("spid", list2.get(0).getPid());
				ActionContext.getContext().put("sanname",
						">> " + list1.get(0).getName());
				ActionContext.getContext().put("list", list4);
				ActionContext.getContext().put("url", list3.get(0).getUrl());
				ActionContext.getContext().put("title", list3.get(0).getName());
				ActionContext.getContext().put("siname",
						">> " + list.get(0).getName());
				// 四级为最后一级导航，所以直接查询内容
				dhnr(list.get(0).getId());
			}
			if (did != 0) {
				DhnrDao dao1 = new DhnrDao();
				List<Dhnr> listdan = new ArrayList<Dhnr>();
				listdan = dao1.selectid(did);
				ActionContext.getContext().put("listdan", listdan);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "ERROR";
		} finally {
			HibernateSessionFactory.getSession().close();
		}
		return Action.SUCCESS;
	}

	public void dhnr(int id) {
		DhnrDao dao = new DhnrDao();
		List<Dhnr> list = new ArrayList<Dhnr>();
		list = dao.select(id);
		if (list.size() > 1) {
			ActionContext.getContext().put("xianggaun", list);
			ActionContext.getContext().put("listlie", list);
		} else {
			ActionContext.getContext().put("listdan", list);
		}
	}

	/*----------------------------*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public List<Dhnr> getDhnrlist() {
		return dhnrlist;
	}

	public void setDhnrlist(List<Dhnr> dhnrlist) {
		this.dhnrlist = dhnrlist;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}

}
