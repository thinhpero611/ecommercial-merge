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
import dao.AdminDAO;

/**
 * Servlet implementation class Admin
 */
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("username");
			Account acc = new AccountDAO(new DBContext().getConnection()).getAccountInfoByEmail(username);
			// get role of this user
			String role = acc.getRole();
			// check user's role
			if (role == null) {
				request.setAttribute("error", "Sorry you don't have permission!");
				request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
				return;
			} else if (role.equals("admin")) {
				request.setAttribute("listUserG", new AdminDAO().getStatisticUser());
				request.setAttribute("totalProductSale", new AdminDAO().getTotalProductSale());
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			response.getWriter().print(e.getStackTrace());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
