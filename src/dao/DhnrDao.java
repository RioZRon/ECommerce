package dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.Dhnr;
import entity.HibernateSessionFactory;

public class DhnrDao {
	
	List<Dhnr> list=new ArrayList<Dhnr>();
	@SuppressWarnings("unchecked")
	public List<Dhnr> select(int hid){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dhnr where hid="+hid+" order by time desc";
		list=session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Dhnr> selectid(int id){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dhnr where id="+id;
		list=session.createQuery(hql).list();
		return list;
	}
	
	public int insert(Dhnr dhnr){
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction(); 
		int result=0;
		try {
			session.save(dhnr);
			tx.commit();
			result=dhnr.getId();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}
	
	public int update(Dhnr dhnr,HttpServletRequest request){
		Session session = HibernateSessionFactory.getSession();
		Transaction tx=session.beginTransaction();
		String hql1 = "select text from Dhnr where id=" + dhnr.getId();
		String hql2 = "select img from Dhnr where id=" + dhnr.getId();
		String text = (String) session.createQuery(hql1).uniqueResult();
		String img = (String) session.createQuery(hql2).uniqueResult();
		int result=0;
		try {
			session.update(dhnr);
			result=dhnr.getId();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		if (text != null||img!=null) {
			new FileUtil().deleFile(text, img, dhnr, request);// 删除没用的资源
		}
		return result;
	}
	
	public int deleteid(int id,HttpServletRequest request){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		String hql1 = "from Dhnr where id=" + id;
		Dhnr n = (Dhnr) session.createQuery(hql1).uniqueResult();
		new FileUtil().deleFile(n.getText(), n.getImg(), request);// 删除没用的资源
		int result=0;
		try {
			String hql = "delete from Dhnr where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	public int delete(int hid,HttpServletRequest request){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		String hql1 = "from Dhnr where hid=" + hid;
		ArrayList<Dhnr> nlist = (ArrayList<Dhnr>) session.createQuery(hql1).list();
		for(Dhnr n:nlist){
			new FileUtil().deleFile(n.getText(), n.getImg(), request);// 删除没用的资源
		}
		int result=0;
		try {
			String hql = "delete from Dhnr where hid="+hid;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	//更新点击数
	public int updatecount(int count,int id){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql ="update Dhnr t set t.count="+count+" where t.id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
}
