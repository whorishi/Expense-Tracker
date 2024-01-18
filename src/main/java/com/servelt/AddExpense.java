package com.servelt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/add_expense")
public class AddExpense extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String amount = req.getParameter("amount");
		String description = req.getParameter("description");
		
		HttpSession session = req.getSession();
		User user  = (User) session.getAttribute("userObj");
		
		Expense expense = new Expense(title,date,amount,description,user);
		
		ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean f = dao.AddExpense(expense);
		
		
		
		if(f==true)
		{
			session.setAttribute("ExpenseSuccess", "expense Added Successfully");
			resp.sendRedirect("user/add_expense.jsp");
		}
		else {
			session.setAttribute("ExpenseFail", "expense not added");
			resp.sendRedirect("user/add_expense.jsp");
		}
	
		
	}
	
}
