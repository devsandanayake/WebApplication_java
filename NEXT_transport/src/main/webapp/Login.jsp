 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style-login.css">
    <link rel="stylesheet" href="styles/style-NavBar.css">
    <script src="https://kit.fontawesome.com/5af028ba90.js" crossorigin="anonymous"></script>
    <title>Login</title>
    
   
</head>
<body>

<header>
     
       
            <h2 class="logo">Next<span class="head-span"> Transport</span></h2>
             
	</header>
	
 <!-- ----LOGIN---- -->
   
  
      <div class="hero">
       

        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" class="toggle-btn" onclick="login()">Log In</button>
                <button type="button" class="toggle-btn" onclick="register()">Register</button>
            </div>
            <div class="social-icons">
                <i class="fa-brands fa-facebook fa-2x"></i>
                <i class="fa-brands fa-twitter fa-2x"></i>
                <i class="fa-brands fa-google fa-2x"></i>
            </div>
            <form id="loginID" class="input-group" action = "LoginServlet" method = "POST">
                <input type="text" class="input-field" placeholder="Username" name="username"required>
                <input type="password" class="input-field" placeholder="Password" name="password"required>
                <input type="checkbox" class="check-box"><span class="log-span">Remeber Me</span>
                <button type="submit" class="submit-btn">Login</button>
                   

            </form>
            <!-- Registeration form -->
            <form id="registerID" action="RegisterServlet" method = "POST"class="input-group">
           
            
                <input type="text" class="input-field" placeholder="First Name" name="fname"  required>
                <input type="text" class="input-field" placeholder="Last Name" name="lname" required>
                <input type="email" class="input-field" placeholder="Email" name="email" required>
                <input type="password" class="input-field" placeholder="Password" name="password" required>
                <input type="password" class="input-field" placeholder="Confirm-Password" name="cpassword" required>
                
                <label>Type of user:</label>
                  <select name= "cat" >
                    <option value="User">User</option>
                    <option value="Driver">Driver</option> 
                   </select></br>
                 
                 
                <input type="checkbox" class="check-box"><span class="log-span">I agree to the terms & conditions</span>
                <button type="submit" class="submit-btn">Register</button>
                
             
                 
            </form>
          
            
        </div>
        <div class = "msg">
          <%    
             String messag = (String) request.getAttribute("RegError");
			%>
			<%
			if (messag == null) {
			%>
			<div class="besideemailbox" style="color: red"></div>
			<%
			} else if (messag.equals("Confirm Password and Password Must Be Same ")) {
				%>
				<div class="besideemailbox" style="color: green">Passwords
					Doesn't Match</div>
				<%
				} else  {
			%>
			<div class="besideemailbox" style="color: red"><%= messag %></div>
			<%
			}
			%>
               </div>
    </div>
    <!-- java script for login button  -->
    <script>
        var x = document.getElementById("loginID");
        var y = document.getElementById("registerID");
        var z = document.getElementById("btn");

        function register() {
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }

        function login() {
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0px";
        }
    </script>
 
	
   
</body>
</html>