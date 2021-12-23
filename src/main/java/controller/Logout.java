package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		   Cookie[] cookies = null;
		   // Get an array of Cookies associated with this domain
		   cookies = request.getCookies();
		   if( cookies != null ) {
		      for (Cookie retrievedCookie : cookies){
		            retrievedCookie.setMaxAge(0); // set expire time of this attribute name to 0
		            response.addCookie(retrievedCookie);
		         }
	      }
		  request.getSession().removeAttribute("username");
		  getServletContext().setAttribute("cookie", "false");
		  response.sendRedirect("/ListController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
