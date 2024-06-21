<%@page import="com.mysingers.db.DatabaseObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/home.css">
  <title>My Singers: About Us</title>
  </head>
  <body>
      <%@include file="include/nav_bar.jsp" %>
      <% Statement statement=DatabaseObj.getConnect().createStatement();%>
      <div class="row">
      	<div class="col-md-6">
      	<h3 class="text-center">Upload a Song</h3>
      	<form class="form-horizontal" id="upload_song" action="UploadSong" method="post" ENCTYPE="multipart/form-data">
      		<div class="form-group">
		        <label for="inputEmail3" class="col-sm-4 control-label">Event Name</label>
				<div class="col-sm-6">
	                <select class="form-control" name="event_name" id="event_name">
	                <%ResultSet eventName=statement.executeQuery("select * from events"); %>
	                     <option value="">Please Select Event Name</option>
	                     <%while(eventName.next()){%>
	                     	<option value="<%=eventName.getString(1)%>"><%=eventName.getString(3)%></option>
	                     <%} %>
	                 </select>
		          </div>
	          </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Song File</label>
	          <div class="col-sm-6">
	            <input type="file" name="song_name" placeholder="upload file" class="form-control" id="upload" required>
	          </div>
	        </div>
	        <div class="form-group">
	          <div class="col-sm-offset-4 col-sm-10">
	            <input type="submit" name="upload_submit" class="btn btn-success" value="Upload">
	            <input type="reset" name="upload_cancel" class="btn btn-default" value="Cancel">
	          </div>
	          </div>
	        </div>
	      </form>
      	</div>
      </div>
	<%@include file="include/footer.jsp" %>
  </body>
</html>
