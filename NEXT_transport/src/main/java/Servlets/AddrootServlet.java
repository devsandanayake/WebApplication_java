 package Servlets;

import java.io.IOException;



import java.sql.Connection;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import DB.DB;
import DB.DatabaseHelper;
import Model.RootModel;

/**
 * Servlet implementation class AddpostServlet
 */
@WebServlet("/AddrootServlet")
@MultipartConfig(maxFileSize = 16177215)
public class AddrootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddrootServlet() {
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
		
		 
			 	
		  
		    
			String name=request.getParameter("Y_L");
			String type=request.getParameter("D_L");
			String cat=request.getParameter("V_T");
			String man=request.getParameter("C_N");
			int qty=Integer.parseInt(request.getParameter("Pase"));
			int id=Integer.parseInt(request.getParameter("Cus_ID"));
			 
		 
			//validating required fields
			if(name.equals(""))
			{
			String errorMessage="Cannot Be Blank";
			request.setAttribute("msgg", errorMessage);
			request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else if(type.equals(""))
			{
				String errorMessage="Cannot Be Blank";
				request.setAttribute("msgg", errorMessage);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else if(cat.equals(""))
			{
				String errorMessage="Cannot Be Blank";
				request.setAttribute("msgg", errorMessage);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else if(man.equals(""))
			{
				String errorMessage="Cannot Be Blank";
				request.setAttribute("msggr", errorMessage);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else if(Integer.toString(qty).equals(""))
			{
				String errorMessage="Cannot Be Blank";
				request.setAttribute("msgg", errorMessage);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else if(Integer.toString(id).equals(""))
			{
				String errorMessage="Cannot Be Blank";
				request.setAttribute("msgg", errorMessage);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			 
			else
			{
				try 
				{   Connection con=DB.getConnection();
					RootModel root=new RootModel(name, type, cat,man,qty,id);
					DatabaseHelper helper;
					
					helper = new DatabaseHelper(con);
					if(helper.rootdetails(root))
					{
						String errorMessage = "Successfull";
						request.setAttribute("msgg", errorMessage);
					    request.getRequestDispatcher("payment.jsp").forward(request, response); 	
					}
					else
					{
						String errorMessage = "Successfull";
						request.setAttribute("msgg", errorMessage);
					    request.getRequestDispatcher("payment.jsp").forward(request, response); 	
					}
				}
				catch(Exception ex)
				{
					
				}
				
			}
			
			}	
			
		}
			 