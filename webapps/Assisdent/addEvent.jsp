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
  String title = request.getParameter("title");
  String start = request.getParameter("start");
  String stime = request.getParameter("stime");
  String end = request.getParameter("end");
  String etime = request.getParameter("etime");
  String color = request.getParameter("color");
  if(title!=null && start!=null && stime!=null && end!=null && etime!=null && color!=null){
    database.connectDB();
    database.addEvent(s_id,title,start,stime,end,etime,color);
    database.closeDB();
    response.sendRedirect("calendar.jsp");
  }else{
    response.sendRedirect("calender.jsp");
  }
%>
