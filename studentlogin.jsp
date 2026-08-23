<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<style>

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#003366;
}

.login-box{
    width:380px;
    margin:70px auto;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    color:#003366;
    margin-bottom:25px;
}

label{
    font-weight:bold;
    color:#333;
}

input[type=text],
input[type=password]{

    width:100%;
    padding:10px;
    margin-top:5px;
    margin-bottom:18px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

input[type=submit]{

    width:100%;
    background:#003366;
    color:white;
    padding:12px;
    border:none;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

input[type=submit]:hover{

    background:#00509e;
}

.links{

    text-align:center;
    margin-top:18px;
}

.links a{

    text-decoration:none;
    color:#003366;
    font-weight:bold;
}

.links a:hover{

    text-decoration:underline;
}

</style>

</head>

<body>

<div class="login-box">

<h2>Student Login</h2>

<form action="StudentLogin" method="post">

<label>Seat Number</label>
<input type="text" name="seat" required>

<label>Student Name</label>
<input type="text" name="name" required>

<label>Password</label>
<input type="password" name="password" required>

<input type="submit" value="Login">

</form>

<div class="links">

<a href="forgotPassword.jsp">Forgot Password?</a>

<br><br>

<a href="enroll.jsp">New Student? Enroll Here</a>

</div>

</div>

</body>
</html>