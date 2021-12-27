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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8"); //vietnamese
		PrintWriter out = response.getWriter();
		
		try {
			// account work with database
			Connection conn = new DBContext().getConnection();
			AccountDAO accDAO = new AccountDAO(conn);
			
			request.getSession(true).invalidate();
			// get session , context
			HttpSession session = request.getSession();
			ServletContext context = getServletContext();
			context.setAttribute("cookie", "false");
			//collect data from a login form
			String action = request.getParameter("action");
			String userEmail = request.getParameter("username");
			String password = request.getParameter("password");
			String isUseCookie = request.getParameter("remember");
			
			Account acc = new Account();
			
			acc.setUser(userEmail);
			acc.setPassword(password);
			
			// send  username and pwd to client in order to modify it
			request.setAttribute("username", userEmail);
			request.setAttribute("password", password);
						
			// validate user and password 
			if (!acc.validate()) {
				request.setAttribute("error", acc.getMessage());
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
			}
						
			//check account 
			if (userEmail != null && accDAO.login(userEmail, password)) {
				if (isUseCookie != null)
				if (isUseCookie.equals("true")) {
					// create cookie
					Cookie username = new Cookie("username", userEmail);
					Cookie passwd = new Cookie("password", password);
					
					// set expire time is three day
					username.setMaxAge(60*60*24*3);
					passwd.setMaxAge(60*60*24*3);
					
					// add it to response header and browser can receive it
					response.addCookie(username);
					response.addCookie(passwd);
					
					context.setAttribute("cookie", "true");
				}
				// use session to send information
				session.setAttribute("username", userEmail);
		
				response.sendRedirect("/home");
				conn.close();
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("error", "username or password is incorectly");
				rd.include(request, response);
			}
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			response.getWriter().println(e);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			getServletContext().getRequestDispatcher("/home").forward(request, response);			
		} else if (action.equals("login")) {
			request.setAttribute("username", "");
			request.setAttribute("password", "");
			request.setAttribute("error", "");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
		}
	}

}
