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
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 String name = request.getParameter("name");
 ResultSet rs = null;
 if(name!=null){

 }else{
   try{
      database.connectDB();
      String sql = "select * from student where username='"+username+"' and password='"+ password +"'";
      database.query(sql);
      rs = database.getRS();
      if(rs!=null){
        if(rs.next()){
          session.setAttribute("check","ok");
          session.setAttribute("username",username);
          session.setAttribute("password",password);
          session.setAttribute("s_id",rs.getString("s_id"));
          session.setAttribute("name",rs.getString("name"));
          session.setAttribute("phone",rs.getString("phone"));
          session.setAttribute("email",rs.getString("email"));
          response.sendRedirect("timetable.jsp");
      }else{
        response.sendRedirect("index.html");
      }
    }
    }catch(Exception ex){
      out.println(ex);
    }finally{
      try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
    }
 }
%>
