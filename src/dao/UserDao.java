package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.HibernateSessionFactory;
import entity.Mguser;

public class UserDao {
	@SuppressWarnings("unchecked")
	public List<Mguser> login(String users,String pwd){
		List<Mguser> list=new ArrayList<Mguser>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Mguser where users='" + users+"' and pwd='"+pwd+"'";
		list = session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mguser> select(String hql){
		List<Mguser> list=new ArrayList<Mguser>();
		Session session = HibernateSessionFactory.getSession();
		list = session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mguser> selectname(String users){
		List<Mguser> list=new ArrayList<Mguser>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Mguser where users='"+users+"'";
		list = session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mguser> selectnum(int num){
		List<Mguser> list=new ArrayList<Mguser>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Mguser where num="+num;
		list = session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mguser> selectid(int id){
		List<Mguser> list=new ArrayList<Mguser>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Mguser where id="+id;
		list = session.createQuery(hql).list();
		return list;
	}
	
	public int insert(Mguser user){
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = session.beginTransaction(); 
		int result=0;
		try {
			session.save(user);
			tx.commit();
			result=user.getId();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}
	
	public int update(Mguser user){
		Session session = HibernateSessionFactory.getSession();
		Transaction tx=session.beginTransaction();
		int result=0;
		try {
			session.update(user);
			result=user.getId();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		return result;
	}
	
	public int delete(int id){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql = "delete from Mguser where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	public int count(String hql){
		int result = 0;
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery(hql);
		result = ((Long) query.iterate().next()).intValue();
		return result;
	}
}
