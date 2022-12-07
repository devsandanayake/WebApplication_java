<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Next Transport-contact us</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type = "text/css" href="styles/Contact.css?v=<?php echo time(); ?>" >
	  <link rel="stylesheet" href="styles/style-NavBar.css">
 <link rel="stylesheet" type="text/css" href="styles/footer.css?v=<?php echo time(); ?>">
</head>
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
	

    <div class="box">
    	   <div class="container">
        <header>
            <h1 align="Center">Contact Us</h1>
        </header>
        <div class="content">
            <div class="content-form">
                <section>
                    <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
                    <h2>address</h2>
                    <p>
                        No 87, <br>
                        Ward Place. <br>
                        Colombo,Sri lanka.
                    </p>
                </section>

                <section>
                    <i class="fa fa-phone fa-2x" aria-hidden="true"></i>
                    <h2>Phone</h2>
                    <p>+94-112-222-222</p>
					<p>Monday-Friday</p>
					<p>08.00AM-05.30PM</p>
                </section>

                <section>
                    <i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
                    <h2>E-mail</h2>
                    <h3>Customer Support</h3>
					<p>nextcustomersupport@gmail.com</p>
					<h3>Technical Support</h3>
					<p>nexttechnicalsupport@gmail.com</p>
                </section>
            </div>
        </div>

      <form class="form-contact" method="post" action="ContactusServlet">
        <div class="form">
            <div class="right">
              <div class="contact-form">
                  <input type="text" name="contact1" required>
                  <span>Full Name</span>
              </div>
  
              <div class="contact-form">
                  <input type="E-mail" name="contact2" required>
                  <span>E-mail Id</span>
              </div>
			  <div class="contact-form">
                  <input type="text" name="contact3"required>
                  <span>Mobile Number</span>
              </div>
              <div class="contact-form">
                  <textarea type="text" name="contact4">
                    
                  </textarea>
                  <span> Type your Message....</span>
              </div>
  
              <div class="contact-form">
                  <input type="submit" value="Submit">
                  <%
                  String err=(String)request.getAttribute("err");
                 %>
                 <%if(err==null){ %>
                 <%}else if(err.equals("Successfull")){ %>
                 <div class="besideemailbox" style="color: green"><%= err %></div>
                 <%}else{ %>
                 <div class="besideemailbox" style="color: red">Error</div>
                 <%} %>
              </div>
              </div>
            </div>
          </div>
    </form>
        <div class="media">
            <li><a href="https://www.facebook.com/"><i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i></a></li>
            <li><a href="https://www.instagram.com/accounts/login/"><i class="fa fa-instagram fa-2x" aria-hidden="true"></i></a></li>
            <li><a href="https://twitter.com/login?lang=en"><i class="fa fa-twitter-square fa-2x" aria-hidden="true"></a></i></li>
        </div>
         


  

 
</body>
</html>