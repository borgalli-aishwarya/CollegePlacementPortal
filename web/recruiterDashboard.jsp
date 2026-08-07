<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String companyName = (String) session.getAttribute("companyName");

if(companyName == null){
    response.sendRedirect("recruiterLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Recruiter Dashboard | Campus Placement Portal</title>

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
color:white!important;
}

.nav-link{
margin-left:18px;
font-weight:500;
}

.dashboard-section{
flex:1;
padding:40px 0;
}

.welcome-box{
background:#fff;
border-radius:12px;
padding:30px;
box-shadow:0 10px 25px rgba(0,0,0,.10);
margin-bottom:35px;
text-align:center;
}

.card-box{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,.10);
height:100%;
transition:.3s;
}

.card-box:hover{
transform:translateY(-8px);
}

.footer{
color:white;
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

<button class="navbar-toggler bg-light" type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link active" href="recruiterDashboard.jsp">
<i class="fa-solid fa-house"></i>
Dashboard
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="posts.jsp">
<i class="fa-solid fa-plus"></i>
Post Job
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="managejobs.jsp">
<i class="fa-solid fa-briefcase"></i>
Manage Jobs
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="viewApplicationsRecruiter.jsp">
<i class="fa-solid fa-users"></i>
Applications
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

<!-- Dashboard -->

<section class="dashboard-section">

<div class="container">

<div class="welcome-box">

<h2 class="fw-bold">
Welcome, <%= companyName %> 👋
</h2>

<p class="text-muted mt-3">
Manage your job postings, review student applications,
and recruit the best candidates for your organization.
</p>

</div>

<div class="row g-4">

<!-- Post Job -->

<div class="col-lg-4 col-md-6">

<div class="card-box text-center">

<i class="fa-solid fa-plus fa-2x text-primary mb-3"></i>

<h5>Post New Job</h5>

<p>
Create and publish new job openings for students.
</p>

<a href="posts.jsp" class="btn btn-primary w-100">
Post Job
</a>

</div>

</div>

<!-- Manage Jobs -->

<div class="col-lg-4 col-md-6">

<div class="card-box text-center">

<i class="fa-solid fa-briefcase fa-2x text-success mb-3"></i>

<h5>Manage Jobs</h5>

<p>
View, edit or remove your posted jobs.
</p>

<a href="managejobs.jsp" class="btn btn-success w-100">
Manage Jobs
</a>

</div>

</div>

<!-- Applications -->

<div class="col-lg-4 col-md-6">

<div class="card-box text-center">

<i class="fa-solid fa-users fa-2x text-warning mb-3"></i>

<h5>Applications</h5>

<p>
View students who have applied for your jobs.
</p>

<a href="viewApplicationsRecruiter.jsp" class="btn btn-warning w-100">
View Applications
</a>

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