<!-- Static navbar -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <% if(session.getAttribute("UserType") != null){ %>
	     <% if (session.getAttribute("UserType").toString().trim().equals("Admin")){ %>
		     <a class="navbar-brand" href="admin.jsp">MySingers</a>
	     <% }else{
		     	if(session.getAttribute("UserType").toString().trim().equals("Singer")){ %>
			     <a class="navbar-brand" href="index.jsp">MySingers</a>
		     	<% }else{
		     		if(session.getAttribute("UserType").toString().trim().equals("User")){ %>
		     			<a class="navbar-brand" href="index.jsp">MySingers</a>
		     		<% }else{ %>
		     			<a class="navbar-brand" href="index.jsp">MySingers</a>
		     		<% } %>
		 		<% } %>
		 <% } %>
	 <% }else{ %>
		     <a class="navbar-brand" href="index.jsp">MySingers</a>
	 <% } %>
      
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="services.jsp">Services</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="events.jsp">Events</a></li>
        <li><a href="songs.jsp">Songs</a></li>
        <%if(session.getAttribute("UserType") != null){%>
	    	 <%if(session.getAttribute("UserType").toString().equals("Singer")){%>
	     		<li><a href="/MySingers/uploadsong.jsp">Upload Song</a></li>
	     	<%}else{%>
	     		<li><a href="contact.jsp">Contact Us</a></li>
	     	<%}%>
		 <%}else{%>
		     <li><a href="contact.jsp">Contact Us</a></li>
		 <%} %>
         <%if(session.getAttribute("UserType") != null){%>
		     <%if (session.getAttribute("UserType").toString().equals("Admin")) {%>
		     	<li><a href="/MySingers/logout.jsp">Logout</a></li>
		     <%}else{ 
		    	 if(session.getAttribute("UserType").toString().equals("Singer")){%>
		     		<li><a href="/MySingers/logout.jsp">Logout</a></li>
	     		<%}else{ 
			    	 if(session.getAttribute("UserType").toString().equals("User")){%>
			     		<li><a href="/MySingers/logout.jsp">Logout</a></li>
			     	<%}else{%>
			     		<li><a href="/MySingers/login.jsp">Login</a></li>
			     	<%}%>
		     	<%}%>
		     <%}%>
		 <%}else{%>
		     <li><a href="/MySingers/login.jsp">Login</a></li>
		 <%} %>
      </ul>
    </div>
  </div>
</nav>