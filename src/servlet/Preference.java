package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Preference
 */
@WebServlet("/Preference")
public class Preference extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Preference() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String theme = request.getParameter("p");
		
		if(theme.equals("red")){
			Cookie red = new Cookie("theme","style.css");
			red.setMaxAge(600);		
			response.addCookie(red);
			RequestDispatcher rd = request.getRequestDispatcher("tch_toc.jsp");
			rd.forward(request, response);
		}
		
		else if(theme.equals("blue")){
			Cookie blue = new Cookie("theme","style2.css");
			blue.setMaxAge(600);		
			response.addCookie(blue);
			RequestDispatcher rd = request.getRequestDispatcher("tch_toc.jsp");
			rd.forward(request, response);
		}

		else if(theme.equals("green")){
			Cookie green = new Cookie("theme","style3.css");
			green.setMaxAge(600);		
			response.addCookie(green);
			RequestDispatcher rd = request.getRequestDispatcher("tch_toc.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
