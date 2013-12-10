package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String usertype = request.getParameter("usertype");
		String email = request.getParameter("email");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		
		//check if there is null input
		if(user.equals("") || pass.equals("") ||usertype.equals("")||email.equals("")||fname.equals("")||lname.equals("")){
			request.setAttribute("msg","Please fill out all the fields.<br>");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
			return;
		}
		
		else{
			
			//passing date to method
			Register(user, pass, usertype, email, lname, fname);
			request.setAttribute("msg","Thank you. <br>Your request has been successfully processed.<br>");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
			
		}
		
	}
	
	//To insert data to database
	void Register(String username, String password, String usertype, String email, String lastname, String firstname){
		try {	
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			String sql = "insert into tbluserinfo values("+
			"null,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, usertype);
			pstmt.setString(4, email);
			pstmt.setString(5, lastname);
			pstmt.setString(6, firstname);
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
