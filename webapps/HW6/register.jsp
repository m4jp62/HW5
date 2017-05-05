<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
            <!--圖案-->
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <!--字體-->
                <link href="https://fonts.googleapis.com/css?family=Ravi+Prakash" rel="stylesheet">
                    <link href="register.css" rel="stylesheet" type="text/css" media="screen"/>
                    <title>Register</title>
                    <script>
                        function check() {
                            if (document.form1.password1.value!=document.form1.password2.value)
                                alert("Please enter the same password twice!");
                            }
                    </script>
                </head>
                <body>
                    <h1>Register</h1>
                    <p>Please fill in the following information</p>
                    <div class="box">
                        <form name="form1" action="success.jsp" method="post">
                            <label id="icon" for="realname">
                                <i class="material-icons">face</i>
                            </label>
                            <input type="text" name="realname" id="realname" placeholder="Name" required autofocus autocomplete="off"/>
                            <label id="icon" for="username">
                                <i class="material-icons">account_circle</i>
                            </label>
                            <input type="text" name="username" id="username" placeholder="Username" required pattern="[A-Za-z0-9]{1,20}" title="please enter 20 letters or numbers at most" autocomplete="off"/>
                            <label id="icon" for="password">
                                <i class="material-icons">lock</i>
                            </label>
                            <input type="password" name="password" id="password" placeholder="Password" required pattern="[A-Za-z0-9]{6,12}" title="please enter 6-12 letters or numbers"/>
                            <label id="icon" for="password2">
                                <i class="material-icons">lock</i>
                            </label>
                            <input type="password" name="password2" id="password2" placeholder="Password Again" required onchange="check()"/>
                            <label id="icon" for="mail">
                                <i class="material-icons">email</i>
                            </label>
                            <input type="text" name="mail" id="mail" placeholder="Mail" required pattern="[a-zA-Z0-9_]+@[a-zA-Z0-9\._]+" title='please contain "@"' autocomplete="off"/>
                            <label id="icon" for="phone">
                                <i class="material-icons">phone</i>
                            </label>
                            <input type="text" name="phone" id="phone" placeholder="Phone" pattern="[0]{1}[9]{1}[0-9]{2}[0-9]{3}[0-9]{3}"  title="09XXXXXXXX" required autofocus autocomplete="off"/>
                            <input type="submit" name="register" value="register">
                        </form>
                    </div>
                </body>
            </html>
