<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    Integer studentId = (Integer) session.getAttribute("studentId");

    boolean studentLoggedIn = (studentId != null);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Jobs | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

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

.nav-link{
    margin-left:15px;
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


<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

<div class="container">


<!-- LOGO -->

<a class="navbar-brand fw-bold"
<%
    if(studentLoggedIn){
%>
       href="studentDashboard.jsp"
<%
    }else{
%>
       href="index.jsp"
<%
    }
%>
>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>


<!-- NAVIGATION -->

<ul class="navbar-nav ms-auto">


<!-- HOME / DASHBOARD -->

<li class="nav-item">

<%
    if(studentLoggedIn){
%>

<a class="nav-link"
   href="studentDashboard.jsp">

    <i class="fa-solid fa-house"></i>
    Dashboard

</a>

<%
    }else{
%>

<a class="nav-link"
   href="index.jsp">

    <i class="fa-solid fa-house"></i>
    Home

</a>

<%
    }
%>

</li>


<!-- JOBS -->

<li class="nav-item">

<a class="nav-link active"
   href="jobs.jsp">

    <i class="fa-solid fa-briefcase"></i>
    Jobs

</a>

</li>


<!-- COMPANIES -->

<li class="nav-item">

<a class="nav-link"
   href="companies.jsp">

    <i class="fa-solid fa-building"></i>
    Companies

</a>

</li>


<%
    if(studentLoggedIn){
%>

<!-- MY APPLICATIONS -->

<li class="nav-item">

<a class="nav-link"
   href="myApplications.jsp">

    <i class="fa-solid fa-file-lines"></i>
    My Applications

</a>

</li>


<!-- LOGOUT -->

<li class="nav-item ms-3">

<a class="btn btn-light"
   href="index.jsp">

    <i class="fa-solid fa-right-from-bracket"></i>
    Logout

</a>

</li>

<%
    }else{
%>

<!-- LOGIN -->

<li class="nav-item ms-3">

<a class="btn btn-light"
   href="student_login.jsp">

    <i class="fa-solid fa-right-to-bracket"></i>
    Login

</a>

</li>


<!-- REGISTER -->

<li class="nav-item ms-2">

<a class="btn btn-warning"
   href="student_register.jsp">

    <i class="fa-solid fa-user-plus"></i>
    Register

</a>

</li>

<%
    }
%>


</ul>

</div>

</nav>



<!-- DATABASE -->

<sql:setDataSource

var="db"

driver="com.mysql.cj.jdbc.Driver"

url="jdbc:mysql://localhost:3306/college_placement?useSSL=false&serverTimezone=UTC"

user="root"

password="Aishu@1726"/>


<sql:query var="result" dataSource="${db}">

SELECT * FROM jobs;

</sql:query>



<!-- JOBS -->

<div class="container mt-5">


<h2 class="text-center text-primary mb-4">

<i class="fa-solid fa-briefcase"></i>

Available Jobs

</h2>


<c:choose>


<c:when test="${empty result.rows}">

<div class="alert alert-warning text-center">

<i class="fa-solid fa-circle-exclamation"></i>

No Jobs Available

</div>

</c:when>


<c:otherwise>


<c:forEach var="row"
           items="${result.rows}">


<div class="card job-card">

<div class="card-body">


<h3>

${row.title}

</h3>


<h5 class="text-muted">

<i class="fa-solid fa-building"></i>

${row.company}

</h5>


<hr>


<p>

<b>Role:</b>

${row.role_type}

</p>


<p>

<b>Requirements:</b>

${row.requirements}

</p>


<p>

<b>Technical Skills:</b>

${row.technical_skills}

</p>


<p>

<b>Duration:</b>

${row.duration_months} Months

</p>


<p>

<b>Salary / Stipend:</b>

${row.stipend_salary}

</p>


<p>

<b>Last Date:</b>

${row.deadline}

</p>


<%
    if(studentLoggedIn){
%>


<!-- APPLY BUTTON FOR LOGGED-IN STUDENT -->

<form action="applyjobservlet"
      method="post">

<input type="hidden"
       name="jobId"
       value="${row.id}">

<button type="submit"
        class="btn btn-primary">

<i class="fa-solid fa-paper-plane"></i>

Apply Now

</button>

</form>


<%
    }else{
%>


<!-- LOGIN REQUIRED -->

<a href="student_login.jsp"
   class="btn btn-primary">

<i class="fa-solid fa-right-to-bracket"></i>

Login to Apply

</a>


<%
    }
%>


</div>

</div>


</c:forEach>


</c:otherwise>

</c:choose>


</div>



<!-- FOOTER -->

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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>