package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.HibernateSessionFactory;
import entity.Treenr;

public class TreenrDao {
	
	@SuppressWarnings("unchecked")
	public List<Treenr> select(int id){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Treenr where tid="+id;
		List<Treenr> list=new ArrayList<Treenr>();
		list=session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Treenr> selectid(int id){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Treenr where id="+id;
		List<Treenr> list=new ArrayList<Treenr>();
		list=session.createQuery(hql).list();
		return list;
	}
	
	public int insert(Treenr tree){
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction(); 
		int result=0;
		try {
			session.save(tree);
			tx.commit();
			result=tree.getId();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}
	
	public int update(Treenr tree){
		Session session = HibernateSessionFactory.getSession();
		Transaction tx=session.beginTransaction();
		int result=0;
		try {
			session.update(tree);
			result=tree.getId();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}
	
	//更新点击数
	public int updatecount(int count,int id){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql ="update Treenr t set t.count="+count+" where t.id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	public int delete(int id){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql = "delete from Treenr where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
}
