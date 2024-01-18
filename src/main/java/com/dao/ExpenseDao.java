package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;

	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean AddExpense(Expense expense) {
		boolean f= false;
		
		try {
			session=factory.openSession();
			tx = session.beginTransaction();
			session.persist(expense);
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
	
	public List<Expense> getExpenseByUserId(User user)
	{
		List<Expense> expenses = new ArrayList<Expense>();
		try {
			session = factory.openSession();
			Query q= session.createQuery("from Expense where user=:us");
			q.setParameter("us", user);
			expenses = q.list();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenses;
	}

}
