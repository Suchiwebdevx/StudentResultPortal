<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Enrollment</title>

<style>

body{
font-family:Arial;
background:#f4f4f4;
}

.container{
width:500px;
margin:auto;
margin-top:30px;
padding:20px;
background:white;
border-radius:10px;
box-shadow:0 0 10px gray;
}

input,select,textarea{
width:100%;
padding:8px;
margin:8px 0;
}

button{
padding:10px;
width:100%;
background:green;
color:white;
border:none;
font-size:18px;
}

</style>

</head>

<body>

<div class="container">

<h2 align="center">Student Enrollment</h2>

<form action="Enrollmentpage" method="post">

<input type="text" name="name" placeholder="Full Name" required>

<input type="text" name="Division" placeholder="Division" required>

<input type="text" name="seat" placeholder="Seat Number" required>

<input type="date" name="dob">

<select name="gender">
<option>Male</option>
<option>Female</option>
<option>Other</option>
</select>

<input type="text" name="mobile" placeholder="Mobile">

<input type="email" name="email" placeholder="Email">

<textarea name="address" placeholder="Address"></textarea>

<input type="text" name="institute" placeholder="School/College">

<input type="text" name="board" placeholder="Board/Department">

<input type="text" name="course" placeholder="Year/Class">

<input type="text" name="year" placeholder="Semester">

<input type="text" name="academic" placeholder="Academic Year">

<input type="text" name="name" placeholder="Gfm/class teacher">

<input type="password" name="password" placeholder="Password">

<button type="submit">Enroll Student</button>

</form>

</div>
<%out.println("<a href='index.jsp' class='btn'>Back to Home</a>");
 %>

</body>
</html>