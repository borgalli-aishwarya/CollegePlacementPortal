<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Campus Placement Portal</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<!-- Google Fonts - Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
html {
    scroll-behavior: smooth;
}
body {
    background: #f7f8fc; /* Slightly grayish background for main content to match image */
    overflow-x: hidden;
}
p {
    font-size: 16px;
    line-height: 1.6;
}

/* ================ NAVBAR ================ */
   /*================ NAVBAR =================*/

.navbar{
    background:linear-gradient(90deg,#3F2B96,#6A11CB);
    padding:18px 0;
    box-shadow:0 4px 15px rgba(0,0,0,.15);
}

.navbar-brand{
    display:flex;
    align-items:center;
    color:#fff!important;
    font-size:28px;
    font-weight:700;
}

.navbar-brand img{
    width:52px;
    height:52px;
    margin-right:15px;
}

.navbar-nav .nav-item{
    margin-left:18px;
}

.navbar-nav .nav-link{
    color:#fff!important;
    font-size:17px;
    font-weight:600;
    transition:.3s;
}

.navbar-nav .nav-link:hover{
    color:#FFD54F!important;
}

.fa-right-to-bracket{
    color:#FFD54F;
    margin-right:6px;
}

.dropdown-menu{
    border:none;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
}

.dropdown-item{
    padding:12px 18px;
    font-weight:500;
}

.dropdown-item:hover{
    background:#f4f4f4;
    color:#6A11CB;
}

.signup-btn{
    border:2px solid white;
    color:white!important;
    padding:10px 28px;
    border-radius:10px;
    font-weight:600;
    background:transparent;
    transition:.3s;
}

.signup-btn:hover{
    background:white;
    color:#6A11CB!important;
}

/* ================ HERO ================ */
.hero {
    background: linear-gradient(135deg, #5d73ff, #4b4fe2, #432dbd);
    padding: 100px 0; /* Adjusted for better text/image placement like in image */
    color: white;
    min-height: 700px; /* Adjusted minimum height */
    display: flex;
    align-items: center;
}
.hero h1 {
    font-size: 68px; /* Corrected size */
    font-weight: 800;
    line-height: 1.1;
    margin-bottom: 25px;
}
.hero p {
    font-size: 24px; /* Corrected size */
    line-height: 1.6;
    max-width: 600px;
    margin-bottom: 40px;
}
.hero-image {
    width: 100%;
    max-width: 600px; /* Increased slightly to match image proportion */
    animation: float 4s ease-in-out infinite;
}
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-15px); }
    100% { transform: translateY(0px); }
}
/* Hero Buttons - Matches image: Get Started is light gray text, Our Partners is blue solid */
.btn-start {
    background: transparent;
    border: none;
    color: rgba(255, 255, 255, 0.7); /* Matches faded white text in image */
    padding: 0;
    font-size: 18px;
    font-weight: 600;
    margin-right: 30px;
}
.btn-partner {
    border: 2px solid white;
    color: white;
    background-color: transparent;
    padding: 15px 45px;
    font-size: 20px;
    border-radius: 60px;
}
.btn-partner:hover {
    background: white;
    color: #3158ff;
}

/* ================ LOGIN AS ================ */
.login-section {
    padding: 100px 0;
    background-color: #f7f8fc;
}
.section-title {
    font-size: 48px; /* Corrected size */
    font-weight: 700;
    text-align: center;
    margin-bottom: 70px;
    position: relative;
    color: #2d2d6f; /* Updated color for the section title */
}
/* The title decorative line from image, matches deep blue title color */
.section-title::after {
    content: "";
    position: absolute;
    width: 100px;
    height: 4px;
    background: #3d2bb7; /* Decorative line blue */
    left: 50%;
    transform: translateX(-50%);
    bottom: -15px;
    border-radius: 20px;
}
.login-card {
    background: white;
    border-radius: 18px;
    padding: 45px 35px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,.08);
    transition: .4s;
    height: 100%;
}
.login-card:hover {
    transform: translateY(-8px);
}
/* Color accents for cards are all solid and matching now */
.student {
    border-top: 6px solid #4961ff; /* Accent blue matching first card */
}
.recruiter {
    border-top: 6px solid deeppink; /* Accent matching second card */
}
.admin {
    border-top: 6px solid deepskyblue; /* Accent matching third card */
}
/* Icon colors updated to match the specific cards */
.student i {
    color: #4961ff;
}
.recruiter i {
    color: deeppink;
}
.admin i {
    color: deepskyblue;
}
.login-card i {
    font-size: 85px; /* Size updated to fit cards nicely */
    margin-bottom: 25px;
}
.login-card h3 {
    font-size: 36px;
    font-weight: 700;
    margin-bottom: 20px;
    color: #2d2d6f;
}
.login-card p {
    font-size: 18px;
    line-height: 1.7;
    margin-bottom: 35px;
    color: #555;
}
/* Card Login Button matches image color */
.login-btn {
    background: #3158ff;
    color: white;
    padding: 14px 35px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 20px;
    font-weight: 600;
    transition: .3s;
}
.login-btn:hover {
    background: #2345d9;
    color: white;
}

/* ================ FOOTER ================ */
.main-footer {
    background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8); /* Dark blue background matching image exactly */
    color: white;
    padding: 80px 0 30px 0; /* More padding on top */
    margin-top: 0; /* Section sits directly after card area on white bg */
}
.footer-logo-title {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 20px;
}
.main-footer p {
    font-size: 16px;
    line-height: 30px;
    opacity: 0.8; /* faded look of sub-text from image */
}
.main-footer h4 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 25px;
    margin-top: 10px; /* Spacing adjusted for quick links */
}
.list-unstyled li {
    margin-bottom: 12px;
}
.text-decoration-none {
    color: white;
    opacity: 0.8;
}
.text-decoration-none:hover {
    color: #ddd;
    opacity: 1;
}
.main-footer .col-lg-4 p i {
    width: 25px;
    color: #ffd04b; /* Yellow icons in contact section */
    font-size: 18px;
}
.main-footer hr {
    background: white;
    opacity: 0.3;
    margin-top: 50px;
    margin-bottom: 20px;
}
.text-center.mb-0 {
    font-size: 14px;
    opacity: 0.6;
}
.footer{
    width:100%;
    background:linear-gradient(90deg,#3f51d7,#6b2bd3);
    color:#fff;
    text-align:center;
    padding:35px 20px;
    margin-top:50px;
}

.footer h3{
    font-size:34px;
    font-weight:700;
    margin-bottom:12px;
}

.footer h3 i{
    margin-right:8px;
}

.footer .tagline{
    font-size:16px;
    margin-bottom:18px;
}

.footer .copyright{
    font-size:15px;
    margin:0;
}
</style>
</head>
<body>
<!-- Navbar Section -->
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">
    <div class="container">

        <!-- Logo -->
        <a class="navbar-brand" href="index.jsp">
            <img src="<%=request.getContextPath()%>/images/logo.png"
                 alt="Logo">
            Campus Placement Portal
        </a>

        <button class="navbar-toggler bg-white"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="menu">

            <ul class="navbar-nav ms-auto align-items-center">

                <!-- Home -->
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fa-solid fa-house"></i>
                        Home
                    </a>
                </li>

                <!-- Jobs -->
                <li class="nav-item">
                    <a class="nav-link" href="jobs.jsp">
                        <i class="fa-solid fa-briefcase"></i>
                        Jobs
                    </a>
                </li>

                <!-- Companies -->
                <li class="nav-item">
                    <a class="nav-link" href="companies.jsp">
                        <i class="fa-solid fa-building"></i>
                        Companies
                    </a>
                </li>

                <!-- Login -->
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       data-bs-toggle="dropdown">

                        <i class="fa-solid fa-right-to-bracket"></i>
                        Login
                    </a>

                    <ul class="dropdown-menu">

                        <li>
                            <a class="dropdown-item"
                               href="student_login.jsp">
                                <i class="fa-solid fa-user-graduate me-2"></i>
                                Student Login
                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item"
                               href="recruiter_login.jsp">
                                <i class="fa-solid fa-building me-2"></i>
                                Recruiter Login
                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item"
                               href="admin_Login.jsp">
                                <i class="fa-solid fa-user-shield me-2"></i>
                                Admin Login
                            </a>
                        </li>

                    </ul>
                </li>

            </ul>

        </div>
    </div>
</nav>


<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <div class="row align-items-center">
            <!-- Left Side -->
            <div class="col-lg-6">
                <h1>Welcome to Campus<br>Placement Portal</h1>
                <p>Connecting talented students with leading companies for successful career opportunities.</p>
                <div class="hero-btns-container">
                    <a href="#" class="btn btn-start">Get Started</a>
                    <a href="#" class="btn btn-partner">Our Partners</a>
                </div>
            </div>
            <!-- Right Side -->
            <div class="col-lg-6 text-center">
                <!-- Ensure path to job.jpg is correct -->
                <img src="images/job.jpg" class="img-fluid hero-image" alt="Placement Image">
            </div>
        </div>
    </div>
</section>

<!-- Login As Section -->
<section class="login-section">
    <div class="container">
        <h2 class="section-title">Login As</h2>

        <div class="row g-4">

            <!-- Student Card -->
            <div class="col-lg-4 col-md-6">
                <div class="login-card student">
                    <i class="fa-solid fa-user-graduate"></i>
                    <h3>Student</h3>
                    <p>
                        Access your profile, browse job opportunities,
                        apply to companies, upload your resume,
                        and track your placement applications.
                    </p>

                    <a href="student_login.jsp" class="login-btn">
                        Student Login
                    </a>
                </div>
            </div>

            <!-- Recruiter Card -->
            <div class="col-lg-4 col-md-6">
                <div class="login-card recruiter">
                    <i class="fa-solid fa-building"></i>
                    <h3>Recruiter</h3>
                    <p>
                        Post new job openings, manage campus recruitment drives,
                        shortlist students, and schedule interviews.
                    </p>

                    <a href="recruiter_login.jsp" class="login-btn">
                        Recruiter Login
                    </a>
                </div>
            </div>

            <!-- Admin Card -->
            <div class="col-lg-4 col-md-12">
                <div class="login-card admin">
                    <i class="fa-solid fa-user-shield"></i>
                    <h3>Admin</h3>
                    <p>
                        Manage students, recruiters, companies,
                        placement activities, reports,
                        announcements, and portal settings.
                    </p>

                    <a href="admin_Login.jsp" class="login-btn">
                        Admin Login
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Footer -->
<footer class="footer">
<div class="container">
<h5> <i class="fa-solid fa-graduation-cap"></i>Campus Placement Portal</h5>
<p>Empowering students with career opportunities.</p>
<p>© 2026 Campus Placement Portal </p>
</div>
</footer>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>