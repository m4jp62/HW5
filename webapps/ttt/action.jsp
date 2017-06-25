<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="team1" />
  <jsp:setProperty property="user" name="database" value="team1" />
  <jsp:setProperty property="password" name="database" value="NCHUTeam1!" />
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from student;");
  ResultSet rs = database.getRS();
//註冊
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String password2 = request.getParameter("password2");
  String name = request.getParameter("name");
  String phone = request.getParameter("phone");
  String email = request.getParameter("email");
//登入
  String logname = request.getParameter("logname");
  String logpass = request.getParameter("logpass");
  int x=0,y=0;

if(username != null){   //註冊
  if(!password.equals(password2)){
    x++;%>
    <script language="javascript">
    alert("Two passwords are not the same.");//兩密碼不同
    history.go(-1);
    </script><%
  }
  if(rs!=null){
    while(rs.next()){
      if(username.equals(rs.getString("username"))){%>
        <script language="javascript">
        alert("This username has been taken.");//帳號已被用過
        history.go(-1);
        </script>
        <%
        x++;
      }
    }
  }
  if(x==0){   //註冊成功 將資料insert進資料庫
    database.insertData(username,password,name,phone,email);%>
    <script language="javascript">
    alert("Register sucessfully. Please log in now.");
    history.go(-1);
    </script><%
  }
}

//登入
if(rs!=null){
  while(rs.next()){
    if(logname.equals(rs.getString("username"))){
      if(logpass.equals(rs.getString("password"))){
        y=0;
        session.setAttribute("check","ok");
        session.setAttribute("username",logname);
        session.setAttribute("password",logpass);
        session.setAttribute("s_id",rs.getString("s_id"));
        session.setAttribute("name",rs.getString("name"));
        session.setAttribute("phone",rs.getString("phone"));
        session.setAttribute("email",rs.getString("email"));
        response.sendRedirect("seattle.html");
        break;
      }else{
        %>
        <script language="javascript">
        alert("The password is wrong.");
        history.go(-1);
        </script>
        <%
        break;
      }
    }else{
      y++;
    }
  }
}

if(y!=0){%>
<script language="javascript">
alert("The username does not exist.");
history.go(-1);
</script>
 <%
}
%>
