<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Result</title>
<style>
  .body{
    background:#f4f6f8;
    font-family:Arial,sans-serif;
}

.marksheet{
    width:700px;
    margin:30px auto;
    background:white;
    padding:30px;
    border:1px solid #ccc;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

h1{
    text-align:center;
    margin-bottom:25px;
}

.student-info{
    margin-bottom:20px;
    font-size:18px;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

th{
    background:#e8e8e8;
}

th,td{
    border:1px solid #999;
    padding:12px;
    text-align:center;
    font-size:18px;
}

.result{
    margin-top:25px;
    font-size:20px;
}

.result p{
    margin:10px 0;
}
</style>
</head>
<body>
<div style="text-align:center; margin-top:25px;">
<button onclick="window.print()" class="btn">Download Marksheet</button>
</div>
<form>
<div class="marksheet">

    <h1>STUDENT MARKSHEET</h1>

    <div class="student-info">
        <p><b>Name:</b> ${studentName}</p>
    </div>

    <table border="1">

<tr><td>English</td><td>${english}</td></tr>
<tr><td>Maths</td><td>${maths}</td></tr>
<tr><td>Science</td><td>${science}</td></tr>
<tr><td>History</td><td>${history}</td></tr>
<tr><td>Computer</td><td>${computer}</td></tr>

</table>


<h3>Total: ${total}</h3>
<h3>Percentage: ${percentage}%</h3>

<h3>Date: <%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()) %></h3>

<%
double per = Double.parseDouble(request.getAttribute("percentage").toString());
%>

<h3>Status: <%= (per >= 35) ? "PASS" : "FAIL" %></h3>

<h3>College/School:XYZ College/School</h3>

    <div style="margin-top:50px;text-align:right">
    _______<br>
    Registrar Signature
</div>
<% 

out.println("<html><head>");
out.println("<link rel='stylesheet' href='css/style.css'>");
out.println("</head><body>");
out.println("<div class='container'>");



out.println("<a href='studentdashboard.jsp' class='btn'>Back to Home</a>");

out.println("</div></body></html>"); %>
        
</body>
</html>