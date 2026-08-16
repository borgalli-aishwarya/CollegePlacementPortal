<%-- 
    Document   : recruiter_Register.jsp
    Created on : 2 Aug, 2026, 1:58:04 PM
    Author     : Aishwarya
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recruiter Registration | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:Poppins,sans-serif}
    body{background:#f5f7fc}
    .navbar,.footer{background:linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8)}
    .navbar-brand,.nav-link{color:#fff!important}
    .nav-link{margin-left:20px}
    .register-section{padding:60px 0;}
    .card-register{background:#fff;padding:40px;border-radius:18px;box-shadow:0 15px 35px rgba(0,0,0,.15)}
    .btn-register{background:#2468ff;color:#fff;width:100%;height:48px;border:none;border-radius:10px}
    .btn-register:hover{background:#0d5ae6}
    .footer{color:#fff;padding:25px 0;text-align:center}
</style>
</head>
<body>

```jsp
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark"
     style="background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand fw-bold"
           href="index.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <!-- MOBILE MENU BUTTON -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar"
                aria-controls="mainNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- ONLY HOME -->

        <div class="collapse navbar-collapse"
             id="mainNavbar">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link active"
                       href="index.jsp">

                        <i class="fa-solid fa-house"></i>
                        Home

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>



<section class="register-section">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-8">
<div class="card-register">
<h3 class="text-center mb-4">Recruiter Registration</h3>
<form action="RecruiterRegisterServlet" method="post" class="row g-3">

<div class="mb-3">
<label>Company Name</label>
<input class="form-control" type="text" name="company_name" required>
</div>

<div class="mb-3">
<label>HR Contact Person</label>
<input class="form-control" type="text" name="hr_contact_person" required>
</div>

<div class="mb-3">
<label>Email Address</label>
<input class="form-control" type="email" name="email" required>
</div>

<div class="mb-3">
<label>Phone Number</label>
<input class="form-control" type="text" name="phone" required>
</div>

<div class="mb-3">
<label>Job Title</label>
<input class="form-control" type="text" name="job_title">
</div>

<div class="mb-3">
<label>Company Website</label>
<input class="form-control" type="url" name="website_url">
</div>

<div class="mb-3">
<label>Industry</label>
<select class="form-select" name="industry">
<option>Select Industry</option>
<option>IT</option>
<option>Finance</option>
<option>Manufacturing</option>
<option>Education</option>
</select>
</div>

<div class="mb-3">
<label>Company Location</label>
<input class="form-control" type="text" name="location">
</div>

<div class="row">
<div class="col-md-6 mb-3">
<label>Password</label>
<input class="form-control" type="password" name="password" required>
</div>
<div class="col-md-6 mb-3">
<label>Confirm Password</label>
<input class="form-control" type="password" name="confirmPassword" required>
</div>
</div>



<button type="submit" class="btn-register">
    Create Account
</button>
<p class="text-center mt-3">Already have an account? <a href="recruiter_login.jsp">Login Here</a></p>

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
<p>© 2028 Campus Placement Portal</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
