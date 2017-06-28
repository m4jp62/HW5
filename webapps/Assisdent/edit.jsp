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
  String c_id = request.getParameter("c_id");
  String time = request.getParameter("eday")+"-"+request.getParameter("etime");
  String credit = request.getParameter("ecredit");
  String name = request.getParameter("ename");
  String classroom = request.getParameter("eclassroom");
  String teacher = request.getParameter("eteacher");
  String color = request.getParameter("ecolor");
  try{
    if(time!=null && credit!=null && name!=null){
     database.connectDB();
     database.editCourse(c_id,time,credit,name,classroom,teacher,color);
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
