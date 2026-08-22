<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Save Attendance</title>
<style>
body {
    background-color: #1e3a8a; /* dark blue background */
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 40px;
}

.container {
    background-color: white; /* white box */
    max-width: 500px; /* chota box taaki image jaisa lage */
    margin: 40px auto;
    padding: 30px 40px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
}

h3 {
    color: #1e3a8a;
    margin-bottom: 25px;
    font-size: 24px;
}

input[type="text"], 
input[type="date"],
select {
    display: block; 
    width: 100%; 
    padding: 12px;
    margin-bottom: 15px; /* har input ke beech gap */
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 15px;
    box-sizing: border-box; /* padding andar rahega */
}

input:focus, select:focus {
    border-color: #2563eb;
    outline: none;
}

.btn-save {
    display: block; /* button bhi full width */
    width: 100%;
    padding: 12px;
    background-color: #2563eb;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

.btn-save:hover {
    background-color: #1e40af;
}
</style>
</head>
<body>

<div class="container">
<h3>📚 Add Attendance:</h3>
<form action="AttendanceServlet" method="post">
    <input type="number" name="seatno" placeholder="Seat Number">
    <input type="text" name="name" placeholder="Student Name">
    <input type="date" name="date" placeholder="Date">
    <select name="subject">
        <option disabled selected>Select Subject</option>
        <option>English</option>
        <option>Maths</option>
        <option>Science</option>
        <option>History</option>
        <option>Computer</option>
    </select>
    <input type="text" name="total" placeholder="Total Classes">
    <input type="text" name="present" placeholder="Present Classes">
    <button type="submit" class="btn-save">Save Attendance</button>
</form>
</div>

</body>
</html>