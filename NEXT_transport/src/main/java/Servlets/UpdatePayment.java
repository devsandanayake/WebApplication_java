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
 * Servlet implementation class UpdatePayment
 */
@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePayment() {
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
			   
			   String email=request.getParameter("em");
			   String ad=request.getParameter("ad");
			   String tp=request.getParameter("tp");
			   String me=request.getParameter("me");
			   String cn=request.getParameter("cn");
			   String cvc=request.getParameter("cvc");
			   String ed=request.getParameter("ed");
			PreparedStatement ps;
			   String sql="UPDATE `payment` SET "
			   		+ "`name`='"+n+"',"
			   		+ "`email`='"+email+"',"
			   		+ "`address`='"+ad+"',"
			   		+ "`tp`="+tp+","
			   		+ "`p_method`='"+me+"',"
			   		+ "`c_number`='"+cn+"',"
			   		+ "`cvc`='"+cvc+"',"
			   		+ "`exp_date`='"+ed+"'"
			   		+ " WHERE `id`="+id+"";
			   ps=con.prepareStatement(sql);
			   ps.executeUpdate();
			   request.setAttribute("id", null);
			   request.getRequestDispatcher("viewpayment.jsp?id=0").forward(request, response); 
			   
			    
		}
		catch(Exception ex)
		{
			
		}
	}

}
