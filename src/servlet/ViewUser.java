package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewUser
 */
@WebServlet("/ViewUser")
public class ViewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tableOutput = listAllRecords();
		request.setAttribute("tableOutput", tableOutput);
		request.getRequestDispatcher("listadmin.jsp").
		forward(request,response);
	}

	String listAllRecords(){
		
		String tableOutput ="";
		try {
			Class.forName("org.sqlite.JDBC");
			String url = "jdbc:sqlite:c:/ss111/dbTCH.db";
			Connection con = DriverManager.getConnection(url);
			
			String sql = "select * from tbluserinfo";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rlt = pstmt.executeQuery();
			
			while(rlt.next()){
				tableOutput+="<tr><td>"+rlt.getInt(1)+"</td>";
				tableOutput+="<td>"+rlt.getString(2)+"</td>";
				tableOutput+="<td>"+rlt.getString(3)+"</td>";
				tableOutput+="<td>"+rlt.getString(4)+"</td>";
				tableOutput+="<td>"+rlt.getString(5)+"</td>";
				tableOutput+="<td>"+rlt.getString(6)+"</td>";
				tableOutput+="<td>"+rlt.getString(7)+"</td>";
				tableOutput+="<td><a href='DeleteUser?p="+rlt.getString(2)+"'><img src='images/icon_delete.png'></a> &nbsp; <a href='UpdateUser?p="+rlt.getInt(1)+"'><img src='images/icon_update.png'></a></td></tr>";
			}
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tableOutput;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
