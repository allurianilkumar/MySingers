<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/home.css">
  <title>My Singers: Home</title>
  </head>
  <body>
	<%@include file="include/nav_bar.jsp" %>
      <div class="jumbotron">
        <p>This is the information about the a user can upload a songs from this website.</p>
        <div class="row">
        <div class="col-md-2"><div class="alert alert-warning" role="alert">Login&nbsp;&nbsp;<span>---->></span></div></div>
        <div class="col-md-2"><div class="alert alert-info" role="alert">Songs List&nbsp;&nbsp;<span>---->></span></div></div>
        <div class="col-md-2"><div class="alert alert-success" role="alert">Events List</div></div>
        </div>        
      </div>
	<%@include file="include/footer.jsp" %>
  </body>
</html>
