<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update Resume | Campus Placement Portal</title>
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
    .resume-section{flex:1;display:flex;align-items:center;justify-content:center}
    .card-box{background:#fff;padding:30px;border-radius:12px;box-shadow:0 10px 25px rgba(0,0,0,.1);width:100%;max-width:500px}
    .footer{margin-top:auto;color:#fff;padding:25px 0;text-align:center}
</style>
</head>
<body>

<!-- Header / Navbar -->
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

<!-- Main Content -->
<section class="resume-section">
<div class="card-box">
<h2 class="text-center text-primary mb-4">Update Resume</h2>
<form action="UpdateResumeServlet" method="post" enctype="multipart/form-data">
  <div class="mb-3">
    <label for="resume" class="form-label">Upload Resume (PDF)</label>
    <input type="file" name="resume" id="resume" class="form-control" accept=".pdf" required>
  </div>
  <button class="btn btn-warning w-100">Upload Resume</button>
</form>
</div>
</section>

<!-- Footer -->
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
