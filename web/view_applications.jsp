<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Applications | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
html, body {height:100%;margin:0;display:flex;flex-direction:column;}
body {background:#f5f7fc;font-family:Poppins,sans-serif;}
.navbar, footer {background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);}
.navbar-brand,.nav-link,footer {color:#fff!important}
footer {margin-top:auto;text-align:center;padding:15px 0;}
</style>
</head>
<body>

<!--< Header -->
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
                        <i class="fa-solid fa-house"></i> Home
                    </a>
                </li>

              

                

            </ul>

        </div>

    </div>
</nav>


<!-- Content -->
<div class="container mt-5 flex-grow-1">
  <h2 class="text-center text-primary mb-4">My Applications</h2>
  <table class="table table-bordered table-striped">
    <thead class="table-dark">
      <tr><th>Job Title</th><th>Company</th><th>Status</th></tr>
    </thead>
    <tbody>
      <tr><td>Software Engineer</td><td>ABC Tech</td><td>Pending</td></tr>
      <tr><td>Telecalling Internship</td><td>RDGT Pvt Ltd</td><td>Shortlisted</td></tr>
    </tbody>
  </table>
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
