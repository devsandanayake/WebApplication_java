 package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DB;
import DB.DatabaseHelper;

import Model.UserModel;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		Connection con;
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String cat=request.getParameter("cat");
		//validations
	
		if(fname.equals(""))
		{
		    String errorMessage = "First Name Cannot Be Blank";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		  
		}
		else if(lname.equals(""))
		{
		    String errorMessage = "Last Name Cannot Be Blank";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		}
		else if(email.equals(""))
		{
		    String errorMessage = "Email Cannot Be Blank";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		}
		else if(password.equals(""))
		{
		    String errorMessage = "Password Cannot Be Blank";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		}
		else if(cpassword.equals(""))
		{
		    String errorMessage = "Confirm Password Cannot Be Blank";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		}
		else if(!cpassword.equals(password))
		{
		    String errorMessage = "Confirm Password and Password Must Be Same ";
		    request.setAttribute("RegError", errorMessage);
		    request.getRequestDispatcher("Login.jsp").forward(request, response);  
		}
		else
		{
			try {
				 con=DB.getConnection();
		         Statement st = con.createStatement();
		         String sq="select * from users where email='"+email+"'";
		         ResultSet rst = st.executeQuery(sq);
		         rst.next();
		         
		         //Make Object
		         UserModel user=new UserModel(fname,lname,email,password,cat);
		         
		         //Make Helper
		         DatabaseHelper helper;
		         
		         
				if(rst.getRow()>0)
				{
					
					    String errorMessage = "User Email Already Available ";
					    request.setAttribute("RegError", errorMessage);
					    request.getRequestDispatcher("Login.jsp").forward(request, response); 
				}
				else
				{
					helper = new DatabaseHelper(con);
					helper.saveUser(user);
					
					response.sendRedirect("Login.jsp");
					
					
					
						  
					
					
				}
			}
			catch (Exception e) {
				System.out.println(e);
				  String errorMessage = "Error";
				    HttpSession regSession = request.getSession();
				    regSession.setAttribute("RegError", errorMessage);
				    response.sendRedirect("Login.jsp");
			}
		}
		
	}

}
