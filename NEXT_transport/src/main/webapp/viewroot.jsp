
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
if(request.getParameter("id")!=null)
{
	   Connection con=DB.getConnection();
	   String id=request.getParameter("id");
	   PreparedStatement ps;
	   ps=con.prepareStatement("delete from location where L_id="+id+";");
	   ps.executeUpdate();
}

%>

<%
if(request.getParameter("idu")!=null )
{
	   Connection con=DB.getConnection();
	   String id=request.getParameter("idu");
	   String fn=request.getParameter("fn");
	   String ln=request.getParameter("ln");
	   String email=request.getParameter("email");
	   
	   PreparedStatement ps;
	   String sql="update users set fname='"+fn+"',lname='"+ln+"',email='"+email+"' where user_id="+id+" ";
	   ps=con.prepareStatement(sql);
	   ps.executeUpdate();%>
	   <a><%=fn %></a>
<% }%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>root</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type = "text/css" href="styles/aboutus.css?v=<?php echo time(); ?>" >
	<link rel="stylesheet" type = "text/css" href="styles/Main.css?v=<?php echo time(); ?>" >
	<link rel="stylesheet" type = "text/css" href="styles/Login.css?v=<?php echo time(); ?>" >
	<link rel="stylesheet" type="text/css" href="styles/footer.css?v=<?php echo time(); ?>">
	<link rel="stylesheet" href="styles/style-NavBar.css">
	
	
	<style>
	.wrapper{ 
      width: 500px; 
      padding: 20px; 
    }
    .wrapper h2 {text-align: center}
    .wrapper form .form-group span {color: red;}
  </style>
</head>
<body>

<header>
		 
       
    
       <nav>
            <h2 class="logo">Next<span class="head-span"> Transport</span></h2>
             
            <button id="b2" type="button"><a href="Login.jsp">Log out</a></button>
        </nav>
       
  
	</header>



    <div class="box">
  <main>
    <section class="container wrapper">
      <h2 class="display-4 pt-3">Root Details</h2>
          
          <form action="DeleteUserServlet" method="POST">
           <table>
           <tr>
           <td>ID</td>
           <td>Customer Location</td>
           <td>Drop Location</td>
           <td>Vehicle Type</td>
           <td>Contact Number</td>
           <td>Passenger</td>
           <td>Customer_ID</td>
           
          
           </tr>
           <%
           Connection con=DB.getConnection();
           String sql="select * from location ;";
           PreparedStatement pst;
           pst=con.prepareStatement(sql);
           ResultSet rst=pst.executeQuery();
           
           while(rst.next())
           {
        	   String id=rst.getString("L_id");
        	   String fname=rst.getString("You_L");
        	   String address=rst.getString("D_L");
        	   String email=rst.getString("V_T");
        	   String tp=rst.getString("Con_Num");
        	   String p_method=rst.getString("Pase");
        	   String c_number=rst.getString("Cus_ID");
        	   
        	   
           %>

            <tr>
           <td ><%= id %></td>
           <td><%= fname %></td>
           <td><%= address %></td>
           <td><%= email %></td>
            <td ><%= tp %></td>
           <td><%= p_method %></td>
           <td><%= c_number %></td>
            
          
           <td><a href="viewroot.jsp?id=<%= id%>">Delete</a></td>
           <td><a href="updateroot.jsp?idu=<%= id%>&fn=<%=fname%>&email=<%= email%>&add=<%= address%>&tp=<%= tp%>&pm=<%= p_method%>&cn=<%= c_number%>">Update</a></td>
           </tr>
           <%
           }
           
           %>
           </table>
          </form >
         
           
    </section>
  </main>
  </div>
  
  <!--footer--> <footer>
        <div class="more">
            <h5>More</h5>
            <a href="Contact.html">Contact us</a>
            <a href="aboutus.html">About us</a>
            <a href="#">Site map</a>
            <a href="#">FAQ</a>
            <a href="#">Terms and conditions</a>
        </div>
        <div class="apps">
            <h5>Download our app</h5>
            <a href="#"><img class="android" src="images/footer/android.png" alt=""></a>
            <a href="#"><img class="apple" src="images/footer/apple.png" alt=""></a>
        </div>
        <div class="social">
            <h5>Our social media</h5>
            <a href="https://www.facebook.com/"><img class="fb" src="images/footer/fb.png" alt=""></a>
            <a href="https://www.instagram.com/"><img class="insta" src="images/footer/insta.png" alt=""></a>
            <a href="https://www.twitter.com/"><img class="twitter" src="images/footer/twitter.png" alt=""></a>
            <a href="https://www.youtube.com/"><img class="utube" src="images/footer/icons8-youtube-100.png" alt=""></a>
            <a href="https://www.linkedin.com/"><img class="linkedin" src="images/footer/icons8-linkedin-24.png" alt=""></a>
            <a href="https://www.reddit.com/login/"><img class="reddit" src="images/footer/redit.png" alt=""></a>
        </div>
        <p>Copyright@ 2022 Next</p>
    </footer>
	 
  
</body>
</html>