package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p = request.getParameter("p");

		
		if(!(p.equals("delete"))){
			request.setAttribute("username",p);
			RequestDispatcher rd = request.getRequestDispatcher("deleteuser.jsp");
			rd.forward(request, response);
		}
		
		else if(p.equals("delete")){
			String user = request.getParameter("username");
				//check if there are null values
			if(user.equals("")){
				request.setAttribute("msg","Please fill out all the fields.<br>");
				RequestDispatcher rd = request.getRequestDispatcher("deleteuser.jsp");
				rd.forward(request, response);
				return;
			}
			
			else{
				boolean checkDelete = deleteUser(user);
				
				if(checkDelete){
				request.setAttribute("msg","You have successfully deleted this user.<br>");
				RequestDispatcher rd = request.getRequestDispatcher("deleteuser.jsp");
				rd.forward(request, response);
				return;
				}
				
				else{
					request.setAttribute("msg","Username does not exist.<br>");
					RequestDispatcher rd = request.getRequestDispatcher("deleteuser.jsp");
					rd.forward(request, response);
					return;
				}
			}
			
		}
		
	}
	
	boolean deleteUser(String user){
		boolean check=true;
		
		try {	
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			con.setAutoCommit(false);
			String sql = "DELETE from tbluserinfo where username=?;";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			
			
			int check_sql = pstmt.executeUpdate();
			if(check_sql==0){
				check=false;
			}
			
			else{
			con.commit();
			}
			pstmt.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
