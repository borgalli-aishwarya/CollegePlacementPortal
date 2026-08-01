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
.navbar {
    background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
    padding: 18px 0;
    box-shadow: 0 5px 20px rgba(0,0,0,.12);
}
.navbar-brand {
    display: flex;
    align-items: center;
    font-size: 32px; /* Adjusted slightly smaller to match image text-to-logo ratio */
    font-weight: 700;
    color: white !important;
}
.navbar-brand img {
    width: 50px; /* Adjusted slightly to match image */
    margin-right: 15px;
}
.nav-link {
    color: white !important;
    font-size: 17px; /* Matches image better */
    margin-left: 20px;
    font-weight: 500;
    transition: .3s;
}
.nav-link:hover {
    color: #ddd !important;
}
/* Login link color and icon from image */
.nav-link.dropdown-toggle {
    color: #ffd04b !important; /* Matches image yellow-orange login icon */
}
.nav-link.dropdown-toggle i {
    margin-right: 8px;
}
/* Sign Up Button - Transparent with white border as per image */
.signup-btn {
    border: 2px solid white;
    background-color: transparent;
    color: white;
    padding: 10px 25px;
    border-radius: 8px;
    font-weight: 600;
}
.signup-btn:hover {
    background: white;
    color: #3f51e8;
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

</style>
</head>
<body>
<!-- Navbar Section -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <!-- Ensure path to logo.png is correct -->
            <img src="<%=request.getContextPath()%>/images/logo.png" alt="Campus Placement Portal Logo">
            Campus Placement Portal
        </a>
        <button class="navbar-toggler bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="menu">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Jobs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Companies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-right-to-bracket"></i>Login
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                        <li><a class="dropdown-item" href="studentLogin.jsp">Student</a></li>
                        <li><a class="dropdown-item" href="recruiterLogin.jsp">Recruiter</a></li>
                        <li><a class="dropdown-item" href="adminLogin.jsp">Admin</a></li>
                    </ul>
                </li>
                <li class="nav-item ms-3">
                    <a href="register.jsp" class="btn signup-btn">Sign Up</a>
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
                <h1>Welcome to College<br>Placement Portal</h1>
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
                    <p>Access your profile, browse job opportunities, apply to companies, upload your resume, and track your placement applications.</p>
                    <a href="studentLogin.jsp" class="login-btn">Student Login</a>
                </div>
            </div>
            <!-- Recruiter Card -->
            <div class="col-lg-4 col-md-6">
                <div class="login-card recruiter">
                    <i class="fa-solid fa-building"></i>
                    <h3>Recruiter</h3>
                    <p>Post new job openings, manage campus recruitment drives, shortlist students, and schedule interviews.</p>
                    <a href="recruiterLogin.jsp" class="login-btn">Recruiter Login</a>
                </div>
            </div>
            <!-- Admin Card -->
            <div class="col-lg-4 col-md-12">
                <div class="login-card admin">
                    <i class="fa-solid fa-user-shield"></i>
                    <h3>Admin</h3>
                    <p>Manage students, recruiters, companies, placement activities, reports, announcements, and portal settings.</p>
                    <a href="adminLogin.jsp" class="login-btn">Admin Login</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="main-footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h3 class="footer-logo-title">Placement Portal</h3>
                <p>Helping students achieve their dream careers by connecting them with top companies through a smart placement management system.</p>
            </div>
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h4>Quick Links</h4>
                <ul class="list-unstyled">
                    <li><a href="index.jsp" class="text-white text-decoration-none">Home</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Jobs</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Companies</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h4>Contact Us</h4>
                <p><i class="fa-solid fa-envelope"></i>placementportal@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i>+91 8086xxxxxx</p>
               
            </div>
        </div>
        <hr>
        <p class="text-center mb-0">© 2026 College Placement Portal.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>