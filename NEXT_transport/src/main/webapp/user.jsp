<%@page import="Servlets.UpdateusersServlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- delete user account -->
<%
if(request.getParameter("id")!=null)
{
	   Connection con=DB.getConnection();
	   String id=request.getParameter("id");
	   PreparedStatement ps;
	   ps=con.prepareStatement("delete from users where user_id="+id+";");
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
  <title>user</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	 
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
        <ul>
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="aboutus1.jsp">About</a></li>
            <li><a href="Contact.jsp">Contact Us</a></li>
        </ul>
        <button id="b2" type="button"><a href="Login.jsp">Log out</a></button>
    </nav>
       
 
	</header>


  <!-- BOx details user -->
    <div class="box">
  <main>
    <section class="container wrapper">
      <h2 class="display-4 pt-3">User Details</h2>
          
          <form action="DeleteUserServlet" method="POST">
           <table>
           <tr>
           <td>User ID</td>
           <td>First Name</td>
           <td>Last Name</td>
           <td>User Email</td>
           <td>User Type</td>
           </tr>
           <%
           Connection con=DB.getConnection();
           String sql="select * from users ;";
           PreparedStatement pst;
           pst=con.prepareStatement(sql);
           ResultSet rst=pst.executeQuery();
           
           while(rst.next())
           {
        	   String id=rst.getString("user_id");
        	   String fname=rst.getString("fname");
        	   String lname=rst.getString("lname");
        	   String email=rst.getString("email");
        	   String cat=rst.getString("cat");
           %>

            <tr>
           <td ><%= id %></td>
           <td><%= fname %></td>
           <td><%= lname %></td>
           <td><%= email %></td>
           <td><%= cat %></td>
           <td><a href="user.jsp?id=<%= id%>">Delete</a></td>
           <td><a href="UpdateUser.jsp?idu=<%= id%>&fn=<%= fname%>&ln=<%= lname%>&email=<%= email%>">Update</a></td>
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
        <p>Copyright@ 2022 Next</p>
    </footer>
   
</body>
</html>