<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String companyName = (String) session.getAttribute("companyName");

if(companyName == null){
    response.sendRedirect("recruiterLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Job | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

html,body{
height:100%;
display:flex;
flex-direction:column;
}

body{
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

.nav-link{
margin-left:18px;
font-weight:500;
}

.main-section{
flex:1;
padding:50px 0;
}

.card{
border:none;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.12);
}

.footer{
color:#fff;
padding:25px 0;
text-align:center;
margin-top:auto;
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand fw-bold" href="recruiterDashboard.jsp">

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
<a class="nav-link" href="recruiterDashboard.jsp">
<i class="fa-solid fa-house"></i>
Dashboard
</a>
</li>

<li class="nav-item">
<a class="nav-link active" href="posts.jsp">
<i class="fa-solid fa-plus"></i>
Post Job
</a>
</li>

<li class="nav-item ms-3">
<a class="btn btn-light" href="index.jsp">
<i class="fa-solid fa-right-from-bracket"></i>
Logout
</a>
</li>

</ul>

</div>

</div>

</nav>

<!-- Main -->

<section class="main-section">

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card">

<div class="card-body p-5">

<h2 class="text-center text-primary mb-4">

<i class="fa-solid fa-briefcase"></i>

Post New Job

</h2>

<form action="PostJobServlet" method="post">

<div class="mb-3">

<label class="form-label">Job Title</label>

<input type="text"
class="form-control"
name="title"
required>

</div>

<div class="mb-3">

<label class="form-label">Company Name</label>

<input type="text"
class="form-control"
value="<%= companyName %>"
readonly>

</div>

<div class="mb-3">

<label class="form-label">Role Type</label>

<select class="form-select"
name="roleType"
required>

<option value="">Select Role</option>

<option value="Internship">Internship</option>

<option value="Job">Job</option>

</select>

</div>

<div class="mb-3">

<label class="form-label">

Requirements

</label>

<textarea
class="form-control"
name="requirements"
rows="4"
required></textarea>

</div>

<div class="mb-3">

<label class="form-label">

Technical Skills

</label>

<textarea
class="form-control"
name="technicalSkills"
rows="3"
required></textarea>

</div>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">

Duration (Months)

</label>

<input
type="number"
class="form-control"
name="duration">

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Salary / Stipend

</label>

<input
type="text"
class="form-control"
name="salary"
required>

</div>

</div>

<div class="mb-4">

<label class="form-label">

Application Deadline

</label>

<input
type="date"
class="form-control"
name="deadline"
required>

</div>

<button
type="submit"
class="btn btn-primary w-100">

<i class="fa-solid fa-paper-plane"></i>

Post Job

</button>

</form>

</div>

</div>

</div>

</div>

</div>

</section>

<!-- Footer -->

<footer class="footer">

<div class="container">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>

Empowering recruiters to hire talented students.

</p>

<p>

© 2026 Campus Placement Portal

</p>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>