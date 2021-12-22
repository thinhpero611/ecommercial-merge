package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListProductDAO;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession session = request.getSession(true);
			int id = Integer.valueOf(request.getParameter("id"));
			String action = request.getParameter("action");
			Cart cart = (Cart)session.getAttribute("cart");
			if (action != null && action.equalsIgnoreCase("add")) {
				if (cart == null) {
					cart = new Cart();
				}
				Product product = new ListProductDAO().getProduct("" + id);
				product.setNumber(1);
				cart.add(product);
			} else if (action != null && action.equalsIgnoreCase("delete")) {
				cart.remove(id);
			}
			response.sendRedirect("cart.jsp");
		} catch (Exception e) {
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
