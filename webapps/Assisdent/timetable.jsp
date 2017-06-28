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
    th{
      width:10%;
      text-align:center;
      background-color: #dfc8ac;
      font-size: 25px;
      color: #553D20;
    }
    td{
      text-align:center;
    }
    p{
      font-weight: bold;
    }
    th, td {
      border: 1px solid black;
    }
    table{
      border: 2px solid black;
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
          <a href="eatwhat.jsp" class="brand-logo center"><img src="logo.png" style="height:95px"></a>
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

    <div id="edit" class="modal">
      <form action="editProfile.jsp" method="post">
        <div class="modal-content">
          <p>Edit Profile</p>
          <div class="input-field col s12">
            <i class="material-icons prefix">lock</i>
            <input id="password" name="password" type="text" class="validate" value="<%=password%>">
            <label for="password">password</label>
          </div>
          <div class="input-field col s12">
            <i class="material-icons prefix">perm_identity</i>
            <input id="name" name="name" type="text" class="validate" value="<%=name%>">
            <label for="name">name</label>
          </div>
          <div class="input-field col s12">
            <i class="material-icons prefix">call</i>
            <input id="phone" name="phone" type="text" class="validate" value="<%=phone%>">
            <label for="phone">phone</label>
          </div>
          <div class="input-field col s12">
            <i class="material-icons prefix">email</i>
            <input id="email" name="email" type="text" class="validate" value="<%=email%>">
            <label for="email">email</label>
          </div>
          <button class="btn waves-effect waves-light" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
          </button>
        </div>
      </form>
    </div>

    <div id="addcourse" class="modal">
      <form action="add.jsp" method="post">
        <div class="modal-content">
          <h1>Add Course</h1>
          <hr>
          <div class="row">
            <div class="input-field col s5">
              <select id="day" name="day">
              　<option value="1">Monday</option>
              　<option value="2">Tuesday</option>
              　<option value="3">Wednesday</option>
              　<option value="4">Thursday</option>
                <option value="5">Friday</option>
              </select>
              <label>Day</label>
            </div>
            <div class="input-field col s4">
              <select id="timee" name="timee">
                <option value="7">07:00</option>
                <option value="8">08:00</option>
              　<option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
              </select>
              <label>Time</label>
            </div>
            <div class="input-field col s3">
              <select id="credit" name="credit">
              　<option value="1">1</option>
              　<option value="2">2</option>
              　<option value="3">3</option>
              </select>
              <label>Credit</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="name" type="text" class="validate">
              <label for="name">Course Name</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="classroom" type="text" class="validate">
              <label for="classroom">Classroom</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="teacher" type="text" class="validate">
              <label for="teacher">Teacher</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <span style="color:#A0A0A0">Color :</span>&nbsp;&nbsp;&nbsp;
              <input name="color" type="color" class="validate" value="#ff0000">
            </div>
          </div>
          <div class="row">
            <div class="col s6">
              <button class="btn waves-effect waves-light" type="submit">Submit
                <i class="material-icons right">send</i>
              </button>
            </div>
            <div class="col s3">
            </div>
            <div class="col s1">
              <input type="reset" class="modal-action modal-close ui grey inverted button" data-dismiss="modal" value="Close"/>
            </div>
            <div class="col s2">
            </div>
          </div>
        </div>
      </form>
    </div>

    <div id="editcourse" class="modal">
      <form action="edit.jsp" method="post">
        <div class="modal-content">
          <h1>Edit Course</h1>
          <hr>
          <div class="row">
            <div class="input-field col s5">
              <select id="eday" name="eday">
              　<option value="1">Monday</option>
              　<option value="2">Tuesday</option>
              　<option value="3">Wednesday</option>
              　<option value="4">Thursday</option>
                <option value="5">Friday</option>
              </select>
              <label>Day</label>
            </div>
            <div class="input-field col s4">
              <select id="etime" name="etime">
                <option value="7">07:00</option>
                <option value="8">08:00</option>
              　<option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
              </select>
              <label>Time</label>
            </div>
            <div class="input-field col s3">
              <select id="ecredit" name="ecredit">
              　<option value="1">1</option>
              　<option value="2">2</option>
              　<option value="3">3</option>
              </select>
              <label>Credit</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input id="ename" name="ename" type="text" class="validate">
              <label for="ename">Course Name</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input id="eclassroom" name="eclassroom" type="text" class="validate">
              <label for="eclassroom">Classroom</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input id="eteacher" name="eteacher" type="text" class="validate">
              <label for="eteacher">Teacher</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <span style="color:#A0A0A0;">Color :</span>&nbsp;&nbsp;&nbsp;
              <input id="ecolor" name="ecolor" type="color" class="validate" value="#ff0000">
            </div>
          </div>
          <input id="c_id" type="text" name="c_id" style="display:none">
          <div class="row">
            <div class="col s6">
              <button class="btn waves-effect waves-light" type="submit">Submit
                <i class="material-icons right">send</i>
              </button>
            </div>
            <div class="col s3">
            </div>
            <div class="col s1">
              <input type="reset" class="modal-action modal-close ui grey inverted button" data-dismiss="modal" value="Close"/>
            </div>
            <div class="col s2">
            </div>
          </div>
        </div>
      </form>
    </div>

    <div class="container-fluid">
    <br><br><br>
      <div class="row">
        <div class="col s1">
          <a href="#" data-activates="slide-out" class="btn button-collapse"><i class="large material-icons">perm_identity</i></a>
        </div>
        <div class="col s10">
          <h2>Timetable</h2>
          <table id="mytable" class="bordered">
              <%
						for(int i=0;i<12;i++){
							if(i==0){
								%>
                <thead>
								<tr>
									<th style="height:50px;">Time</th>
                  <th>Mon</th>
									<th>Tue</th>
									<th>Wed</th>
									<th>Thu</th>
									<th>Fri</th>
								</tr>
                </thead>
								<%
							}
							%>
            <tbody>
              <tr>
							<%
							for(int j=0;j<6;j++){
								if(j==0){
									%>
									<th style="height:100px;"><%=i+7%>:00</td>
								<%
							}else{
								%>
									<td onclick="manage(this.id)" style="pointer-events: none;" id="time-<%=j%>-<%=i+7%>"></td>
								<%
							}
						}
							%>
								</tr>
							<%
						}
					%>
            </tbody>
          </table>
          <script>
          var added = [];
          var c_ids = [];
          var etime = [];
          var ecredit = [];
          var ename = [];
          var eclassroom = [];
          var eteacher = [];
          var ecolor= [];
          </script>
          <%
            database.connectDB();
            String sql = "select * from course where s_id='"+s_id+"';";
            database.query(sql);
            rs = database.getRS();
            if(rs!=null){
              while(rs.next()){
                String temptime = rs.getString("time");
                String[] part = temptime.split("-");
                int timee = Integer.parseInt(part[1]);
                int credit = rs.getInt("credit");
                String namee = rs.getString("name");
                String classroom = rs.getString("classroom");
                String teacher = rs.getString("teacher");
                String color = rs.getString("color");
                String c_id = rs.getString("c_id");
                for(int i=0;i<credit;i++){
                  String time ="time-"+part[0]+"-"+(timee+i);
                  %>
                    <script type="text/javascript">
                      added.push("<%=time%>");
                      c_ids.push("<%=c_id%>");
                      etime.push("time-<%=temptime%>");
                      ecredit.push("<%=credit%>");
                      ename.push("<%=namee%>");
                      eclassroom.push("<%=classroom%>");
                      eteacher.push("<%=teacher%>");
                      ecolor.push("<%=color%>");
                      document.getElementById("<%=time%>").innerHTML = "<div class='ui raised segment'><p><%=namee%><br><%=classroom%><br><%=teacher%></p></div>";
                      document.getElementById("<%=time%>").style.background = '<%=color%>';
                    </script>
                  <%
                }
              }
            }
            try { database.closeDB(); } catch (Exception e) { /* ignored */ }
        %>
        </div>
        <div class="col s1">
        </div>
      </div>

      <div id="act" class="fixed-action-btn" style="bottom: 45px; right: 24px;">
        <a class="btn-floating btn-large ">
          <i class="material-icons">menu</i>
        </a>
        <ul>
          <li><a onclick="add()" class="btn-floating red"><i class="material-icons">add</i></a></li>
					<li><a onclick="del()" class="btn-floating blue"><i class="material-icons">delete</i></a></li>
          <li><a onclick="edit()" class="btn-floating yellow darken-1"><i class="material-icons">mode_edit</i></a></li>
        </ul>
      </div>

      <div id="cancel" class="fixed-action-btn" style="bottom: 45px; right: 24px;display:none;">
        <a class="btn-floating btn-large ">
          <i onclick="cancel()" class="material-icons">done</i>
        </a>
      </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="css/semantic/dist/semantic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script src="css/sweetalert-master/dist/sweetalert.min.js"></script>
    <script>
      $(document).ready(function(){
        $(".button-collapse").sideNav();
        $('.modal').modal();
        $('select').material_select();
      });

      function add(){
        $("td").css("pointerEvents", "auto");
        for(var i=0;i<added.length;i++){
         document.getElementById(added[i]).style.pointerEvents = 'none';
        }
        swal("ADD COURSE","Click on an Empty box to add!");
        $("#act").fadeOut();
        $("#cancel").fadeIn();
      }

      function editCourse(tablecell,c_id,ecredit,ename,eclassroom,eteacher,ecolor){
        var parts = tablecell.split('-');
  			var day = parts[1];
  			var time = parts[2];
        $("#c_id").val(c_id);
        $("#eday").val(day);
        $("#etime").val(time);
        $('select').material_select();
        $("#ecredit").val(ecredit);
        $("#ename").val(ename);
        $("#eclassroom").val(eclassroom);
        $("#eteacher").val(eteacher);
        $("#ecolor").val(ecolor);
        Materialize.updateTextFields();
        $('#editcourse').modal('open');
      }

      function delCourse(c_id){
        swal({
          title: "Are you sure?",
          text: "Click comfirm to delete your course!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Comfirm",
          closeOnConfirm: false
        },
        function(){
          $.post("timetable.jsp",{del_id:c_id});
          swal({
            title: "Deleted!",
            text: "Your course has been deleted.",
            type: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            closeOnConfirm: true
          },
          function(){
            window.location.href = 'timetable.jsp';
          }
        );
        });
      }

      function del(){
        for(var i=0;i<added.length;i++){
         document.getElementById(added[i]).style.pointerEvents = 'auto';
         document.getElementById(added[i]).setAttribute( "onClick", "javascript: delCourse("+c_ids[i]+");" );
        }
        swal("DELETE COURSE","Select a Course to delete!");
        $("#act").fadeOut();
        $("#cancel").fadeIn();
      }

      function edit(){
        for(var i=0;i<added.length;i++){
         document.getElementById(added[i]).style.pointerEvents = 'auto';
         document.getElementById(added[i]).setAttribute( "onClick", "javascript: editCourse('"+etime[i]+"',"+c_ids[i]+","+ecredit[i]+",'"+ename[i]+"','"+eclassroom[i]+"','"+eteacher[i]+"','"+ecolor[i]+"');" );
        }
        swal("EDIT COURSE","Select a Course to edit!");
        $("#act").fadeOut();
        $("#cancel").fadeIn();
      }

      function cancel(){
        $("td").css("pointerEvents", "none");
        $("#act").fadeIn();
        $("#cancel").fadeOut();
      }

      function manage(tablecell){
        var parts = tablecell.split('-');
  			var day = parts[1];
  			var time = parts[2];
        $("#day").val(day);
        $("#timee").val(time);
        $('select').material_select();
        $('#addcourse').modal('open');
  		}
    </script>
  </body>
</html>
