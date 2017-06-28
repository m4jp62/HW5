<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
  session.invalidate();
%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" charset="utf-8" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <form action="session.jsp" method="post">
      Username:<input type="text" name="username"/>
      <br>
      Password:<input type="password" name="password"/>
      <br>
      <input type="submit"/>
    </form>
  </body>
</html>
