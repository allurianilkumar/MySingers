<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/home.css">
  <title>MySingers: Songs</title>
  </head>
  <body>
	<%@include file="include/nav_bar.jsp" %>
	  <%
Statement srt=com.mysingers.db.DatabaseObj.getConnect().createStatement();
ResultSet events=srt.executeQuery("select * from events");

%>

<%while(events.next()){%>
      <div class="row songs">
      	<div class="col-md-8">
      	<div class="jumbotron">
        <h4 class="text-center"><%=events.getString(3) %></h4>
		<%	Statement eventStmt=com.mysingers.db.DatabaseObj.getConnect().createStatement();
			int value = events.getInt(1);
			ResultSet songs=eventStmt.executeQuery("select * from songs where S_EVENT_ID="+value);
			
		%>
		<%while(songs.next()){ %>
		<%
		Statement userStmt=com.mysingers.db.DatabaseObj.getConnect().createStatement();
		
		%>       
        <ul class="list-group">
		  <li class="list-group-item">
		    <span id="linkes" class="badge">Likes : <%=songs.getInt(5) %></span>
		   <br>
		   <hr>
		   <% if(session.getAttribute("UserType") != null){ %>
			   <%if(session.getAttribute("UserType").toString().trim().equals("Singer")){ %>
	   				<audio controls>
			  		<source src="horse.ogg" type="audio/ogg">
			  		<source src='file/<%=songs.getString(4) %>' type="audio/mpeg">
			  		Your browser does not support the audio element.
					</audio><br>
					<a href="Like?<%=songs.getString(1)%>,<%=songs.getString(2)%>,<%=songs.getString(3)%>">Like</a>
			   <% }else{
			   		if(session.getAttribute("UserType").toString().trim().equals("User")){ %>
			   		<audio controls>
			  		<source src="horse.ogg" type="audio/ogg">
			  		<source src='file/<%=songs.getString(4) %>' type="audio/mpeg">
			  		Your browser does not support the audio element.
					</audio><br>
					<a href="Like?<%=songs.getString(1)%>,<%=songs.getString(2)%>,<%=songs.getString(3)%>">Like</a>
		     		<% }else{ %>
		     			<a href="" data-toggle="modal" data-target="#mySongAlert"><%=songs.getString(4) %></a>
		     		<% } %>
			   <% } %>
	   	 	<% }else{ %>
		     	<a href="" data-toggle="modal" data-target="#mySongAlert"><%=songs.getString(4) %></a>
	 		<% } %>
		  </li>
		</ul>
		<%}
		songs.close();%>
		<!-- Model -->
<div id="mySongAlert" class="modal fade" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content"  style="background-image: url('img/burger1.jpg')">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Warning!!!</h4>
      </div>
      <div class="modal-body">
   		<div class="alert alert-danger" role="alert">
		  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		  <span class="sr-only">Error:</span>
		  Please like a song after login details. <a href="login.jsp">login</a>
		</div>		
      </div>
      <div class="modal-footer">
      </div>
    </div>

  </div>
</div>
<!-- End Model-->
      </div>
      	</div>
      </div>
   <%}%>
  </body>
</html>
