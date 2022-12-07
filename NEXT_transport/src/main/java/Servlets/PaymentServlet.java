package Servlets;

import java.io.IOException;


import java.sql.Connection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DB.DB;
import DB.DatabaseHelper;
import Model.PaymentModel;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
	
	String name=request.getParameter("FullName");
	String email=request.getParameter("Email");
	String a1=request.getParameter("Address1");
	String a2=request.getParameter("Address2");
	int tp=Integer.parseInt(request.getParameter("Number"));
	String pmeth=request.getParameter("pay");
	String cnum=request.getParameter("cNumber");
	String cvc=request.getParameter("CVC");
	String date=request.getParameter("acdate");
		
	try
	{
		Connection con=DB.getConnection();
		PaymentModel payment=new PaymentModel(name, email, a1, a2, tp, pmeth, cnum, cvc, date);
		DatabaseHelper helper;
		helper=new DatabaseHelper(con);
		helper.pay(payment);
		
			String errorMessage = "S";
			request.setAttribute("err", errorMessage);
		    request.getRequestDispatcher("Payment.jsp").forward(request, response); 
		   
		
		
		  
		
		
		
	}
	catch(Exception ex)
	{
		  String errorMessage = "Error";
			request.setAttribute("err", errorMessage);
		    request.getRequestDispatcher("Payment.jsp").forward(request, response); 
	}
	
	}

}
