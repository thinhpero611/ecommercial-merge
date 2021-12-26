package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import context.DBContext;
import dao.AccountDAO;

/**
 * Servlet implementation class Account
 */
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/hmlt;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession();
			
			// get Data Access Object to interact to account table 
			AccountDAO accDao = new AccountDAO(new DBContext().getConnection());
			// collect all data browser had sending to our server
			String currentMail = (String)session.getAttribute("username");
			String newMail = request.getParameter("mail");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String age = request.getParameter("age");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String action = request.getParameter("action");
			
			if (action == null) {
				request.getRequestDispatcher("/home").forward(request, response);
				return;
			} else if (action.equals("get")){
				session.setAttribute("account", accDao.getAccountInfoByEmail(currentMail));
				response.sendRedirect("/accountInfo.jsp");
			}
			
			else if (action.equals("update")) {
				Account acc = new Account();
				acc.setUser(newMail);
				acc.setAddress(address);
				acc.setPassword(password);
				
				if (!acc.validate()) {
					request.setAttribute("error", acc.getMessage());
					request.getRequestDispatcher("accountInfo.jsp").forward(request, response);
					return;
				}
				//update information
				accDao.updateInformationByEmail(currentMail, newMail, name, password, age, address, phone);
				// set this new email to this session
				session.setAttribute("username", newMail);
				//send update information to user
				session.setAttribute("account", accDao.getAccountInfoByEmail(newMail));
				response.sendRedirect("/accountInfo.jsp");
			}
		} catch (SQLException e) {
			response.getWriter().println(e);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
