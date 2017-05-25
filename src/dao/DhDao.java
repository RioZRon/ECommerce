package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.*;

public class DhDao {

	@SuppressWarnings("unchecked")
	public List<Dh> findAll() {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh";
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}

	public Map<String, Dh> findMap() {
		List<Dh> list = this.findAll();
		Map<String, Dh> map = new HashMap<String, Dh>();
		for (Dh dh : list) {
			map.put(dh.getName(), dh);
		}
		return map;
	}

	public List<Dh> showDSPX(){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where pid=39";
		List<Dh> list=session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Dh> select(int id) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where pid=" + id + " order by num";
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Dh> selects(int id) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where pid=" + id + " and type!=3 order by num";
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Dh> selecttitle(int id) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where id=" + id;
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Dh> selectid(String title, int pid) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where name='" + title + "' and pid=" + pid;
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}

	// 自动查导航
	@SuppressWarnings("unchecked")
	public List<Dh> head(String title, int pid) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Dh where name='" + title + "' and pid=" + pid;
		List<Dh> list = new ArrayList<Dh>();
		list = session.createQuery(hql).list();
		return list;
	}

	public int update(Dh dh) {
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction();
		int result = 0;
		try {
			session.update(dh);
			result = dh.getId();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}

	// 修改导航排序
	public int uppx(int id, int num) {
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		int result = 0;
		try {
			String hql = "update Dh d set d.num=" + num + " where d.id=" + id;
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}

	// 修改链接
	public int upurl(int id, String url) {
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		int result = 0;
		try {
			String hql = "update Dh d set d.url='" + url + "' where d.id=" + id;
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}

	public int insert(Dh dh) {
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction();
		int result = 0;
		try {
			session.save(dh);
			tx.commit();
			result = dh.getId();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}

	// 将有子项的导航设置为父项
	public int updatedh(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		int result = 0;
		try {
			String hql = "update Dh d set d.isparent='true' where d.id=" + id;
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}

	// 将没有子项的导航设置为子项
	public int updatedhpid(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		int result = 0;
		try {
			String hql = "update Dh d set d.isparent='false' where d.id=" + id;
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}


	public int delete(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		int result = 0;
		try {
			String hql = "delete from Dh where id=" + id;
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}

}
