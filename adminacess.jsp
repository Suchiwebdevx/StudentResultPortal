<%@page import="java.sql.*"%>

<%
if(session.getAttribute("admin") == null) {
    response.sendRedirect("adminlogin.jsp");
    return;
}
%>
<html><head><link rel='stylesheet' href='css/style.css'></head><body>
<div class='container'>
<h2>🔐 Admin Panel</h2>

<h3>Add Subject Attendance</h3>
<form method="post" action="attendanceServlet">
<input type="text" name="name" placeholder="Student Name" class="input" required>
<select name="subject" class="input"><option>English</option><option>Math</option><option>Science</option><option>History</option><option>Computer</option></select>
<input type="number" name="total" placeholder="Total Classes" class="input" required>
<input type="number" name="present" placeholder="Present Classes" class="input" required>
<input type="submit" value="Save Attendance" class="btn">
</form>

<h3>All Students</h3>
<table><tr><th>Seat</th><th>Name</th><th>Total</th><th>Sports</th><th>Grade</th><th>Action</th></tr>

<%
    try {
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/result_db","root","root");
       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery("SELECT * FROM result1");
       while(rs.next()) {
       out.println("<tr><td>"+rs.getLong("seat")+"</td><td>"+rs.getString("StudentName")+"</td><td>"+rs.getInt("total")+"</td><td>"+rs.getString("sports")+"</td><td>"+rs.getString("sports_grade")+"</td>");
       out.println("<td><a href='deleteServlet?seat="+rs.getLong("seat")+"' class='btn' style='background:red'>Delete</a></td></tr>");
     }
       con.close();
     } catch(Exception e) { out.println(e); }
%>

</table>
<a href="index.jsp" class="btn">Back Home</a>
</div></body></html>