package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
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
			ServletContext context = getServletContext();
			
			int id = Integer.valueOf(request.getParameter("id"));
			
			String action = request.getParameter("action");
			String page = request.getParameter("page");
			Cart cart = (Cart)context.getAttribute("cart");
			
			if (action != null && action.equalsIgnoreCase("add")) {
				if (cart == null) {
					cart = new Cart();
				}
				Product product = new ListProductDAO().getProduct("" + id);
				// set initial quantity is 1
				product.setNumber(1);
				cart.add(product);
				context.setAttribute("cart", cart);
				
				response.sendRedirect("/ListController?page=" + ((page == null || page == "") ? 1 : page));
			} else if (action != null && action.equalsIgnoreCase("update")) {
				int quantityOrder = Integer.valueOf(request.getParameter("quantityOrder"));
				cart.getItem(id).setNumber(quantityOrder);
				response.sendRedirect("cart.jsp");
			}
			else if (action != null && action.equalsIgnoreCase("delete")) {
				cart.remove(id);
				response.sendRedirect("cart.jsp");
			} 
		} catch (Exception e) {
			response.getWriter().println(e);
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
