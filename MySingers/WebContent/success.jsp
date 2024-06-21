<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Song Upload - Apache Common File Upload</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<div class="upload">
	<p class="tz">TechZoo - A zoo of Technology</p>
	<p id="head">Song Upload - using Common's File Upload</p>
  <table width="358" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
      <td width="144"><strong>Film Title</strong></td>
      <td width="8">&nbsp;</td>
      <td width="203">${song.film}</td>
    </tr>
    <tr>
      <td width="144"><strong>Lyric</strong></td>
      <td width="8">&nbsp;</td>
      <td width="203">${song.lyric}</td>
    </tr>
    <tr>
      <td width="144"><strong>Music Director</strong></td>
      <td width="8">&nbsp;</td>
      <td width="203">${song.music}</td>
    </tr>
    <tr>
      <td width="144"><strong>File Name</strong></td>
      <td width="8">&nbsp;</td>
      <td width="203">${song.fileName}</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <p class="tz_link"><a href="index.jsp">Upload</a> more Songs</p>
	</div>

</body>
</html>