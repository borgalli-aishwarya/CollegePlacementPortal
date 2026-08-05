<%-- 
    Document   : managejobs.jsp
    Created on : 2 Aug, 2026, 3:41:46 PM
    Author     : Aishwarya
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Jobs | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
html, body {height:100%;margin:0;display:flex;flex-direction:column;}
body {background:#f5f7fc;font-family:Poppins,sans-serif;}
.navbar, footer {background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);}
.navbar-brand,.nav-link,footer {color:#fff!important}
footer {margin-top:auto;text-align:center;padding:15px 0;}
.card {box-shadow:0 2px 6px rgba(0,0,0,.1);transition:transform .2s;}
.card:hover {transform:scale(1.03);}
</style>
</head>
<body>

<!-- Header -->
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
Home
</a>
</li>




</ul>

</div>

</div>

</nav>

<!-- Centered Cards -->
<div class="container mt-5">

    <h1 class="text-center mb-5 text-primary">
        Manage Posted Jobs
    </h1>

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="card shadow-sm p-5 text-center">

                <i class="fa-solid fa-briefcase fa-3x text-secondary mb-3"></i>

                <h4>No Jobs Posted Yet</h4>

                <p class="text-muted">
                    You haven't posted any jobs yet.
                    Click on <b>Post Job</b> from the dashboard to create your first job posting.
                </p>

            </div>

        </div>

    </div>

</div>


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

