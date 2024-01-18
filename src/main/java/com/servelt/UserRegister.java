package com.servelt;

import java.io.IOException;

import org.hibernate.SessionFactory;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		
		User user = new User(name,email,password,about);
		System.out.println(user);
		
		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = userDao.registerUser(user);
		
		HttpSession session = req.getSession();
		if(f)
		{
			session.setAttribute("OnSuccess", "register success");
			System.out.println("register success");
			resp.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("OnFail", "register fail");
			System.out.println("somthing wrong on server");
			resp.sendRedirect("register.jsp");
		}
		
		
		
	}
	

}
