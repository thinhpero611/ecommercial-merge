package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import context.DBContext;
import dao.AccountDAO;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			getServletContext().getRequestDispatcher("/login.jsp?action=signup").forward(request, response);			
		} else if (action.equals("login")) {
			request.setAttribute("username", "");
			request.setAttribute("password", "");
			request.setAttribute("error", "");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8"); //vietnamese
		PrintWriter out = response.getWriter();
		
		request.getSession(true).invalidate();
		// get session , context
		HttpSession session = request.getSession();
		ServletContext context = getServletContext();
		context.setAttribute("cookie", "false");
		try {
			// account work with database
			Connection conn = new DBContext().getConnection();
			AccountDAO accDAO = new AccountDAO(conn);
			
			//collect data from a sign up form
			//String action = request.getParameter("action");
			String userEmail = request.getParameter("username");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatPassword");
			String firstName = request.getParameter("firstname");
			String lastName = request.getParameter("lastname");
			String isUseCookie = request.getParameter("remember");
			
			// send  user name and password to client that user can modify it
			request.setAttribute("username", userEmail);
			request.setAttribute("password", password);
			request.setAttribute("lastname", lastName);
			request.setAttribute("firstname", firstName);
						
			Account acc = new Account();
			
			acc.setUser(userEmail);
			acc.setPassword(password);
			
			// validate user and password 
			if (!acc.validate()) {
				session.setAttribute("error", acc.getMessage());
				getServletContext().getRequestDispatcher("/login.jsp?action=signup").forward(request, response);			
			}
						
			// check password client send are the same
			if (!password.equalsIgnoreCase(repeatPassword)) {
				session.setAttribute("error", "password is not the same");
				getServletContext().getRequestDispatcher("/login.jsp?action=signup").forward(request, response);
			}
			
			// check if user email is exist in database
			if (userEmail != null && accDAO.exist(userEmail)) {
				session.setAttribute("error", "email is already exist!");
				getServletContext().getRequestDispatcher("/login.jsp?action=signup").forward(request, response);
			}
			
			// create new account 
			if (userEmail != null) {
				String username =  firstName + " " + lastName;
				// save it in database
				accDAO.create(userEmail, password, username);
				
				// user want save it in form next time login
				if (isUseCookie != null && isUseCookie.equals("true")) {
					// create cookie
					Cookie usernameC = new Cookie("username", userEmail);
					Cookie passwd = new Cookie("password", password);
					
					// set expire time is three day
					usernameC.setMaxAge(60*60*24*3);
					passwd.setMaxAge(60*60*24*3);
					
					// add it to response header and browser can receive it
					response.addCookie(usernameC);
					response.addCookie(passwd);
					
					context.setAttribute("cookie", "true");
				}
				// use session to send information
				session.setAttribute("username", userEmail);
				response.sendRedirect("/home");
				conn.close();
			} 
		} catch (NullPointerException e) {
			request.setAttribute("error", "some thing went wrong!");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?action=signup");
			rd.forward(request, response);
			e.printStackTrace();
		} catch (SQLException e) {
			request.setAttribute("error", "some thing went wrong!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?action=signup");
			rd.include(request, response);
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
