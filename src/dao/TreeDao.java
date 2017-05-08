package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.HibernateSessionFactory;
import entity.Tree;

public class TreeDao {
	@SuppressWarnings("unchecked")
	public List<Tree> select(int id){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Tree t where pid="+id+" order by t.num,t.name";
		List<Tree> list=new ArrayList<Tree>();
		list=session.createQuery(hql).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tree> selecttitle(String title){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Tree where name='"+title+"'";
		List<Tree> list=new ArrayList<Tree>();
		list=session.createQuery(hql).list();
		return list;
	}
	
	public int insert(Tree tree){
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
	
	public int update(int id,String name,String dan,int num){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql = "update Tree set name='"+name+"',dan='"+dan+"',num='"+num+"' where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	//新增成功后加入链接
	public int updateurl(int id,String url){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql = "update Tree set url='"+url+"' where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	//新增子项后给父项设置isparent
	public int updatepar(int id){
		Session session = HibernateSessionFactory.getSession();
		Transaction trans=session.beginTransaction();
		int result=0;
		try {
			String hql = "update Tree set isparent='true' where id="+id;
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
			String hql = "delete from Tree where id="+id;
			result=session.createQuery(hql).executeUpdate();
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		}
		return result;
	}
	
	//删除子项后给父项设置isparent
		public int updateispar(int id){
			Session session = HibernateSessionFactory.getSession();
			Transaction trans=session.beginTransaction();
			int result=0;
			try {
				String hql = "update Tree set isparent='false' where id="+id;
				result=session.createQuery(hql).executeUpdate();
				trans.commit();
			} catch (Exception e) {
				trans.rollback();
			}
			return result;
		}
	
	
}
