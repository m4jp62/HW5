<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
    <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
    <jsp:setProperty property="port" name="database" value="3306"/>
    <jsp:setProperty property="db" name="database" value="4104029009"/>
    <jsp:setProperty property="user" name="database" value="4104029009"/>
    <jsp:setProperty property="password" name="database" value="Ss4104029009!"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <!--字體-->
    <link href="https://fonts.googleapis.com/css?family=Ravi+Prakash" rel="stylesheet">
    <title>Successfully</title>
    <style media="screen">
    body {
        font-family: 'Ravi Prakash',cursive;
        background-color: gainsboro;
    }
    h1 {
        text-align: center;
        font-size: 72px;
        color: #444444;
    }
    table,th,td {
      border: 1px solid black;
      padding: 3px;
    }
    font{
      font-size: 24px;
    }
    input[type="button"] {
      font-family: 'Ravi Prakash', cursive;
      font-size: 20px;
      font-weight: 600;
      color: white;
      display: inline-block;
      text-decoration: none;
      margin-top: 20px;
      margin-right: auto;
      margin-left: auto;
      width: 100px;
      height: 30px;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      background-color: royalblue;
      -webkit-box-shadow: 0 3px rgba(58,87,175,.75);
      -moz-box-shadow: 0 3px rgba(58,87,175,.75);
      box-shadow: 0 3px rgba(58,87,175,.75);
      transition: all 0.1s linear 0s;
      top: 0;
      position: relative;
      float: inherit;
    }
    div{
      text-align: center;
    }
    </style>
  </head>
  <body>
    <h1 id="message">All accounts!</h1>
    <table align="center">
    <tr><th><font>realname</font></th><th><font>username</font></th><th><font>password</font></th><th><font>mail</font></th><th><font>phone</font></th></tr>
    <%
      String realname = request.getParameter("realname");
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String mail = request.getParameter("mail");
      String phone = request.getParameter("phone");
      String rlname ="";
      String un ="";
      String pwd ="";
      String ml ="";
      String ph ="";
      database.connectDB();
      String sql = "select * from account;";
      database.query(sql);
      ResultSet rs = database.getRS();
      if(rs!=null){
        while(rs.next()){
          rlname = rs.getString("realname");
          un = rs.getString("username");
          pwd = rs.getString("password");
          ml = rs.getString("mail");
          ph = rs.getString("phone");
          out.println("<tr><td><font>" + rlname + "</font></td><td><font>" + un + "</font></td><td><font>" + pwd + "</font></td><td><font>" + ml + "</font></td><td><font>" + ph + "</font></td>");
          out.println("</tr>");
        }
      }
      out.println("</table>");
    %>
    <div class="">
      <input type="button" name="back" id="back" value="back" onclick="location.href='index.jsp'">
    </div>
  </body>
