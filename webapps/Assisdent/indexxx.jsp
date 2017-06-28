<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
  session.invalidate();
%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <script>
    $(document).ready(function(){
          $("#rusername").blur(function(){
            var usern = $("#rusername").val();
            $.post("check.jsp",{checking:usern},function(text){
              $("#check").html(text);
            });
          });
        });
    </script>
    <style>
      body{
        background-color: grey;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <div class="modal fade" id="regis" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button"  class="close" data-dismiss="modal">&times;</button>
              <h1 style="color: black;" class="modal-title">Register</h1>
            </div>
            <div class="modal-body" style="color: black;">
              <form action="session.jsp" method="post">
                <div class="form-group">
                  <label for="username">Username:<a id ="check"></a></label>
                  <input type="text" class="form-control" id="rusername" name="rusername" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
                </div>
                <div class="form-group">
                  <label for="password">Password:</label>
                  <input type="password" class="form-control" name="rpassword" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
                </div>
                <div class="form-group">
                  <label for="name">Name:</label>
                  <input type="text" class="form-control" name="name" required/>
                </div>
                <div class="form-group">
                  <label for="phone">Phone:</label>
                  <input type="text" class="form-control" name="phone" required/>
                </div>
                <div class="form-group">
                  <label for="email">E-mail:</label>
                  <input type="text" class="form-control" name="email" required/>
                </div>
                <div class="form-group">
                  <label for="address">Address:</label>
                  <input type="text" class="form-control" name="address" required/>
                </div>
                <input type="submit" class="btn btn-info" value="Submit"/>
                <input type="reset" class="btn btn-info" data-dismiss="modal" value="Close"/>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
          <br><br><br>
          <div class="jumbotron" style="color: black;">
            <h1>Login</h1>
          </div>
          <form action="session.jsp" method="post">
            <div class="form-group">
              <label for="username" style="color:white;">Username:</label>
              <input type="text" class="form-control" name="username" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
            </div>
            <div class="form-group">
              <label for="password" style="color:white;">Password:</label>
              <input type="password" class="form-control" name="password" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
            </div>
            <input type="submit" class="btn btn-info" value="Submit"/>
            <input type="button" class="btn btn-info" data-toggle="modal" data-target="#regis" value="Register"/>
          </form>
        </div>
        <div class="col-sm-3">
        </div>
      </div>
    </div>
  </body>
</html>
