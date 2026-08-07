<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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

<title>Jobs | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

body{
background:#f5f7fc;
font-family:Poppins,sans-serif;
}

.navbar{
background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
}

.navbar-brand,
.nav-link{
color:#fff!important;
}

.job-card{
border:none;
border-radius:15px;
box-shadow:0 10px 20px rgba(0,0,0,.12);
margin-bottom:25px;
transition:.3s;
}

.job-card:hover{
transform:translateY(-5px);
}

.footer{
background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
color:#fff;
padding:25px;
text-align:center;
margin-top:40px;
}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand fw-bold"
href="studentDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>

<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link"
href="studentDashboard.jsp">

Dashboard

</a>
</li>

<li class="nav-item">
<a class="nav-link active"
href="jobs.jsp">

Jobs

</a>
</li>

<li class="nav-item ms-3">
<a class="btn btn-light"
href="index.jsp">

Logout

</a>
</li>

</ul>

</div>

</nav>

<sql:setDataSource

var="db"

driver="com.mysql.cj.jdbc.Driver"

url="jdbc:mysql://localhost:3306/college_placement?useSSL=false&serverTimezone=UTC"

user="root"

password="Aishu@1726"/>

<sql:query var="result" dataSource="${db}">

SELECT * FROM jobs;

</sql:query>

<div class="container mt-5">

<h2 class="text-center text-primary mb-4">

Available Jobs

</h2>

<c:choose>

<c:when test="${empty result.rows}">

<div class="alert alert-warning text-center">

No Jobs Available

</div>

</c:when>

<c:otherwise>

<c:forEach var="row" items="${result.rows}">

<div class="card job-card">

<div class="card-body">

<h3>${row.title}</h3>

<h5 class="text-muted">

${row.company}

</h5>

<hr>

<p>

<b>Role :</b>

${row.role_type}

</p>

<p>

<b>Requirements :</b>

${row.requirements}

</p>

<p>

<b>Technical Skills :</b>

${row.technical_skills}

</p>

<p>

<b>Duration :</b>

${row.duration_months} Months

</p>

<p>

<b>Salary / Stipend :</b>

${row.stipend_salary}

</p>

<p>

<b>Last Date :</b>

${row.deadline}

</p>

<form action="applyjobservlet"
method="post">

<input
type="hidden"
name="jobId"
value="${row.id}">

<button
type="submit"
class="btn btn-primary">

<i class="fa-solid fa-paper-plane"></i>

Apply Now

</button>

</form>

</div>

</div>

</c:forEach>

</c:otherwise>

</c:choose>

</div>

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