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
  String realname = request.getParameter("realname");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String mail = request.getParameter("mail");
  String phone = request.getParameter("phone");
  int j = 0;
  database.connectDB();
  if(realname!=null && mail!=null && phone!=null){
    String sql = "select * from account;";
    database.query(sql);
    ResultSet rs = database.getRS();
    if(rs!=null){
      while(rs.next()){
        if(username.equals(rs.getString(username))){
          j++;
        }
      }
    }
    if(j==0){
      database.insertData(realname , username , password , mail , phone);
    }
  }
  String sql = "select * from account;";
  database.query(sql);
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
    <title>Successfully</title>
    <style media="screen">
    h1 {
        font-size: 72px;
    }
    body{
      font-family: 'Ravi Prakash',cursive;
      background-color: gainsboro;
      text-align: center;
    }
    /*p{
      font-size: 36px;
    }*/
    input[type="button"] {
        font-family: 'Ravi Prakash', cursive;
        font-size: 20px;
        font-weight: 600;
        color: white;
        display: inline-block;
        text-decoration: none;
        margin-top: 20px;
        margin-right: 10px;
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
        float: right;
    }
    form {
        max-width: 100%;
        margin-left: 10px;
        margin-right: 10px;

    }
    .box,.fbox ,.tbox{
        margin: 20px auto;
        width: 350px;
        -webkit-border-radius: 8px/7px;
        -moz-border-radius: 8px/7px;
        border-radius: 8px/7px;
        background-color: #ebebeb;
        -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31);
        -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31);
        box-shadow: 1px 2px 5px rgba(0,0,0,.31);
        border: solid 1px #cbc9c9;
    }
    .box{
        height: 400px;
    }
    .fbox{
        height: 80px;
    }
    #icon {
        display: inline-block;
        width: 30px;
        background-color: royalblue;
        padding: 9px 0 0 8px;
        margin-top: 15px;
        -webkit-border-radius: 4px 0 0 4px;
        -moz-border-radius: 4px 0 0 4px;
        border-radius: 4px 0 0 4px;
        color: white;
        -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        border: solid 0 #cbc9c9;
    }
    input[type="password"],
    input[type="text"] {
        width: 79%;
        height: 39px;
        -webkit-border-radius: 0 4px 4px 0px/5px 5px 4px 4px;
        -moz-border-radius: 0 4px 4px 0px/0px 0 4px 4px;
        border-radius: 0 4px 4px 0px/5px 5px 4px 4px;
        background-color: #fff;
        -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        box-shadow: 1px 2px 5px rgba(0,0,0,.09);
        border: solid 1px #cbc9c9;
        margin-left: -5px;
        margin-top: 13px;
        padding-left: 10px;
        font-family: 'Ravi Prakash', cursive;
        font-size: 28px;
    }
    p{
        font-size: 18px;
        width: 220px;
        display: inline-block;
      //  margin-left: 18px;
    }
    </style>
  </head>
  <body>
    <h1 id="message">Sign in Successfully!</h1>
    <%
      String rlname ="";
      String un ="";
      String pwd ="";
      String ml ="";
      String ph ="";
      int i = 0;
      if(rs!=null){
        while(rs.next()){
          if(username.equals(rs.getString("username"))){
            if(password.equals(rs.getString("password"))){
              rlname = rs.getString("realname");
              un = rs.getString("username");
              pwd = rs.getString("password");
              ml = rs.getString("mail");
              ph = rs.getString("phone");
              i+=1;
              break;
            }
          }
        }
      }if(i==1){%>
      <div class="box">
        <form name="form1" action="success.jsp" method="post">
          <label id="icon" for="realname">
              <i class="material-icons">face</i>
          </label>
          <input type="text" name="realname" id="realname" readonly value="<%=rlname%>"></input>
          <label id="icon" for="username">
              <i class="material-icons">account_circle</i>
          </label>
          <input type="text" name="username" id="username" readonly value="<%=un%>"></input>
          <label id="icon" for="password">
              <i class="material-icons">lock</i>
          </label>
          <input type="password" name="password" id="password" readonly value="<%=pwd%>"></input>
          <label id="icon" for="mail">
              <i class="material-icons">email</i>
          </label>
          <input type="text" name="mail" id="mail" readonly value="<%=ml%>"></input>
          <label id="icon" for="phone">
              <i class="material-icons">phone</i>
          </label>
          <input type="text" name="phone" id="phone" readonly value="<%=ph%>"></input>
          <input type="button" name="back" id="back" value="back" onclick="location.href='index.jsp'">
        </form>
      </div>
      <!--
      <p>Name&nbsp;:&nbsp;<%=rlname%></p>
      <p>Username&nbsp;:&nbsp;<%=un%></p>
      <p>Password&nbsp;:&nbsp;<%=pwd%></p>
      <p>Mail&nbsp;:&nbsp;<%=ml%></p>
      <p>Phone&nbsp;:&nbsp;<%=ph%></p>
      -->
      <%}else{%>
        <script>$("#message").html("Sign in Failed");</script>
        <script>$("title").html("Failed");</script>
        <div class="fbox">
          <p id="note">Sorry,you entered the wrong username or password!</p>
          <input type="button" name="back" id="back" value="back" onclick="location.href='index.jsp'">
        </div>
      <%}%>
      <%if(j!=0){%>
        <script>$("#message").html("username has been userd!");</script>
        <script>$("title").html("Failed");</script>
        <div class="tbox">
          <p id="note">Sorry,your username has been userd!</p>
          <input type="button" name="back" id="back" value="back" onclick="location.href='index.jsp'">
        </div>
      <%}%>
  </body>
</html>
