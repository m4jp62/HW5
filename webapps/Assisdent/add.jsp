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
	request.setCharacterEncoding("UTF-8");
	if(check==null){
		response.sendRedirect("index.jsp");
	}
  String s_id = (String)session.getAttribute("s_id");
  String time = request.getParameter("day")+"-"+request.getParameter("timee");
  String credit = request.getParameter("credit");
  String name = request.getParameter("name");
  String classroom = request.getParameter("classroom");
  String teacher = request.getParameter("teacher");
  String color = request.getParameter("color");
  try{
    if(time!=null && credit!=null && name!=null){
      database.connectDB();
      database.addCourse(s_id,time,credit,name,classroom,teacher,color);
      response.sendRedirect("timetable.jsp");
    }else{
      response.sendRedirect("timetable.jsp");
    }
   }catch(Exception ex){
     out.println(ex);
   }finally{
     try { database.closeDB(); } catch (Exception e) { /* ignored */ }
   }
%>
