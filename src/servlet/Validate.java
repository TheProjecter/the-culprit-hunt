package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pass = request.getParameter("password");
		
		
		//check if there is null input
		if(user.equals("") || pass.equals("")){
			request.setAttribute("msg","Invalid login<br>");
			RequestDispatcher rd = request.getRequestDispatcher("tch_index.jsp");
			rd.forward(request, response);
			return;
		}
		

		//validation
		else{
			boolean check=validateAcc(user, pass);
			if(check){
				request.setAttribute("msg","Incorrect username/password.<br>");
				RequestDispatcher rd = request.getRequestDispatcher("tch_index.jsp");
				rd.forward(request, response);
			}
			else{
				boolean ifAdmin= checkifAdmin(user,pass);
				
				//if user is validated, check if admin
				
				if(ifAdmin==true){
				HttpSession s1 = request.getSession();
				s1.setMaxInactiveInterval(600);	
				
				Cookie cookie_user = new Cookie("user",user);
				cookie_user.setMaxAge(600);	
				
				Cookie cookie_password = new Cookie("pass",pass);
				cookie_password.setMaxAge(600);
				
				Cookie type = new Cookie("type","admin");
				type.setMaxAge(600);	
				
				response.addCookie(cookie_user);
				response.addCookie(cookie_password);
				response.addCookie(type);

				String page = lastView(user);
				System.out.println(page);
				if(page.equals("")){
				RequestDispatcher rd = request.getRequestDispatcher("tch_home.jsp");
				rd.forward(request, response);
				
				}
				
				else{
					RequestDispatcher rd = request.getRequestDispatcher(page);
					rd.forward(request, response);
				}
				}

				else{
					boolean ifRegular= checkifRegular(user,pass);
					
					if(ifRegular==true){
						HttpSession s2 = request.getSession();
						s2.setMaxInactiveInterval(600);
						
						Cookie cookie_user = new Cookie("user",user);
						cookie_user.setMaxAge(600);	
						
						Cookie cookie_password = new Cookie("pass",pass);
						cookie_password.setMaxAge(600);	
						
						Cookie type = new Cookie("type","regular");
						type.setMaxAge(600);	
						
						response.addCookie(cookie_user);
						response.addCookie(cookie_password);
						response.addCookie(type);
						
						String page = lastView(user);
						
						if(page.equals("")){
							RequestDispatcher rd = request.getRequestDispatcher("tch_home.jsp");
							rd.forward(request, response);
							
						}
						
						else{
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
						}
						
					}
					
					else{
					RequestDispatcher rd = request.getRequestDispatcher("tch_home.jsp");
					rd.forward(request, response);
					}
				}
			}
			
		}
				
	}
	
	//check admin function	
	boolean checkifAdmin(String username, String password){
		boolean admin = false;
		
		try {	
			
				Class.forName("org.sqlite.JDBC");			
				String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
				Connection con = DriverManager.getConnection(url);
				String sql = "select username, userpassword from tbluserinfo where username=='"+username+"'and userpassword=='"+password+"' and usertype=='admin'";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rlt = pstmt.executeQuery();
				
				while(rlt.next()){
					admin=true;
				}
				pstmt.close();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return admin;
		}
	
	//check User
	boolean checkifRegular(String username, String password){
		boolean user = false;
		
		try {	
			
				Class.forName("org.sqlite.JDBC");			
				String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
				Connection con = DriverManager.getConnection(url);
				String sql = "select username, userpassword from tbluserinfo where username=='"+username+"'and userpassword=='"+password+"' and usertype=='regular'";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rlt = pstmt.executeQuery();
				
				while(rlt.next()){
					user=true;
				}
				pstmt.close();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return user;
		}
	
	//account validation
	boolean validateAcc(String username, String password){
		boolean empty = true;
		
	try {	
		
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			String sql = "select username, userpassword from tbluserinfo where username=='"+username+"'and userpassword=='"+password+"'";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rlt = pstmt.executeQuery();
			
			
			while(rlt.next()){
				empty=false;
			}
			pstmt.close();
			
			if(empty){
				empty=true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return empty;
	}

	String lastView(String username){
		String page="";
		String id="";
		
		
	try {	
		
			Class.forName("org.sqlite.JDBC");			
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			String sql = "select page, id from tbluserstatus where username=='"+username+"' ORDER BY id DESC LIMIT 1;";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rlt = pstmt.executeQuery();
			
			
			while(rlt.next()){
				page+=rlt.getString(1);
				id+=rlt.getString(2);
			}
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return page;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
