<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Result</title>
 <style>
  body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(to right, pink,dark blue);
    margin: 0;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    width: 350px;
    text-align: center;
}

input, button {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
}

button {
    background: #2563eb;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background: #1d4ed8;
}

h2 {
    color: #1e293b;
}
</style>
</head>
<body>
  <h2>Check Result</h2>

<form action="result" method="post">

    <input type="number" name="seatNumber" placeholder="Seat Number"><br><br>

    <input type="text" name="studentName" placeholder="student Name"><br><br>
    
    <button type="submit">Get Result</button>
    
    <a href="resultshow.jsp"></a>

</form>
    
</body>
</html>