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
  String check = (String)session.getAttribute("check");
  String s_id = (String)session.getAttribute("s_id");
  request.setCharacterEncoding("UTF-8");
  if(check==null){
    response.sendRedirect("index.jsp");
  }
  String password=request.getParameter("password");
  String name=request.getParameter("name");
  String phone=request.getParameter("phone");
  String email=request.getParameter("email");
  String t_or_c = request.getParameter("t_or_c");
  if(password!=null && name!=null && phone!=null && email!=null){
    database.connectDB();
    database.editProfile(s_id,password,name,phone,email);
    session.setAttribute("password",password);
    session.setAttribute("name",name);
    session.setAttribute("phone",phone);
    session.setAttribute("email",email);
    database.closeDB();
    if(t_or_c!=null){
      response.sendRedirect("calendar.jsp");
    }else{
      response.sendRedirect("timetable.jsp");
    }
  }else{
    response.sendRedirect("timetable.jsp");
  }
%>
