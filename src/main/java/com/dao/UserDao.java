package com.dao;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.entity.User;

public class UserDao {

	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean registerUser(User u) {
		boolean f = false;
		
		try {
			session=factory.openSession();
			tx = session.beginTransaction();
			session.persist(u);
			tx.commit();
			f=true;
		} catch (Exception e) {
			if(tx!=null) {
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
	
	public User loginUser(String email, String password) {
		User u = null;
		session=factory.openSession();
		
		Query q = session.createQuery("from User where email=:em and password=:pw");
		q.setParameter("em", email);
		q.setParameter("pw",password);
		
		u = (User) q.uniqueResult();
		return u;
	}
	
	
}
