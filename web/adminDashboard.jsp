<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:Poppins,sans-serif}
    html, body {
        height: 100%;
        display: flex;
        flex-direction: column;
    }
    body{background:#f5f7fc}
    .navbar,.footer{background:linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8)}
    .navbar-brand,.nav-link{color:#fff!important}
    .nav-link{margin-left:20px}
    .dashboard-section {
        flex: 1; /* take remaining space */
        display: flex;
        align-items: center;   /* vertical center */
        justify-content: center; /* horizontal center */
    }
    .card-box {
        background:#fff;
        padding:25px;
        border-radius:12px;
        box-shadow:0 10px 25px rgba(0,0,0,.1);
        height:100%;
    }
    .footer {
        margin-top: auto; /* push footer to bottom */
        color:#fff;
        padding:25px 0;
        text-align:center;
    }
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
<li class="nav-item"><a class="nav-link" href="students.jsp">Students</a></li>
<li class="nav-item"><a class="nav-link" href="recruiters.jsp">Recruiters</a></li>
<li class="nav-item ms-3"><a class="btn btn-light" href="adminLogin.jsp">Logout</a></li>
</ul></div></div></nav>

<section class="dashboard-section">
<div class="container">
<div class="row g-4 justify-content-center">
    <!-- Recruiter Management -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box">
            <h5><i class="fa-solid fa-building"></i> Recruiter Management</h5>
            <ul class="mt-3">
                <li>Approve/Reject Recruiter Accounts</li>
                <li>View Recruiter Details</li>
                <li>Monitor Job Postings</li>
            </ul>
            <a href="manageRecruiters.jsp" class="btn btn-primary mt-3 w-100">Manage Recruiters</a>
        </div>
    </div>
    <!-- Student Management -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box">
            <h5><i class="fa-solid fa-user-graduate"></i> Student Management</h5>
            <ul class="mt-3">
                <li>View Student Profiles</li>
                <li>Reset Student Accounts</li>
                <li>Track Applications</li>
            </ul>
            <a href="manageStudents.jsp" class="btn btn-primary mt-3 w-100">Manage Students</a>
        </div>
    </div>
    <!-- Reports -->
    <div class="col-lg-4 col-md-6">
        <div class="card-box">
            <h5><i class="fa-solid fa-chart-line"></i> Reports</h5>
            <ul class="mt-3">
                <li>Placement Statistics</li>
                <li>Applications Summary</li>
                <li>Recruiter Activity</li>
            </ul>
            <a href="viewReports.jsp" class="btn btn-primary mt-3 w-100">View Reports</a>
        </div>
    </div>
</div>
</div>
</section>

<footer class="footer">
<div class="container-fluid">
<h5><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</h5>
<p>Admin control panel for managing placements.</p>
<p>© 2028 Campus Placement Portal | All Rights Reserved</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
