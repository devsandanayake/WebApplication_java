package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB;
import DB.DatabaseHelper;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
       
        Connection con;
		try {
			String cat="";
			con = DB.getConnection();
			 String email = request.getParameter("username");
		        String pass = request.getParameter("password");
		        DatabaseHelper user=new DatabaseHelper(con);
		        if(user.checkuser(email, pass))
		        {
		        	String sql="select  * from users where email=? and password=?";
		        	PreparedStatement ps=(PreparedStatement) con.prepareStatement(sql);
		        	ps.setString(1, email);
			         ps.setString(2, pass);
			         ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				 cat=rs.getString("cat");   
			   }
			   if(cat.equals("User"))
			   {
				   response.sendRedirect("Home.jsp");  
				   System.out.println("sucess");
			   }
			   else if(cat.equals("Driver"))
			   {
				   response.sendRedirect("Drivers.jsp"); 
			   }
			   else {
				   response.sendRedirect("Admin.jsp"); 
			   }
		        }
		        else
		        {
		        	    String errorMessage = "Username or Password is Wrong";
					    request.setAttribute("RegError", errorMessage);
					    request.getRequestDispatcher("Login.jsp").forward(request, response); 
		        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}

}
