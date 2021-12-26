package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import context.DBContext;
import dao.AccountDAO;
import dao.OrdersDAO;
import model.Cart;
import model.Orders;

/**
 * Servlet implementation class Payment
 */
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			ServletContext context = getServletContext();
			// get data in session storage
			Cart cart = (Cart) context .getAttribute("cart");
			String userMail = (String)session.getAttribute("username");
			
			// get all data in request parameter
			String discount = request.getParameter("discount");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			response.getWriter().println(address + phoneNumber);
			
			session.setAttribute("address", address);
			session.setAttribute("phoneNumber", phoneNumber);
			
			//update information of user
			AccountDAO accountDao = new AccountDAO(new DBContext().getConnection());
			accountDao.updateInformationByEmail(userMail, address, phoneNumber);
			
			Orders orders = new Orders(userMail, 2, discount, address, phoneNumber, null);
			// create date for this order
			long millis=System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);  
			orders.setOrderDate(date);
			
			// set list Product Orders
			orders.setLp(cart);
			
			// if cart is null then create new one
			if (cart == null) {
				cart = new Cart();
			}
			// save this order into database
			OrdersDAO orderDao = new OrdersDAO();
			orderDao.insertOrder(orders, cart);
			orderDao.insertOrderDetail(orders);
			
			cart.clear();
			response.sendRedirect("/home");
			
		} catch (Exception e) {
			response.getWriter().println(e);
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
