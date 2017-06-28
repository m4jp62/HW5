<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
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
%>
<!DOCTYPE html>
<html>
  <head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/semantic/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="css/sweetalert-master/dist/sweetalert.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <meta charset="utf-8">
    <title></title>
    <style>
    th{
      height:100px;
	  line-height:100px;
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
            <li><a href="timetable.jsp">Timetable</a></li>
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

    <div id="editEvent" class="modal">
      <form action="editEvent.jsp" method="post">
        <div class="modal-content">
          <h1>Edit Event</h1>
          <hr>
          <div class="row">
            <div class="input-field col s6">
              <p style="color:#A0A0A0">Start Date: </p><input type="text" name="start" id="datepicker3">
            </div>
            <div class="input-field col s6">
              <p style="color:#A0A0A0">End Date: </p><input type="text" name="end" id="datepicker4">
            </div>
          </div>
          <div class="row">
            <div class="input-field col s6">
              <select id="e_stime" name="stime">
                <%
                for(int i=0;i<24;i++){
                  if(i<10){%>
                    <option value="0<%=i%>:00">0<%=i%>:00</option>
                  <%}else{%>
                  <option value="<%=i%>:00"><%=i%>:00</option>
                <%}
                }
                %>
              </select>
              <label>Start Time</label>
            </div>
            <div class="input-field col s6">
              <select id="e_etime" name="etime">
                <%
                for(int i=0;i<24;i++){
                  if(i<10){%>
                    <option value="0<%=i%>:00">0<%=i%>:00</option>
                  <%}else{%>
                  <option value="<%=i%>:00"><%=i%>:00</option>
                <%}
                }
                %>
              </select>
              <label>End Time</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input id="e_title" name="title" type="text" class="validate">
              <label for="title">Event</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <span style="color:#A0A0A0">Color :</span>&nbsp;&nbsp;&nbsp;
              <input id="e_color" name="color" type="color" class="validate" value="#ff0000">
            </div>
          </div>
          <input id="edit_id" name="e_id" type="text" style="display:none" value="">
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

    <div id="addEvent" class="modal">
      <form action="addEvent.jsp" method="post">
        <div class="modal-content">
          <h1>Add Event</h1>
          <hr>
          <div class="row">
            <div class="input-field col s6">
              <p style="color:#A0A0A0">Start Date: </p><input type="text" name="start" id="datepicker">
            </div>
            <div class="input-field col s6">
              <p style="color:#A0A0A0">End Date: </p><input type="text" name="end" id="datepicker2">
            </div>
          </div>
          <div class="row">
            <div class="input-field col s6">
              <select id="stime" name="stime">
                <%
                for(int i=0;i<24;i++){
                  if(i<10){%>
                    <option value="0<%=i%>:00">0<%=i%>:00</option>
                  <%}else{%>
                  <option value="<%=i%>:00"><%=i%>:00</option>
                <%}
                }
                %>
              </select>
              <label>Start Time</label>
            </div>
            <div class="input-field col s6">
              <select id="etime" name="etime">
                <%
                for(int i=0;i<24;i++){
                  if(i<10){%>
                    <option value="0<%=i%>:00">0<%=i%>:00</option>
                  <%}else{%>
                  <option value="<%=i%>:00"><%=i%>:00</option>
                <%}
                }
                %>
              </select>
              <label>End Time</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="title" type="text" class="validate">
              <label for="title">Event</label>
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
          <input name="t_or_c" type="text" style="display:none" value="c">
          <button class="btn waves-effect waves-light" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
          </button>
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
          <div id="calendar">
          </div>
        </div>
        <div class="col s1">
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="moment.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script src="css/sweetalert-master/dist/sweetalert.min.js"></script>
    <script>
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    $(document).ready(function(){
      $('.modal').modal();
      $(".button-collapse").sideNav();
      $('select').material_select();
      $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          editable: true,
          weekMode: 'variable',
          events: "calendar_data.jsp",
        dayClick: function(date){
          if(date.format()<13){
            $('#datepicker').val(date.format());
            $('#datepicker2').val(date.format());
          }else{
            var parts = (date.format()).split('T');
            $('#datepicker').val(parts[0]);
            $('#datepicker2').val(parts[0]);
          }
          $('#addEvent').modal('open');
        },
        eventDrop: function(event,delta,revertFunc,jsEvent,ui,view) {
          alert(event.title + " was dropped on " + event.start.format());
          if (!confirm("Are you sure about this change?")) {
            revertFunc();
          }else{
            var sparts = (event.start.format()).split('T');
            var eparts = (event.end.format()).split('T');
            $.post("editEvent.jsp",{e_id:event.e_id,start:sparts[0],stime:sparts[1],end:eparts[0],etime:eparts[1]},function(text){
              alert("done!");
            });
          }
        },
        eventResize: function(event,delta,revertFunc) {
          alert(event.title + " end is now " + event.end.format());
          if (!confirm("Are you sure about this change?")) {
            revertFunc();
          }else{
            var sparts = (event.start.format()).split('T');
            var eparts = (event.end.format()).split('T');
            $.post("editEvent.jsp",{e_id:event.e_id,start:sparts[0],stime:sparts[1],end:eparts[0],etime:eparts[1]},function(text){
              alert("done!");
            });
          }
        },
        eventClick: function(calEvent, jsEvent, view) {
          swal({
            title: "What you like to do?",
            text: "Edit or Delete "+ calEvent.title +".",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Delete it!",
            cancelButtonText: "Edit it!",
            closeOnConfirm: false,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
              swal({
                title: "Are you sure?",
                text: "You will not be able to recover this event!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: false
              },
              function(){
                $.post("deleteEvent.jsp",{e_id:calEvent.e_id});
                swal({
                  title: "Done!",
                  text: calEvent.title+" had been deleted!",
                  type: "success",
                  timer: 1000,
                  showConfirmButton: false
                },function(){
                  window.location.href = "calendar.jsp";
                });
              });
            } else {
              var sparts = (calEvent.start.format()).split('T');
              var eparts = (calEvent.end.format()).split('T');
              $('#datepicker3').val(sparts[0]);
              $('#datepicker4').val(eparts[0]);
              $("#e_title").val(calEvent.title);
              $("#e_color").val(calEvent.color);
              $("#edit_id").val(calEvent.e_id);
              Materialize.updateTextFields();
              $('#editEvent').modal('open');
            }
          });
        }
      });

      $(function(){
        $("#datepicker").datepicker();
        $("#datepicker2").datepicker();
        $("#datepicker3").datepicker();
        $("#datepicker4").datepicker();
        $("#datepicker").datepicker( "option", "dateFormat","yy-mm-dd");
        $("#datepicker2").datepicker( "option", "dateFormat","yy-mm-dd");
        $("#datepicker3").datepicker( "option", "dateFormat","yy-mm-dd");
        $("#datepicker4").datepicker( "option", "dateFormat","yy-mm-dd");
      });
    })
    </script>
  </body>
</html>
