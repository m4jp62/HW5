<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
    <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
    <jsp:setProperty property="port" name="database" value="3306"/>
    <jsp:setProperty property="db" name="database" value="4104029009"/>
    <jsp:setProperty property="user" name="database" value="4104029009"/>
    <jsp:setProperty property="password" name="database" value="Ss4104029009!"/>
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from account;");
  ResultSet rs = database.getRS();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
            <!--圖案-->
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <!--字體-->
                <link href="https://fonts.googleapis.com/css?family=Ravi+Prakash" rel="stylesheet">
                    <link href="main.css" rel="stylesheet" type="text/css" media="screen"/>
                    <title>Login</title>
                </head>
                <body>
                    <h1>Login</h1>
                    <p id="top">Welcome back!</p>
                    <div class="box">
                        <form action="success.jsp" method="post">
                            <label id="icon" for="username">
                                <i class="material-icons">account_circle</i>
                            </label>
                            <input type="text" name="username" id="username" placeholder="Username" autofocus required pattern="[A-Za-z0-9]{1,20}" title="please enter 20 letters or numbers at most" autocomplete="off"/>
                            <label id="icon" for="password">
                                <i class="material-icons">lock</i>
                            </label>
                            <input type="password" name="password" id="password" placeholder="Password" required pattern="[A-Za-z0-9]{6,12}" title="please enter 6-12 letters or numbers"/>
                            <p id="note">If you do not have an account,please
                                <a href="register.jsp">click here</a>.</p>
                            <input type="submit" name="login" id="login" value="login" onclick="">
                          </form>
                      </div>
                  </body>
              </html>
