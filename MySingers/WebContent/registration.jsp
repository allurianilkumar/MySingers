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
  <link rel="stylesheet" href="css/registration.css">
  <title>MySingers: Home</title>
  </head>
  <body>
    <div class="">
     <%@include file="include/nav_bar.jsp" %>
    </div>
	<section class="registration-section">
  <div class="registration_form">
  <div class="row">
    <div class="col-md-6">
    <h2>Fill your details for registration</h2><hr>
      <form class="form-horizontal" id="registration_form" action="Register" method="post">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-4 control-label">User</label>
          <div class="col-sm-6">
            <input type="text" name="user_name" class="form-control" placeholder="User Name">
          </div>
        </div>
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-4 control-label">Email</label>
          <div class="col-sm-6">
            <input type="email" name="user_email" class="form-control" placeholder="Email">
          </div>
        </div>
          <div class="form-group">
          <label for="inputEmail3" class="col-sm-4 control-label">Mobile</label>
          <div class="col-sm-6">
            <input type="textbox" name="mobile" class="form-control" placeholder="Mobile Number">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
          <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Password">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-4 control-label">User Type</label>
          <div class="col-sm-6">
			<label class="radio-inline">
			  <input type="radio" name="user_type" id="user_type" value="Singer" checked> Singer
			</label>
			<label class="radio-inline">
			  <input type="radio" name="user_type" id="user_type" value="User"> User
			</label>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-10">
            <input type="submit" name="user_registration_submit" class="btn btn-success" value="Register">
            <input type="reset" name="register_cancel" class="btn btn-default" value="Cancel">
          </div>
        </div>
      </form>
    </div>
    <div class="col-md-4">
    </div>
    </div>

  </div>
  </section>
   <%@include file="include/footer.jsp" %>
  </body>
</html>
