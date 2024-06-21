<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bawcom Union</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


    
<!-- Slider Section -->
<div class="mySlider">
    <div class="container">
        
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <div class="panel panel-success">
      <div class="panel-heading">Add Items Here</div>
      <div class="panel-body">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Add Items</h2>
                    <hr class="light">
                        <div class="row">
                            <form action="UploadSong" method="post" ENCTYPE="multipart/form-data">
                               <div class="form-group">
                                   <select class="form-control" name="i_type" id="select">
                                       <option>Please Select Food Type</option>
                                       <option>Vegetarian</option>
                                       <option>Non Vegetarian</option>
                                   </select>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_name" placeholder="Enter Item Name" class="form-control" id="name" required>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_price" placeholder="Enter Item Price" class="form-control" id="price" required>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_quantity" placeholder="Enter Item Quantity" class="form-control" id="quantity" required>
                                </div>
                               <div class="form-group">
                                  <input type="file" name="i_pic" placeholder="Enter Item Pic" class="form-control" id="pic" required>
                                </div>
                                <button type="submit" class="form-control btn btn-success">Submit</button>
                            </form> 
                        </div>
                    <br><br><br><br>
                </div>
            </div>
      </div>
    </div>

  </div>
</div>
</div>
<!-- End Slider Section -->
</body>
</html>

