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
 * Servlet implementation class UpdateContactServlet
 */
@WebServlet("/UpdateContactServlet")
public class UpdateContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateContactServlet() {
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
		try {
			Connection con;
			con=DB.getConnection();
			int id=Integer.parseInt(request.getParameter("id"));
			String n=request.getParameter("n");
			String tp=request.getParameter("tp");
			String email=request.getParameter("em");
			String msg=request.getParameter("msg");
			PreparedStatement ps;
			   String sql="UPDATE `contact` SET `name`='"+n+"',"
			   		+ "`email`='"+email+"',"
			   		+ "`tp`="+tp+","
			   		+ "`msg`='"+msg+"' WHERE contactus_id="+id+" ";
			   ps=con.prepareStatement(sql);
			   ps.executeUpdate();
			   request.setAttribute("id", null);
			   request.getRequestDispatcher("viewcontactus.jsp?id=0").forward(request, response); 
			   
			    
		}
		catch(Exception ex)
		{
			
		}
	}

}
