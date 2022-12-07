package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB;

/**
 * Servlet implementation class UpdateusersServlet
 */
@WebServlet("/UpdateusersServlet")
public class UpdateusersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateusersServlet() {
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
		// TODO Auto-generated method stub
		try {
			Connection con;
			con=DB.getConnection();
			int user_id=Integer.parseInt(request.getParameter("id"));
			String fn=request.getParameter("fn");
			String ln=request.getParameter("ln");
			String email=request.getParameter("em");
			PreparedStatement ps;
			   String sql="update users set fname='"+fn+"',lname='"+ln+"',email='"+email+"' where user_id="+user_id+" ";
			   ps=con.prepareStatement(sql);
			   ps.executeUpdate();
			   request.setAttribute("id", null);
			   request.getRequestDispatcher("user.jsp?id=0").forward(request, response); 
			   
			    
		}
		catch(Exception ex)
		{
			
		}
	}

}
