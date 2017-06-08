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
  ResultSet rs = null;
  String now = request.getParameter("noww");
  database.connectDB();
  String sql = "select * from account where username = '" + now + "'";
  database.query(sql);
  rs = database.getRS();
  if(rs!=null){
    if(rs.next()){
      out.println("username has been used");
    }
  }
%>
