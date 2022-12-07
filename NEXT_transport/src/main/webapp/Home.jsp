<!DOCTYPE html>
<html>

<head>

<title>Next Transport</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  
	 
	<link rel="stylesheet" type="text/css" href="styles/footer.css?v=<?php echo time(); ?>">
	 
	    <link rel="stylesheet" href="styles/style-NavBar.css">
	 <link rel="stylesheet" href="styles/home.css">
	
	 

</head>
     


<body>
<header>
		 
		
		    <nav>
            <h2 class="logo">Next<span class="head-span"> Transport</span></h2>
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="aboutus.jsp">About</a></li>
                <li><a href="Contact.jsp">Contact Us</a></li>
            </ul>
            <button id="b2" type="button"><a href="Login.jsp">Log out</a></button>
        </nav>
 
  
	</header>
  
   <div class = "msg">  
          
 <% 
			String message = (String) request.getAttribute("msgg");
			%>                  
			<%
			if (message == null) {
			%>
			<div class="besideemailbox" style="color: red"></div>
			<%
			} else if(message.trim().equals("Seccessfully Added"))
			{%>
				<div class="besideemailbox" style="color: green"><%= message %></div>
			
				<% } else  {
			%>
			<div class="besideemailbox" style="color: red"><%= message %></div>
			<%
			}
			%>
			 </div>
 
            
    
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>Next</h3>
                        <p>Fill in the data below.</p>
                        <form class="requires-validation" method="POST" action="AddrootServlet" novalidate>

                            <div class="col-md-12">
                               <input class="form-control" type="text" name="Y_L" placeholder="Your Location" required>
                                
                            </div>

                            <div class="col-md-12">
                                <input class="form-control" type="text" name="D_L" placeholder="Drop Location" required>
                                  
                            </div>

                           <div class="col-md-12">
                                <select class="form-select mt-3" name="V_T"required>
                                      <option selected disabled value="">Vehicle Type</option>
                                      <option value="Car">Car</option>
                                      <option value="Van">Van</option>
                                      <option value="Three Wheel">Three Wheel</option>
                               </select>
                                
                           </div>
                           <div class="col-md-12">
                              <input class="form-control" type="text" name="C_N" placeholder="Contact Number" required>
                                
                           </div>

                           <div class="col-md-12">
                              <input class="form-control" type="text" name="Pase" placeholder="Passenger" required>
                                
                           </div>
                            <div class="col-md-12">
                              <input class="form-control" type="text" name="Cus_ID" placeholder="Customer ID" required>
                                
                           </div>

 
                           <div class="form-button mt-3">
                                <button id="submit" type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
 

<!--footer starts here-->
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
 
 
 
 