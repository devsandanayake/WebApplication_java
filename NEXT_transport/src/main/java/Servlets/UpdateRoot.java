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
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateRoot")
public class UpdateRoot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoot() {
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
			   String id=request.getParameter("id");
			   String n=request.getParameter("n");
			   String ad=request.getParameter("em");
			   String email=request.getParameter("ad");
			   String tp=request.getParameter("tp");
			   int me=Integer.parseInt(request.getParameter("me"));
			   int cn=Integer.parseInt(request.getParameter("cn"));
			
			PreparedStatement ps;
			   String sql="UPDATE `location`"
			   		+ " SET `You_L`='"+n+"',`D_L`='"+ad+"',`V_T`='"+email+"',`Con_Num`='"+tp+"',`Pase`="+me+",`Cus_ID`="+cn+" WHERE L_id="+id+"";
			   ps=con.prepareStatement(sql);
			   ps.executeUpdate();
			   request.setAttribute("id", null);
			   request.getRequestDispatcher("viewroot.jsp?id=0").forward(request, response); 
			   
			    
		}
		catch(Exception ex)
		{
			
		}
	}

}
