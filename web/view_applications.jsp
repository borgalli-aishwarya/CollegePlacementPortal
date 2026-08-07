<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
Integer studentId = (Integer) session.getAttribute("studentId");

if(studentId == null){
    response.sendRedirect("student_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Applications | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

html,body{
height:100%;
margin:0;
display:flex;
flex-direction:column;
font-family:Poppins,sans-serif;
background:#f5f7fc;
}

.navbar,
.footer{
background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
}

.navbar-brand,
.nav-link{
color:#fff!important;
}

.footer{
margin-top:auto;
text-align:center;
padding:20px;
color:#fff;
}

.card{
border:none;
border-radius:15px;
box-shadow:0 10px 20px rgba(0,0,0,.12);
}

.table th{
text-align:center;
}

.table td{
vertical-align:middle;
text-align:center;
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand fw-bold" href="studentDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>

<button class="navbar-toggler bg-light"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav ms-auto">

<li class="nav-item">

<a class="nav-link active"
href="studentDashboard.jsp">

<i class="fa-solid fa-house"></i>

Home

</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="jobs.jsp">

Jobs

</a>

</li>

</ul>

</div>

</div>

</nav>

<!-- Main -->

<div class="container mt-5 flex-grow-1">

<div class="card">

<div class="card-body">

<h2 class="text-center text-primary mb-4">

My Applications

</h2>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>Job Title</th>

<th>Company</th>

<th>Status</th>

<th>Applied On</th>

</tr>

</thead>

<tbody>

<%

try{

database db = new database();

Connection con = db.connectDB();

String sql="SELECT j.title,j.company,a.status,a.applied_on FROM applications a INNER JOIN jobs j ON a.job_id=j.id WHERE a.student_id=?";

PreparedStatement ps=con.prepareStatement(sql);

ps.setInt(1,studentId);

ResultSet rs=ps.executeQuery();

boolean found=false;

while(rs.next()){

found=true;

String status=rs.getString("status");

%>

<tr>

<td><%=rs.getString("title")%></td>

<td><%=rs.getString("company")%></td>

<td>

<%

if(status.equals("Applied")){

%>

<span class="badge bg-primary">Applied</span>

<%

}else if(status.equals("Shortlisted")){

%>

<span class="badge bg-warning text-dark">Shortlisted</span>

<%

}else if(status.equals("Rejected")){

%>

<span class="badge bg-danger">Rejected</span>

<%

}else if(status.equals("Selected")){

%>

<span class="badge bg-success">Selected</span>

<%

}

%>

</td>

<td><%=rs.getString("applied_on")%></td>

</tr>

<%

}

if(!found){

%>

<tr>

<td colspan="4" class="text-center">

No applications found.

</td>

</tr>

<%

}

rs.close();

ps.close();

con.close();

}catch(Exception ex){

%>

<tr>

<td colspan="4" class="text-danger text-center">

<%=ex.getMessage()%>

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</div>

<!-- Footer -->

<footer class="footer">

<div class="container">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>

Empowering students with career opportunities.

</p>

<p>

© 2026 Campus Placement Portal

</p>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>