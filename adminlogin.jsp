<html>
<body>
<h2>Admin Access</h2>
<form action="AdminLoginServlet" method="post">
    Enter Admin Code: <input type="password" name="adminCode" required><br><br>
    <input type="submit" value="Login">
    
</form>
<%
out.println("<a href='index.jsp' class='btn'>Back to Home</a>");

out.println("</div></body></html>");
 %>
<% if(request.getAttribute("error") != null) { %>
    <p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>
</body>
</html>