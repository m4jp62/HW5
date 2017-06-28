<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java"
    import="org.json.JSONObject"
    import="org.json.JSONArray"
    import="org.json.JSONException"
    import="java.util.*"
    import="java.text.*"
%>
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
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setContentType("application/json");
  JSONArray list = new JSONArray();

  ResultSet rs = null;
  database.connectDB();
  String sql = "select * from event where s_id = '" + s_id + "';";
  database.query(sql);
  rs = database.getRS();

  if(rs!=null){
    while(rs.next()){
      JSONObject object = new JSONObject();
      object.put("e_id", rs.getString("e_id"));
      object.put("title", rs.getString("title"));
      object.put("start", rs.getString("start")+"T"+rs.getString("stime"));
      object.put("end", rs.getString("end")+"T"+rs.getString("etime"));
      object.put("color", rs.getString("color"));
      list.put(object);
    }
  }
  database.closeDB();
  rs.close();
  out.println(list);
%>
