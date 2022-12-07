
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
	   ps=con.prepareStatement("delete from payment where id="+id+";");
	   ps.executeUpdate();
}

%>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
 
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}



#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
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
  <title>details payment</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  
	 <link rel="stylesheet" type = "text/css" href="styles/Login1.css?v=<?php echo time(); ?>" >
	<link rel="stylesheet" type = "text/css" href="styles/Login1.css?v=<?php echo time(); ?>" >
	<link rel="stylesheet" type="text/css" href="styles/footer.css?v=<?php echo time(); ?>">
	<link rel="stylesheet" href="styles/style-NavBar.css">
	
	<style>
	.wrapper{ 
      width: 1005px; 
      
    }
    .wrapper h2 {text-align: center}
    .wrapper form .form-group span {color: red;}
    .box
    {margin-top: -500px;}
  </style>
</head>
<body>

<header>
	 
       <nav>
            <h2 class="logo">Next<span class="head-span"> Transport</span></h2>
             
            <button id="b2" type="button"><a href="Login.jsp">Log out</a></button>
        </nav>
       
 
  
	</header>


 <!-- ----LOGIN---- -->
    <div class="box">
  <main>
    <section class="container wrapper">
      <h2 class="display-4 pt-3">Payments</h2>
      
          
          <form action="DeleteUserServlet" method="POST" >
           <table id="customers">
           <table border = "1px solid black">
           <tr>
           <td>Payment ID</td>
           <td> Name</td>
           <td>Email</td>
           <td>Address</td>
           <td>Telephone</td>
           <td> Method</td>
           <td>Card Number</td>
           <td>CVC</td>
           <td>Expire Date</td>
            <td>Actions</td>
         
           </tr>
           <%
           Connection con=DB.getConnection();
           String sql="select * from payment ;";
           PreparedStatement pst;
           pst=con.prepareStatement(sql);
           ResultSet rst=pst.executeQuery();
           
           while(rst.next())
           {
        	   String id=rst.getString("id");
        	   String fname=rst.getString("name");
        	   
        	   String address=rst.getString("address");
        	   String email=rst.getString("email");
        	   String tp=rst.getString("tp");
        	   String p_method=rst.getString("p_method");
        	   String c_number=rst.getString("c_number");
        	   String cvc=rst.getString("cvc");
        	   String exp_date=rst.getString("exp_date");
        	   
           %>

            <tr>
           <td ><%= id %></td>
           <td><%= fname %></td>
           <td><%= address%></td>
           <td><%= email %></td>
            <td ><%= tp %></td>
           <td><%= p_method %></td>
           <td><%= c_number %></td>
           <td><%= cvc %></td>
           <td><%= exp_date %></td>
           <td><a href="viewpayment.jsp?id=<%= id%>">Delete</a>|<a href="updatepayment.jsp?idu=<%= id%>&fn=<%=fname%>&add=<%= address%>&email=<%= email%>&tp=<%= tp%>&pm=<%= p_method%>&cn=<%= c_number%>&cvc=<%= cvc%>&exp=<%= exp_date%>">Update</a></td>
          
           </tr>
           <%
           }
           
           %>
           </table>
          </form >
         
           
    </section>
  </main>
  </div>
  
  <!--footer-->
	 <footer>
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
        
    </footer>

	 
	
   
</body>
</html>