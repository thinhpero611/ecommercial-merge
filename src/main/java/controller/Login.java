package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

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
			request.getSession(true).invalidate();
			// get session , context
			HttpSession session = request.getSession();
			ServletContext context = getServletContext();
			
			//collect data from a login form
			String action = request.getParameter("action");
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			String isUseCookie = request.getParameter("remember");
			
			
			Account acc = new Account();
			
			acc.setUser(user);
			acc.setPassword(password);
			
			// send  username and pwd to client in order to let user modify it
			request.setAttribute("username", user);
			request.setAttribute("password", password);
			
			// validate user and password 
			if (!acc.validate()) {
				session.setAttribute("error", acc.getMessage());
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
			}
						
			//read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			
			//check account 
			if (user != null && password.equals(pwd) && user.equalsIgnoreCase(uid)) {
				if (isUseCookie != null)
				if (isUseCookie.equals("true")) {
					// create cookie
					Cookie username = new Cookie("username", user);
					Cookie passwd = new Cookie("password", password);
					
					// set expire time is two hours
					username.setMaxAge(60*60*2);
					passwd.setMaxAge(60*60*2);
					
					// add it to response header and browser can receive it
					response.addCookie(username);
					response.addCookie(passwd);
					
					context.setAttribute("cookie", "true");
					response.sendRedirect("/admin/index.jsp");
					return;
				}
				// use session to send information
				context.setAttribute("cookie", "false");
				session.setAttribute("username", user);
				response.sendRedirect("/admin/index.jsp");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				session.setAttribute("error", "username or password is incorectly");
				rd.include(request, response);
			}
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			response.getWriter().println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);			
		} else if (action.equals("login")) {
			request.setAttribute("username", "");
			request.setAttribute("password", "");
			request.setAttribute("error", "");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
		}
	}

}
