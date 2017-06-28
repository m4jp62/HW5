<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="team1" />
  <jsp:setProperty property="user" name="database" value="team1" />
  <jsp:setProperty property="password" name="database" value="NCHUTeam1!" />
</jsp:useBean>
<%
  request.setCharacterEncoding("UTF-8");
  database.connectDB();
  ResultSet rs = null;
  int x = 0;
  String username = request.getParameter("checking");
  try{
    database.connectDB();
    String sql = "select * from student where username='"+username+"'";
    database.query(sql);
    rs = database.getRS();
    if(rs!=null){
      if(rs.next()){
        x++;
      }
    }
  }catch(Exception ex){
    out.println(ex);
  }finally{
  try { rs.close();database.closeDB();} catch (Exception e) { /* ignored */ }
  }
  if(username.equals("")){
      %>
      <a style="color:blue">Could not be empty!</a>
      <%
    }else{
      if(x==1){%>
        <a style="color:red">Not Available!</a>
      <%;}
      else{%>
        <a style="color:green">Available!</a>
      <%;}
    }
  %>
