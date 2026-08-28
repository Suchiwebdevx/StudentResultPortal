<%@page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

<h2>📚 Subject Wise Attendance</h2>

<form method="post">
<input type="number" name="seat" placeholder="Enter Seat Number" required>
<input type="submit" value="Check" class="btn">
</form>

<%
if(request.getParameter("seat") != null)
{
long seat = Long.parseLong(request.getParameter("seat"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/result_db",
"root",
"root"
);

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM subject_attendance WHERE seat=?"
);

ps.setLong(1, seat);

ResultSet rs = ps.executeQuery();

int totalAll = 0;
int presentAll = 0;
String name = "";

out.println("<table border='1'>");
out.println("<tr><th>Subject</th><th>Present</th><th>Total</th><th>%</th><th>Status</th></tr>");

while(rs.next())
{
name = rs.getString("StudentName");

int total = rs.getInt("total_classes");
int present = rs.getInt("present_classes");

double percent = (present * 100.0) / total;

totalAll += total;
presentAll += present;

String color = (percent >= 75) ? "green" : "red";

out.println("<tr>");
out.println("<td>"+rs.getString("subject")+"</td>");
out.println("<td>"+present+"</td>");
out.println("<td>"+total+"</td>");
out.println("<td style='color:"+color+"'>"+String.format("%.1f",percent)+"%</td>");
out.println("<td style='color:"+color+"'>"+(percent>=75?"✓ Eligible":"✗ Shortage")+"</td>");
out.println("</tr>");
}

if(totalAll > 0)
{
double overall = (presentAll * 100.0) / totalAll;

out.println("<tr style='background:#667eea;color:white;'>");
out.println("<td><b>OVERALL</b></td>");
out.println("<td>"+presentAll+"</td>");
out.println("<td>"+totalAll+"</td>");
out.println("<td>"+String.format("%.1f",overall)+"%</td>");
out.println("<td>"+(overall>=75?"✓ Eligible":"✗ Shortage")+"</td>");
out.println("</tr>");
}

out.println("</table>");
out.println("<h3>" + name + "</h3>");
boolean found = false;
while(rs.next()) {
    found = true;
}
if(!found){
    out.println("No attendance data found for this seat!");
}

con.close();
}
%>

<a href="studentdashboard.jsp" class="btn">Back Home</a>

</div>

</body>
</html>