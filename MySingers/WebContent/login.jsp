<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/login.css">
  <title>MySingers: Login</title>
  </head>
  <body>
    <div class="">
      <%@include file="include/nav_bar.jsp" %>
    </div>
	<section class="login-section">
	<div class="row">
	  <div class="col-md-6">
	  <div class="login-form">
	  <h5></h5>
	    <h2>Login </h2>
	    <form action="Login" name="login" method="post" onsubmit="return logFun()" class="form-horizontal" id="login_form">
	    <div class="form-group">
	      <label for="email" class="col-sm-2 control-label">Email</label>
	      <div class="col-sm-6">
	        <input type="text" name="email" class="form-control"/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="password" class="col-sm-2 control-label">Password</label>
	      <div class="col-sm-6">
	        <input type="password" name="password" class="form-control"/>
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-6">
	        <input type="submit" name="login_submit" class="btn btn-success" value="Login">
	        <input type="reset" class="btn btn-default" onclick="" value="Cancel"/>
	      </div>
	    </div>
	    </form>
	  </div>
	  <label>If youd don't have account please register <a href="registration.jsp">Sign Up</a></label></div>
	  <div>
	</div>
	</div>
	</section>
	<%@include file="include/footer.jsp" %>
  </body>
</html>
