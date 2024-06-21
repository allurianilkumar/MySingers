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
  <link rel="stylesheet" href="css/events.css">
  <title>MySingers: Events</title>
  </head>
  <body>
  <%
Statement srt=com.mysingers.db.DatabaseObj.getConnect().createStatement();
ResultSet srs=srt.executeQuery("select * from events");
%>
	<%@include file="include/nav_bar.jsp" %>
    <%while(srs.next()){%>
   		  <div class="row events">
	      <div class="jumbotron">
	        <div class="media">
		        <div class="media-left">
		           <a href="#">
		            <img alt="64x64" class="media-object" data-src="holder.js/64x64" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvNjR4NjQKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNTdkY2I2MzYyYyB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE1N2RjYjYzNjJjIj48cmVjdCB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMy40Njg3NSIgeT0iMzYuNSI+NjR4NjQ8L3RleHQ+PC9nPjwvZz48L3N2Zz4=" data-holder-rendered="true" style="width: 64px; height: 64px;">
		           </a>
		        </div>
		        <div class="media-body">
		          <h4 class="media-heading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Event Name :</b> <%=srs.getString(3)%></h4>
		          <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>Event Info :</b> <%=srs.getString(4)%><br>
		          &nbsp;&nbsp;&nbsp;&nbsp;<b>Event Start Date : </b><%=srs.getString(5)%><br>
		          &nbsp;&nbsp;&nbsp;&nbsp;<b>Event End Date :</b> <%=srs.getString(6)%><br>
		          
		          &nbsp;&nbsp;&nbsp;&nbsp;<b>Event Start Date :</b> <%=srs.getString(7)%><br>
		          
		          &nbsp;&nbsp;&nbsp;&nbsp;<b>Event Start Date : </b><%=srs.getString(8)%><br>
		          <h4>&nbsp;&nbsp;&nbsp;&nbsp;Please click for <a href="songs.jsp">Songs</a></h4>
		          </p>
		        </div>
	        </div>
	      </div>
      </div><br>
   	<%}
   	srs.close();
   	srt.close();%>
  </body>
</html>
