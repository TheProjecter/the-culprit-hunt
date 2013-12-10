package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveUserPassword
 */
@WebServlet("/SaveUserPassword")
public class SaveUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUserPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p = request.getParameter("p");
		
		if(!(p.equals("save"))){
			RequestDispatcher rd = request.getRequestDispatcher("changepassword.jsp");
			rd.forward(request, response);
		}
		
		else if(p.equals("save")){
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
	
			
			//check if there are null values
			if(user.equals("") || pass.equals("")){
				request.setAttribute("msg","Please fill out all the fields.<br>");
				RequestDispatcher rd = request.getRequestDispatcher("changepassword.jsp");
				rd.forward(request, response);
				return;
			}
			
			else{
				boolean checkUpdate = savePassword(user, pass);
				
				if(checkUpdate){
				request.setAttribute("msg","Your request has been processed..<br>");
				RequestDispatcher rd = request.getRequestDispatcher("changepassword.jsp");
				rd.forward(request, response);
				return;
				}
				
				else{
					request.setAttribute("msg","Invalid Username<br>");
					RequestDispatcher rd = request.getRequestDispatcher("changepassword.jsp");
					rd.forward(request, response);
					return;
				}
			}
			
		}
	}
	
boolean savePassword(String username, String password){
		
		boolean update_check=true;
		
		try {	
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			con.setAutoCommit(false);
			String sql = "UPDATE tbluserinfo set userpassword=? where "+
			"username=?;";
					
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, username);
			
		
			int check_sql = pstmt.executeUpdate();
			if(check_sql==0){
				update_check=false;
			}
			
			else{
			con.commit();
			}
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return update_check;
	}

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
