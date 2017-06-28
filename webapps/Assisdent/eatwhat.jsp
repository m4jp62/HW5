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
		response.sendRedirect("index.html");
	}
  String name = (String)session.getAttribute("name");
  String s_id = (String)session.getAttribute("s_id");
  String username = (String)session.getAttribute("username");
  String password = (String)session.getAttribute("password");
  String phone = (String)session.getAttribute("phone");
  String email = (String)session.getAttribute("email");
  String del_id = request.getParameter("del_id");
  if(del_id!=null){
    database.connectDB();
    database.delCourse(del_id);
    database.closeDB();
  }
  ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/semantic/dist/semantic.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/sweetalert-master/dist/sweetalert.css">
    <meta charset="utf-8">
    <title></title>
    <style>

    p{
      font-weight: bold;
    }

    .modal {
      width: 40% !important ; max-height: 100% !important ;
    }
    .nav-wrapper{
      background-color: #EDEDED;
    }
    .nav-wrapper > a{
      color: #553D20;
    }
    ul > li > a{
      color: #553D20;
      font-size: 24px;
      font-weight:bold;
    }
    nav {
      height: 95px;
      line-height: 95px;
    }
    li a:hover {
      color: #946b38;
    }
    </style>
  </head>
  <body style="background-color:#f2efef;">
    <div class="navbar-fixed">
      <nav>
        <div class="nav-wrapper">
          <a href="#" class="brand-logo center"><img src="logo.png" style="height:95px"></a>
          <ul class="left hide-on-med-and-down">
            <li><a href="calendar.jsp">Calendar</a></li>
          </ul>
          <ul class="right hide-on-med-and-down">
            <li><a href="index.jsp">Logout</a></li>
          </ul>
        </div>
      </nav>
    </div>

    <ul id="slide-out" class="side-nav">
      <li><div class="userView">
        <img src="http://www.freeiconspng.com/uploads/profile-icon-9.png" class="responsive-img">
        <a href="#!username"><span class="black-text name" style="font-size:36px;text-align:center"><%=username%></span></a>
      </div></li>
      <br>
      <li><div class="divider"></div></li>
      <li><a href="#!"><i class="material-icons">assignment_ind</i><%=name%></a></li>
      <li><a href="#!"><i class="material-icons">call</i><%=phone%></a></li>
      <li><a href="#!"><i class="material-icons">email</i><%=email%></a></li>
      <li><a class="waves-effect waves-light btn right" href="#edit">Edit</a></li>
    </ul>

    <div class="section no-pad-bot" id="index-banner">
  <div class="container">
    <br><br><br>

    <div class="row center">
      <h2 class="header col s12  red-text text-lighten-2">Help You to Decide What to Eat</h2>
    </div>
    <br><br>

  </div>
</div>


<div class="container">
  <div class="section">
<form action="map.jsp" method="get">
    <!--   Icon Section   -->
    <div class="row">
      <div class="col s12 m4">
        <div class="icon-block">
          <h5 class="center light-blue-text"><i class="medium material-icons">location_city</i></h5>
          <h3 class="center">CITY</h3>

                <select class="browser-default" id="first" name="city">
                <option value="台北市">台北市</option>
                <option value="台中市">台中市</option>
                <option value="台南市">台南市</option>
              </select>
          <h3 class="center">AREA</h3>
                <select class="browser-default" id="second" name="area">
              </select>
              </div>
      </div>

      <div class="col s12 m4">
        <div class="icon-block">
          <h5 class="center light-blue-text"><i class="medium material-icons">restaurant</i></h5>
          <h3 class="center">RESTAURANT TYPE</h3>
                <select class="browser-default" name="type">
                <option value="義式餐廳">義式餐廳</option>
                <option value="日式餐廳">日式餐廳</option>
                <option value="韓式餐廳">韓式餐廳</option>
                <option value="美式餐廳">美式餐廳</option>
                <option value="壽司">壽司</option>
                <option value="燒肉">燒肉</option>
                <option value="拉麵">拉麵</option>
                <option value="披薩">披薩</option>
                <option value="炸雞">炸雞</option>
                <option value="快炒">快炒</option>
                <option value="火鍋">火鍋</option>
                <option value="素食">素食</option>
              </select>
        </div>
      </div>

      <div class="col s12 m4">
        <div class="icon-block">
          <h5 class="center light-blue-text"><i class="medium material-icons">map</i></h5><br><br>
    <p class="row center">
      <Button id="download-button" class="btn-large waves-effect waves-light orange " type="submit">LET'S GO!!</Button>
      </p>
        </div>
      </div>
    </div>
</form>
  </div>
  <br><br>

  <div class="section">

  </div>
</div>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>
<script>
var ao = ['松山區', '信義區', '內湖區'];
var bo = ['南區', '西區', '北區'];
var co = ['中區', '安南區', '東區'];
var items = [ao, bo, co];

var first = document.getElementById('first');
var second = document.getElementById('second');

setValue(second, ao);

first.addEventListener('change', function(){
setValue(second, items[this.selectedIndex]);
});



function setValue(e,v){
e.options.length = 0;
for(i in v){
  var o = document.createElement('option');
  o.text = v[i];
  e.add(o, null);
}
}
</script>

  </body>
</html>
