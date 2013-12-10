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
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p = request.getParameter("p");
		
		if(!(p.equals("update"))){
			
			String form_output = displayForm(p);
			request.setAttribute("form_output",form_output);
			RequestDispatcher rd = request.getRequestDispatcher("updateuser.jsp");
			rd.forward(request, response);
		}
		
		else if(p.equals("update")){
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			String id =  request.getParameter("userid") ;
			String usertype = request.getParameter("usertype");
			String email = request.getParameter("email");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			
			
			//check if there are null values
			if(user.equals("") || pass.equals("")||id.equals("") ||usertype.equals("")||email.equals("")||fname.equals("")||lname.equals("")){
				request.setAttribute("msg","Please fill out all the fields.<br>");
				RequestDispatcher rd = request.getRequestDispatcher("updateuser.jsp");
				rd.forward(request, response);
				return;
			}
			
			else{
				int id2 = Integer.parseInt(id);
				boolean checkUpdate = updateUser(id2, user, pass, usertype, email, lname, fname);
				
				if(checkUpdate){
				request.setAttribute("msg","Your request has been processed..<br>");
				RequestDispatcher rd = request.getRequestDispatcher("updateuser.jsp");
				rd.forward(request, response);
				return;
				}
				
				else{
					request.setAttribute("msg","Invalid ID, First Name, or Last Name<br>");
					RequestDispatcher rd = request.getRequestDispatcher("updateuser.jsp");
					rd.forward(request, response);
					return;
				}
			}
			
		}
	}
	
	boolean updateUser(int id, String username, String password, String usertype, String email, String lastname, String firstname){
		
		boolean update_check=true;

		try {			
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			String sql = "UPDATE tbluserinfo set userid=?, username=?, userpassword=?, usertype=?, uemail=?, ulastname=?, ufirstname=? where userid=?;";
					
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, username);
			pstmt.setString(3, password);
			pstmt.setString(4, usertype);
			pstmt.setString(5, email);
			pstmt.setString(6, lastname);
			pstmt.setString(7, firstname);
			pstmt.setInt(8, id);
		
			int check_sql = pstmt.executeUpdate();
			if(check_sql==0){
				update_check=false;
			}
			
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return update_check;
	}
	
	String displayForm(String p){
		
		String tableOutput ="";
		try {
			Class.forName("org.sqlite.JDBC");
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			
			String sql = "select userid, username, userpassword, uemail, ulastname, ufirstname from tbluserinfo where userid="+p;
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rlt = pstmt.executeQuery();
			
			while(rlt.next()){

				tableOutput+="<div><input type='hidden' name='userid' value='"+rlt.getInt(1)+"'/></div> ";
				tableOutput+="<div><input type='text' name='user' placeholder='User Name' value='"+rlt.getString(2)+"'/></div> ";
				tableOutput+="<div><input type='password' name='pass' placeholder='Password' value='"+rlt.getString(3)+"'/></div>";
				tableOutput+="<div><input type='text' name='email' placeholder='E-Mail' value='"+rlt.getString(4)+"'/></div>";
				tableOutput+="<div><input type='text' name='lname' placeholder='Last Name' value='"+rlt.getString(5)+"'/></div> ";
				tableOutput+="<div><input type='text' name='fname' placeholder='First Name' value='"+rlt.getString(6)+"'/></div>";		
			}
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tableOutput;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
