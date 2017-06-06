/*     */ package dao;
/*     */ 
/*     */ import entity.HibernateSessionFactory;
/*     */ import entity.Questions;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import org.hibernate.HibernateException;
/*     */ import org.hibernate.Query;
/*     */ import org.hibernate.SQLQuery;
/*     */ import org.hibernate.Session;
/*     */ import org.hibernate.Transaction;
/*     */ 
/*     */ public class QuestionsDao
/*     */ {
/*     */   public List<Questions> findByHid(String hnid, int pageSize, int pageNumber)
/*     */   {
/*  21 */     Session session = HibernateSessionFactory.getSession();
/*  22 */     String sql = "select top " + pageSize + "* from [Dzsw].[dbo].questions where  id not in(select top " + pageSize * (pageNumber - 1) + " id from [Dzsw].[dbo].questions where hnid=" + 
/*  23 */       hnid + " order by sequence) and hnid=" + hnid + "order by sequence";
/*  24 */     ArrayList<Questions> list = null;
/*     */     try
/*     */     {
/*  26 */       list = (ArrayList)session.createSQLQuery(sql)
/*  27 */         .addEntity(Questions.class).list();
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/*  29 */       e.printStackTrace();
/*     */     }
/*  31 */     return list;
/*     */   }
/*     */   
/*     */   public List<Questions> findByHid(String hnid, String did)
/*     */   {
/*  36 */     Session session = HibernateSessionFactory.getSession();
/*  37 */     ArrayList<Questions> list = null;
/*     */     try
/*     */     {
/*  40 */       if (did.equals("0"))
/*     */       {
/*  41 */         String sql = "select * from [Dzsw].[dbo].Questions where hnid=(select id from [Dzsw].[dbo].dhnr where hid=" + hnid + ")order by sequence";
/*  42 */         list = (ArrayList)session.createSQLQuery(sql)
/*  43 */           .addEntity(Questions.class).list();
/*     */       }
/*     */       else
/*     */       {
/*  45 */         String sql = "select * from [Dzsw].[dbo].questions where hnid=" + did + " order by sequence";
/*  46 */         list = (ArrayList)session.createSQLQuery(sql)
/*  47 */           .addEntity(Questions.class).list();
/*     */       }
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/*  50 */       e.printStackTrace();
/*     */     }
/*  52 */     return list;
/*     */   }
/*     */   
/*     */   public int delete(int id)
/*     */   {
/*  58 */     Session session = HibernateSessionFactory.getSession();
/*  59 */     Transaction transaction = session.beginTransaction();
/*  60 */     String hql = "delete from Questions where id=" + id;
/*  61 */     int i = 0;
/*     */     try
/*     */     {
/*  63 */       i = session.createQuery(hql).executeUpdate();
/*  64 */       transaction.commit();
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/*  66 */       transaction.rollback();
/*  67 */       e.printStackTrace();
/*     */     }
/*  69 */     return i;
/*     */   }
/*     */   
/*     */   public int deleteByhid(int hnid)
/*     */   {
/*  73 */     Session session = HibernateSessionFactory.getSession();
/*  74 */     Transaction transaction = session.beginTransaction();
/*  75 */     String sql = "delete from [Dzsw].[dbo].Questions where hnid=(select id from [Dzsw].[dbo].Dhnr where hid=" + hnid + ")";
/*  76 */     int i = 0;
/*     */     try
/*     */     {
/*  78 */       i = session.createSQLQuery(sql).executeUpdate();
/*  79 */       transaction.commit();
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/*  81 */       transaction.rollback();
/*  82 */       e.printStackTrace();
/*     */     }
/*  84 */     return i;
/*     */   }
/*     */   
/*     */   public int update(Questions q)
/*     */   {
/*  89 */     Session session = HibernateSessionFactory.getSession();
/*  90 */     Transaction transaction = session.beginTransaction();
/*     */     try
/*     */     {
/*  92 */       q = (Questions)session.merge(q);
/*  93 */       session.update("id", q);
/*  94 */       transaction.commit();
/*  95 */       return 1;
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/*  97 */       transaction.rollback();
/*  98 */       e.printStackTrace();
/*     */     }
/*  99 */     return 0;
/*     */   }
/*     */   
/*     */   public int insert(Questions q)
/*     */   {
/* 105 */     Session session = HibernateSessionFactory.getSession();
/* 106 */     Transaction transaction = session.beginTransaction();
/*     */     try
/*     */     {
/* 108 */       session.save(q);
/* 109 */       transaction.commit();
/* 110 */       return 1;
/*     */     }
/*     */     catch (HibernateException e)
/*     */     {
/* 112 */       transaction.rollback();
/* 113 */       e.printStackTrace();
/*     */     }
/* 114 */     return 0;
/*     */   }
/*     */   
/*     */   public int count(String hnid)
/*     */   {
/* 119 */     Session session = HibernateSessionFactory.getSession();
/* 120 */     String hql = "select count(*) from Questions where hnid=" + hnid;
/* 121 */     int i = Integer.parseInt(session.createQuery(hql).uniqueResult().toString());
/* 122 */     return i;
/*     */   }
/*     */ }


/* Location:           C:\Users\Administrator\Desktop\
 * Qualified Name:     dao.QuestionsDao
 * JD-Core Version:    0.7.0.1
 */