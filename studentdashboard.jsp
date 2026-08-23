<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<style>

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
}

/* Header */

.header{
    background:#003366;
    color:white;
    padding:18px;
    text-align:center;
}

/* Welcome Box */

.welcome{
    width:90%;
    margin:20px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px lightgray;
}

.welcome h2{
    color:#003366;
    margin-bottom:5px;
}

.welcome p{
    color:#555;
}

/* Cards */

.cards{
    width:90%;
    margin:auto;
    display:flex;
    gap:20px;
    flex-wrap:wrap;
    justify-content:center;
}

.card{
    width:220px;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px lightgray;
    text-align:center;
    transition:0.3s;
}

.card:hover{
    transform:scale(1.05);
}

.card h3{
    color:#003366;
}

.card a{
    text-decoration:none;
    color:white;
    background:#0d6efd;
    padding:10px 20px;
    border-radius:5px;
    display:inline-block;
    margin-top:10px;
}

.card a:hover{
    background:#084298;
}

/* Announcement */

.notice{
    width:90%;
    margin:30px auto;
    background:#fff8dc;
    padding:20px;
    border-left:6px solid orange;
    border-radius:8px;
}

.notice h3{
    color:#cc6600;
}

.notice p{
    color:#444;
}

/* Footer */

.footer{
    margin-top:30px;
    background:#003366;
    color:white;
    text-align:center;
    padding:15px;
}

</style>

</head>

<body>

<div class="header">
<h1>Student Dashboard</h1>
</div>

<div class="welcome">

<h2>Welcome Student!</h2>

<p>
Welcome to the Student Result Portal.
Here you can view your Academic Result, Sports Result,
Subject Attendance and other important updates.
</p>

<p><b>Date :</b>
<%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()) %>
</p>

</div>

<div class="cards">

<div class="card">
<h3>View Marksheet</h3>
<a href="result.jsp">View</a>
</div>

<div class="card">
<h3>Sports Result</h3>
<a href="ViewSports.jsp">View</a>
</div>

<div class="card">
<h3>Subject Attendance</h3>
<a href="subjectAttendance.jsp">View</a>
</div>

<div class="card">
<h3>Sports certificate</h3>
<a href="certificate.jsp?seat=<%=session.getAttribute("seat") %>">View</a>
</div>

<div class="card">
<h3>Academic Result</h3>
<a href="reports.jsp">View</a>
</div>

<div class="card">
<h3>Logout</h3>
<a href="logout.jsp">Logout</a>
</div>

</div>

<div class="notice">

<h3>📢 Announcements</h3>

<p>
* Any important announcements from the school/college will appear here.
</p>

<p>
* Stay tuned for examination schedules, sports events and result updates.
</p>

</div>

<div class="footer">

Student Result Portal © 2025

</div>

</body>
</html>