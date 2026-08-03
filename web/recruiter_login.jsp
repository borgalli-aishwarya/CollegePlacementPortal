<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recruiter Login | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    .login-section{padding:60px 0;}
    *{margin:0;padding:0;box-sizing:border-box;font-family:Poppins,sans-serif}
    body{background:#f5f7fc}
    .navbar,.footer{background:linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8)}
    .navbar-brand,.nav-link{color:#fff!important}
    .nav-link{margin-left:20px}
    .hero{min-height:82vh;display:flex;align-items:center}
    .left h1{font-size:48px;color:#3d2fc7;font-weight:700}
    .left p{color:#666}
    .left li{list-style:none;margin:14px 0}
    .left i{color:#4357e8;margin-right:10px}
    .card-login{background:#fff;padding:40px;border-radius:18px;box-shadow:0 15px 35px rgba(0,0,0,.15)}
    .btn-login{background:#2468ff;color:#fff;width:100%;height:48px;border:none;border-radius:10px}
    .btn-login:hover{background:#0d5ae6}
    .footer{color:#fff;padding:25px 0;text-align:center}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand fw-bold" href="index.jsp"><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</a>
<button class="navbar-toggler bg-light" data-bs-toggle="collapse" data-bs-target="#m"><span class="navbar-toggler-icon"></span></button>
<div class="collapse navbar-collapse" id="m">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
<li class="nav-item"><a class="nav-link" href="#">Jobs</a></li>
<li class="nav-item"><a class="nav-link" href="#">Students</a></li>
<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
<li class="nav-item ms-3"><a class="btn btn-light" href="recruiterRegister.jsp">Register</a></li>
</ul></div></div></nav>

<section class="hero">
<div class="container">
<div class="row align-items-center">
<!-- Left side info -->
<div class="col-lg-6 left">
<h1>Recruiter Portal</h1>
<p class="mt-3 fs-5">Connect with talent for campus placement drives and job opportunities.</p>
<ul class="mt-4">
<li><i class="fa-solid fa-circle-check"></i>Post Job Openings & Campus Drives</li>
<li><i class="fa-solid fa-circle-check"></i>Review Student Applications</li>
<li><i class="fa-solid fa-circle-check"></i>Manage the Recruitment Process</li>
</ul>
</div>
<!-- Right side login form -->
<div class="col-lg-5 offset-lg-1">
<div class="card-login">
<h3 class="text-center mb-3">Recruiter Login</h3>
<form action="RecruiterLoginServlet" method="post">
<div class="mb-3">
<label>Email</label>
<div class="input-group"><span class="input-group-text"><i class="fa fa-envelope"></i></span>
<input class="form-control" type="email" name="email" required></div></div>
<div class="mb-3">
<label>Password</label>
<div class="input-group"><span class="input-group-text"><i class="fa fa-lock"></i></span>
<input class="form-control" type="password" name="password" required></div></div>
<div class="d-flex justify-content-between mb-3">
<div><input type="checkbox"> Remember Me</div>
<a href="#">Forgot Password?</a>
</div>
<button class="btn-login">Login</button>
<p class="text-center mt-3">Don’t have an account? <a href="recruiterRegister.jsp">Register Here</a></p>
</form>
</div>
</div>
</div>
</div>
</section>

<footer class="footer">
<div class="container">
<h5><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</h5>
<p>Empowering recruiters to hire top talent.</p>
<p>© 2028 Campus Placement Portal | All Rights Reserved</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
