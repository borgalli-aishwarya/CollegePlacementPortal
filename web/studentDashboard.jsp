<%-- 
    Document   : studentDashboard.jsp
    Created on : 2 Aug, 2026, 2:23:07 PM
    Author     : Aishwarya
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Dashboard | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:Poppins,sans-serif}
    html, body {height:100%;display:flex;flex-direction:column;}
    body{background:#f5f7fc}
    .navbar,.footer{background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8)}
    .navbar-brand,.nav-link{color:#fff!important}
    .nav-link{margin-left:20px}
    .dashboard-section{flex:1;display:flex;align-items:center;justify-content:center}
    .card-box{background:#fff;padding:25px;border-radius:12px;box-shadow:0 10px 25px rgba(0,0,0,.1);height:100%}
    .footer{margin-top:auto;color:#fff;padding:25px 0;text-align:center}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
<div class="container-fluid">
<a class="navbar-brand fw-bold" href="index.jsp"><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</a>
<button class="navbar-toggler bg-light" data-bs-toggle="collapse" data-bs-target="#m"><span class="navbar-toggler-icon"></span></button>
<div class="collapse navbar-collapse" id="m">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
<li class="nav-item"><a class="nav-link" href="jobs.jsp">Jobs</a></li>
<li class="nav-item"><a class="nav-link" href="companies.jsp">Companies</a></li>
<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
<li class="nav-item ms-3"><a class="btn btn-light" href="studentLogin.jsp">Logout</a></li>
</ul></div></div></nav>

<section class="dashboard-section">
<div class="container">
<div class="row g-4 justify-content-center">
    <!-- Apply for Jobs -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box text-center">
            <i class="fa-solid fa-briefcase fa-2x text-primary mb-3"></i>
            <h5>Apply for Campus Drives</h5>
            <p>Browse job postings and apply directly.</p>
            <a href="jobs.jsp" class="btn btn-primary w-100">View Jobs</a>
        </div>
    </div>
    <!-- Track Applications -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box text-center">
            <i class="fa-solid fa-list-check fa-2x text-success mb-3"></i>
            <h5>Track Applications</h5>
            <p>Monitor the status of your job applications.</p>
            <a href="viewApplications.jsp" class="btn btn-success w-100">Track Applications</a>
        </div>
    </div>
    <!-- Update Resume -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box text-center">
            <i class="fa-solid fa-file-upload fa-2x text-warning mb-3"></i>
            <h5>Update Resume</h5>
            <p>Upload or update your resume for recruiters.</p>
            <a href="updateResume.jsp" class="btn btn-warning w-100">Update Resume</a>
        </div>
    </div>
</div>
</div>
</section>

<footer class="footer">
<div class="container-fluid">
<h5><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</h5>
<p>Empowering students with career opportunities.</p>
<p>© 2026 Campus Placement Portal | All Rights Reserved</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

