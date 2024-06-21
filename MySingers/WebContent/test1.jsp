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
	<form action="upload" method="post" enctype="multipart/form-data">
    <table width="358" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td width="144"><strong>Film Title</strong></td>
      <td width="8">&nbsp;</td>
      <td width="203"><label>
        <input type="text" name="film" />
      </label></td>
    </tr>
    <tr>
      <td><strong>Lyric</strong></td>
      <td>&nbsp;</td>
      <td><input type="text" name="lyric"  size="40"/></td>
    </tr>
    <tr>
      <td><strong>Music</strong></td>
      <td>&nbsp;</td>
      <td><label>
        <select name="music">
        <option value="A. R. Rehman">A. R. Rehman</option>
        <option value="Ram Sampat">Ram Sampat</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td><strong>Upload</strong></td>
      <td>&nbsp;</td>
      <td>
        <input type="file" name="song" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="Submit" value="Upload Song"  class="button"/>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
	</div>

</body>
</html>