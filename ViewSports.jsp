<!DOCTYPE html>
<html>
<head>
<title>Sports Result</title>

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

<div class="box">

<h2 align="center">Sports Result</h2>

<form action="ViewSportsServlet" method="post">

<input type="text" name="seat" placeholder="Enter Seat Number" required>

<button type="submit">Search</button>

</form>

</div>

</body>
</html>