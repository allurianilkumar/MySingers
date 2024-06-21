<%@page import="com.mysingers.db.DatabaseObj"%>
<%@page import="java.sql.*"%>
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
 <title>My Singers: Home</title>
 </head>
  <body>
	 <%@ include file="/include/nav_bar.jsp" %>
     <div class="container">

<!-------->
<div id="content">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li class="active"><a href="#create_event" data-toggle="tab">Create Event</a></li>
        <li><a href="#create_coordinator" data-toggle="tab">Create Co-ordinator</a></li>
        <li><a href="#assign_coordinator" data-toggle="tab">Assign Co-Ordinator to Event</a></li>
        <li><a href="#allusers" data-toggle="tab">Users</a></li>
        <li><a href="#winners" data-toggle="tab">Winners</a></li>
    </ul>
    <div id="my-tab-content" class="tab-content">
        <div class="tab-pane active" id="create_event">
	      <h2 class="text-center">Create a Event</h2><hr>      
	      <form class="form-horizontal" id="create_event_form" action="CreateEvent" method="post">
	      
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Event Name</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_name" class="form-control" placeholder="Event Name">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Event Info</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_info" class="form-control" placeholder="Event Info">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Event Start Date</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_start_date" class="form-control" placeholder="Event Start Date (Ex: DD-MM-YYYY)">
	          </div>
	        </div>
	          <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Event End Date</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_end_date" class="form-control" placeholder="Event Ending Date (Ex: DD-MM-YYYY)">
	          </div>
	        </div>
	        
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Mobile</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_mobile" class="form-control" placeholder="Event Info">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Email</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_email" class="form-control" placeholder="Email">
	          </div>
	        </div>
	        
	        <div class="form-group">
	          <div class="col-sm-offset-4 col-sm-10">
	            <input type="submit" name="create_event_submit" class="btn btn-success" value="Create Event">
	            <input type="reset" name="create_event_cancel" class="btn btn-default" value="Cancel">
	          </div>
	        </div>
	      </form>

        </div> <!-- this is for event -->
        
        <div class="tab-pane" id="create_coordinator">
          <h2 class="text-center">Create a Event Co-ordinator</h2><hr>      
	      <form class="form-horizontal" id="create_event_form" action="CreateEventCoOrdinator" method="post">
	      
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Name</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_co_name" class="form-control" placeholder="Co-ordinator Name">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Mobile</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_co_mobile" class="form-control" placeholder="Event Info">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Email</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_co_email" class="form-control" placeholder="Email">
	          </div>
	        </div>
          	<div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Password</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_co_password" class="form-control" placeholder="Password">
	          </div>
	        </div>
			<div class="form-group">
	          <label for="inputPassword3" class="col-sm-4 control-label">Gender</label>
	          <div class="col-sm-6">
				<label class="radio-inline">
				  <input type="radio" name="event_co_gender" id="event_co_gender" value="M" checked> Male
				</label>
				<label class="radio-inline">
				  <input type="radio" name="event_co_gender" id="event_co_gender" value="F"> Female
				</label>
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Date Of Birth</label>
	          <div class="col-sm-6">
	            <input type="text" name="event_co_dob" class="form-control" placeholder="Date Of Birth(DD-MM-YYYY)">
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Address</label>
	          <div class="col-sm-6">
	            <textarea id="info" type="text" name="event_co_address" class="form-control"  placeholder="Address" rows="5" id="comment"></textarea>
	          </div>
	        </div>
	        
	        <div class="form-group">
	          <div class="col-sm-offset-4 col-sm-10">
	            <input type="submit" name="create_event_co_submit" class="btn btn-success" value="Create Co-ordinator">
	            <input type="reset" name="create_event_co_cancel" class="btn btn-default" value="Cancel">
	          </div>
	        </div>
	        
	      </form>
        </div>
        <div class="tab-pane" id="assign_coordinator">
          <h2 class="text-center">Assgin the Co-ordinator to Event by the Administrator</h2><hr>      
	      <form class="form-horizontal" id="create_event_form" action="AssignEventCoOrdinator" method="post">
	      
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Co-Ordinator Name</label>
	          <div class="col-sm-6">
	          <% 
	          	 Statement statement=DatabaseObj.getConnect().createStatement();
	          %>
	          <select class="form-control" name="co_ordinator_name" id="co_ordinator_name">
	          <%ResultSet coOrdinatorName=statement.executeQuery("select * from admin");%>
                <option value="">Please Select Co-Ordinator Name</option>
                <%
               	while(coOrdinatorName.next()){ %>
               		<option value="<%=coOrdinatorName.getString(1)%>"><%=coOrdinatorName.getString(2)%></option>
                <%} %>
                </select>
	          </div>
	        </div>
			<%coOrdinatorName.close();%>
	        <div class="form-group">
	          <label for="inputEmail3" class="col-sm-4 control-label">Event Name</label>
	          <div class="col-sm-6">
                <select class="form-control" name="co_event_name" id="event_name">
                <%ResultSet eventName=statement.executeQuery("select * from events"); %>
                     <option value="">Please Select Event Name</option>
                     <%while(eventName.next()){%>
                     	<option value="<%=eventName.getString(1)%>"><%=eventName.getString(3)%></option>
                     <%} %>
                 </select>
	          </div>
	        </div>
	        <%
	        	eventName.close();
	        	statement.close();
	        	
	        %>
	        <div class="form-group">
	          <div class="col-sm-offset-4 col-sm-10">
	            <input type="submit" name="add_event_co_submit" class="btn btn-success" value="Add Co-ordinator">
	            <input type="reset" name="add_event_co_cancel" class="btn btn-default" value="Cancel">
	          </div>
	        </div>
	        
	      </form>
        </div>

        <div class="tab-pane" id="allusers">
			<%
			Statement stmtUser=com.mysingers.db.DatabaseObj.getConnect().createStatement();
			ResultSet user=stmtUser.executeQuery("select * from user");
			%>
            <div class="panel panel-default">
            <div class="panel-heading text-center">User Details As Follow</div>
            <div class="panel-body">
            	<p>The user details as follow.</p> </div>
            	<table class="table">
            	<thead>
            	<tr>
            		<th>#</th>
            		<th>User Name</th>
            		<th>Mobile</th>
            		<th>Email</th>
            		<th>User Type</th>
            	</tr>
            	</thead>
            	<tbody>
            	<%while(user.next()){%>
            		<tr>
            			<th scope="row"><%=user.getString(1)%></th>
            			<td><%=user.getString(2)%></td>
            			<td><%=user.getString(3)%></td>
            			<td><%=user.getString(4)%></td>
            			<td><%=user.getString(9)%></td>
            		</tr>
            		<%}%>
            	</tbody>
		           	<%
			           	user.close();
			           	stmtUser.close();
			        %>
            	</table>
            	</div>
        </div>

        <div class="tab-pane" id="winners">
            	<%
			Statement stmtWinner=com.mysingers.db.DatabaseObj.getConnect().createStatement();
			ResultSet winner=stmtWinner.executeQuery("select * from winner");
			%>
            <div class="panel panel-default">
            <div class="panel-heading text-center">User Details As Follow</div>
            <div class="panel-body">
            	<p> The winner table as follow.</p> </div>
            	<table class="table">
            	<thead>
            	<tr>
            		<th>#</th>
            		<th>User ID</th>
            		<th>Event ID</th>
            	</tr>
            	</thead>
            	<tbody>
            	<%while(winner.next()){%>
            		<tr>
            			<th scope="row"><%=winner.getString(1)%></th>
            			<td><%=winner.getString(2)%></td>
            			<td><%=winner.getString(3)%></td>
            		</tr>
            		<%}%>
            	</tbody>
		           	<%
			           	winner.close();
			           	stmtWinner.close();
			        %>
            	</table>
            	</div>

        </div>
    </div>
</div>

<br><br><br>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('#tabs').tab();
    });
</script>    
</div> <!-- container -->
	<%@include file="/include/footer.jsp" %>
  </body>
</html>
