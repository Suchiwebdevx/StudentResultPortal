<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Result Portal</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:80px auto;
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

h1{
    color:#003366;
}

button{
    width:220px;
    padding:12px;
    margin:15px;
    font-size:18px;
    background:#0d6efd;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

button:hover{
    background:#084298;
}

</style>

</head>

<body>

<div class="container">

<h1>STUDENT PORTAL</h1>

<h3>Select Login Type</h3>

<a href="studentHome.jsp">
<button>Student</button>
</a>

<br>

<a href="adminlogin.jsp">
<button>Admin Login</button>
</a>

</div>

</body>
</html>