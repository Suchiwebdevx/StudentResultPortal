<%@ page import="java.sql.*" %>

<html>
<head>
<title>Portal Reports</title>
</head>
<style>

body{
    font-family: Arial, sans-serif;
    background:#f5f5f5;
    margin:20px;
}

h2{
    text-align:center;
    color:#003366;
}

h3{
    color:#003366;
}

.card{
    display:inline-block;
    width:180px;
    padding:15px;
    margin:10px;
    background:#003366;
    color:white;
    text-align:center;
    border-radius:5px;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

th{
    background:#003366;
    color:white;
    padding:10px;
}

td{
    border:1px solid #ccc;
    padding:10px;
    text-align:center;
}

.topper{
    margin-top:20px;
    padding:15px;
    border:1px solid #003366;
}

</style>
<body>

<h1 align="center">Student Result Portal Reports</h1>

<%
Connection con=null;
PreparedStatement ps;
ResultSet rs;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/result_db",
"root",
"root");
%>

<!-- Total Students -->

<%
ps=con.prepareStatement("select count(*) from student_enrollment");
rs=ps.executeQuery();

if(rs.next()){
%>

<h3>Total Students : <%= rs.getInt(1) %></h3>

<%
}
%>

<hr>

<!-- Passed Students -->

<%
ps=con.prepareStatement("select count(*) from result1 where english>=35 and maths>=35 and science>=35 and history>=35 and computer>=35");
rs=ps.executeQuery();

if(rs.next()){
%>

<h3>Passed Students : <%= rs.getInt(1) %></h3>

<%
}
%>

<!-- Failed Students -->

<%
ps=con.prepareStatement("select count(*) from result1 where english<35 or maths<35 or science<35 or history<35 or computer<35");
rs=ps.executeQuery();

if(rs.next()){
%>

<h3>Failed Students : <%= rs.getInt(1) %></h3>

<%
}
%>

<hr>

<h2>Subject Wise Report</h2>

<table border="1" cellpadding="10">

<tr>
<th>Subject</th>
<th>Passed</th>
<th>Failed</th>
</tr>

<%

String subjects[]={"english","maths","science","history","computer"};

for(String sub:subjects){

PreparedStatement p1=con.prepareStatement(
"select count(*) from result1 where "+sub+" >=35");

ResultSet r1=p1.executeQuery();

r1.next();

int pass=r1.getInt(1);

PreparedStatement p2=con.prepareStatement(
"select count(*) from result1 where "+sub+" <35");

ResultSet r2=p2.executeQuery();

r2.next();

int fail=r2.getInt(1);

%>

<tr>

<td><%= sub.toUpperCase() %></td>

<td><%= pass %></td>

<td><%= fail %></td>

</tr>

<%
}
%>

</table>

<hr>

<h2>Class Topper</h2>

<%

ps=con.prepareStatement(

"select seatnumber,studentname,(english+maths+science+history+computer) total from result1 order by total desc limit 1");

rs=ps.executeQuery();

if(rs.next()){

double percentage=rs.getInt("total")/5.0;

%>

Seat Number :
<b><%= rs.getString("seatnumber") %></b>

<br><br>

Student Name :
<b><%= rs.getString("studentname") %></b>

<br><br>

Percentage :
<b><%= percentage %>%</b>

<%
}
%>

<hr>

<h2>Sports Report</h2>

<%

ps=con.prepareStatement(
"select count(*) from sports_record where grade='A+'");

rs=ps.executeQuery();

if(rs.next()){

%>

A+ Students :
<b><%= rs.getInt(1) %></b>

<br><br>

Certificates Generated :
<b><%= rs.getInt(1) %></b>

<%
}

con.close();

%>

</body>
</html>