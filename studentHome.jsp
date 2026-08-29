<!DOCTYPE html>
<html>
<head>
<title>Student Portal</title>

<style>

body{
    font-family: Arial, sans-serif;
    background:#f2f2f2;
    margin:0;
}

.container{
    width:400px;
    margin:100px auto;
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px lightgray;
}

h1{
    color:#003366;
}

p{
    color:gray;
    margin-bottom:30px;
}

.btn{
    width:220px;
    padding:12px;
    margin:10px;
    background:#003366;
    color:white;
    border:none;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

.btn:hover{
    background:#0055aa;
}

</style>

</head>

<body>

<div class="container">

<h1>Student Portal</h1>

<p>Select an option</p>

<a href="studentlogin.jsp">
<button class="btn">Already Enrolled? Login</button>
</a>

<br>

<a href="enroll.jsp">
<button class="btn">New Student? Enroll</button>
</a>

</div>

</body>
</html>