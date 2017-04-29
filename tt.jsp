<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
            <title>RESUME</title>
            <%request.setCharacterEncoding("UTF-8");%>
            <style media="screen">
            table{
              width: 60%;
            }
            caption{
              font-size: 72px;
            }
            th{
                width: 100px;
                text-align: center;
                line-height: 28px;
              }
              td{
                width: 200px;
                text-align: center;
              }
            </style>
        </head>
        <body>
            <table border="1" align="center">
                <caption>履歷表</caption>
                <tr>
                    <th>姓名</th>
                    <td><%out.println(request.getParameter("username"));%></td>
                    <th>性別</th>
                    <td><%out.println(request.getParameter("sex"));%></td>
                    <td rowspan="6"><font color="grey">照片浮貼處</font></td>
                </tr>
                <tr>
                  <th>現職</th>
                  <td><%out.println(request.getParameter("nowwork"));%></td>
                  <th>曾任</th>
                  <td><%out.println(request.getParameter("pastwork"));%></td>
                </tr>
                <tr>
                  <th>出生年月日</th>
                  <td colspan="3"><%out.println(request.getParameter("birth"));%></td>
                </tr>
                <tr>
                  <th>通訊地址</th>
                  <td colspan="3"><%out.println(request.getParameter("address"));%></td>
                </tr>
                <tr>
                  <th >學歷</th>
                  <td><%out.println(request.getParameter("study"));%></td>
                  <th>語言能力</th>
                  <td><%
                  String[] lan=request.getParameterValues("language");
                  for(int i=0;i<lan.length;i++){
                    out.println(lan[i] + " ");
                    out.print("&nbsp;&nbsp;");
                  }
                  %></td>
                </tr>
                <tr>
                  <th >專長</th>
                  <td><%out.println(request.getParameter("advantage"));%></td>
                  <th>興趣</th>
                  <td><%
                  String hoby[]=request.getParameterValues("hobby");
                  for(int i=0;i<hoby.length;i++){
                    out.println(hoby[i] + " ");
                    out.print("&nbsp;&nbsp;");
                  }
                  %></td>
                </tr>
                <tr>
                  <th height="300px">經歷</th>
                  <td height="300px" colspan="4"><%out.println(request.getParameter("note"));%></td>
                </tr>

            </body>
        </html>
