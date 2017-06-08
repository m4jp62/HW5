<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
	<link href="main.css" rel="stylesheet" type="text/css" media="screen"/>
	<TITLE>Javabean</TITLE>
</HEAD>

<BODY>
	<div>
		<FORM action="setData.jsp" method=post name=FORM1>
			<label>姓名</label>
			<br><br>
			<INPUT type=text name=tbxName>
			<br><br>
			<label>年齡</label>
			<br><br>
			<INPUT type=text name=age>
			<br><br>
			<INPUT type="submit" value="送出" name=submit1>
		</FORM>
	</div>
</BODY>
</HTML>
