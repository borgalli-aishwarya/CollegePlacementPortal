<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Student Dashboard | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

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

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold" href="studentDashboard.jsp">
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
                    <a class="nav-link active" href="studentDashboard.jsp">
                        <i class="fa-solid fa-house"></i> Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="jobs.jsp">
                        <i class="fa-solid fa-briefcase"></i> Jobs
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="companies.jsp">
                        <i class="fa-solid fa-building"></i> Companies
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="view_applications.jsp">
                        <i class="fa-solid fa-file-circle-check"></i> My Applications
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="updateresume.jsp">
                        <i class="fa-solid fa-file-arrow-up"></i> Update Resume
                    </a>
                </li>

                <li class="nav-item ms-3">
                    <a class="btn btn-light" href="index.jsp">
                        <i class="fa-solid fa-right-from-bracket"></i> Logout
                    </a>
                </li>

            </ul>

        </div>

    </div>
</nav>

<section class="dashboard-section">

<div class="container">

<div class="welcome-box">

<h2 class="fw-bold">

Welcome, Student 👋

</h2>

<p class="text-muted mt-3">

Browse campus jobs, apply for placement drives,
track applications and keep your resume updated.

</p>

</div>

<div class="row g-4">

<!-- View Jobs Card -->
<div class="col-lg-4 col-md-6">

    <div class="card-box text-center">

        <i class="fa-solid fa-briefcase fa-2x text-primary mb-3"></i>

        <h5>View Jobs</h5>

        <p>
            Browse the latest campus placement opportunities and apply for jobs.
        </p>

        <a href="jobs.jsp" class="btn btn-primary w-100">
            View Jobs
        </a>

    </div>

</div>

<!-- My Applications Card -->
<div class="col-lg-4 col-md-6">

    <div class="card-box text-center">

        <i class="fa-solid fa-list-check fa-2x text-success mb-3"></i>

        <h5>My Applications</h5>

        <p>
            Check the status of all your job applications in one place.
        </p>

        <a href="view_applications.jsp" class="btn btn-success w-100">
            View Applications
        </a>

    </div>

</div>

<!-- Update Resume Card -->
<div class="col-lg-4 col-md-6">

    <div class="card-box text-center">

        <i class="fa-solid fa-file-arrow-up fa-2x text-warning mb-3"></i>

        <h5>Update Resume</h5>

        <p>
            Upload or update your latest resume for recruiters.
        </p>

        <a href="updateresume.jsp" class="btn btn-warning w-100">
            Update Resume
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>