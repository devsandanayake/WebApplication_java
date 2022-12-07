
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
	   ps=con.prepareStatement("delete from users where user_id="+id+";");
	   ps.executeUpdate();
}

%>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update</title>
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
        <ul>
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="aboutus1.jsp">About</a></li>
            <li><a href="Contact.jsp">Contact Us</a></li>
        </ul>
        <button id="b2" type="button"><a href="Login.jsp">Log out</a></button>
    </nav>
  
	</header>


 <!-- ----LOGIN---- -->
    <div class="box">
  <main>
    <section class="container wrapper">
      <h2 class="display-4 pt-3">Update User</h2>
          <%
if(request.getParameter("idu")!=null )
{
	   Connection con=DB.getConnection();
	   String id=request.getParameter("idu");
	   String n=request.getParameter("fn");
	   String email=request.getParameter("email");
	   String ad=request.getParameter("add");
	   String tp=request.getParameter("tp");
	   String me=request.getParameter("pm");
	   String cn=request.getParameter("cn");
	   String cvc=request.getParameter("cvc");
	   String ed=request.getParameter("exp");
	   
	 
	   
%>
          <form action="UpdatePayment" method="POST">
          <table>
                <tr><td>Payment ID</td><td><input type="text" name="id" value="<%=id %>" readonly="readonly"></td></tr>
                <tr><td> Name</td><td><input type="text" value="<%=n %>"  name="n" ></td></tr>
                <tr><td>Address</td><td><input type="text" value="<%=email %>" name="em" ></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%=ad %>" name="ad" ></td></tr>
                <tr><td>Telephone</td><td><input type="text" value="<%=tp %>" name="tp" ></td></tr>
                <tr><td>Method</td><td><input type="text" value="<%=me %>" name="me" ></td></tr>
                <tr><td>Card No</td><td><input type="text" value="<%=cn %>" name="cn" ></td></tr>
                <tr><td>CVC</td><td><input type="text" value="<%=cvc%>" name="cvc" ></td></tr>
                <tr><td>Exp. Date</td><td><input type="text" value="<%=ed %>" name="ed" ></td></tr>
               
                
                
          </table>
          <input type="submit" value="Update">
          </form >
         <%} %>
           
          
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
	
  <script>
	// slideshow
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>