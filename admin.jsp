<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<style>
body{background:#1e3a8a;padding:40px;font-family:Arial}
.admin-box{background:white;max-width:500px;margin:auto;padding:35px;border-radius:8px}
input,select{display:block;width:100%;padding:12px;margin-bottom:18px;border:1px solid #ccc;border-radius:4px}
.btn-save{display:block;width:100%;padding:13px;background:#2563eb;border:none;border-radius:4px;color:white;font-weight:bold}
</style>
</head>
<body>
<div class="admin-box">
<h3>Add Student Marks</h3>
<form action="RegisterPage" method="post">
<input type="number" name="seatNumber" placeholder="Seat Number">
<input type="text" name="studentName" placeholder="Student Name">
<input type="number" name="english" placeholder="English">
<input type="number" name="maths" placeholder="Maths">
<input type="number" name="science" placeholder="Science">
<input type="number" name="history" placeholder="History">
<input type="number" name="computer" placeholder="Computer">
<button type="submit" class="btn-save">Save Marks</button>
</form>
</div>
</body>
</html>