<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Dashboard | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
html, body {height:100%;margin:0;display:flex;flex-direction:column;}
body {background:#f5f7fc;font-family:Poppins,sans-serif;}
.navbar, footer {background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);}
.navbar-brand,.nav-link,footer {color:#fff!important}
footer {margin-top:auto;text-align:center;padding:15px 0;}
.card {box-shadow:0 2px 6px rgba(0,0,0,.1);transition:transform .2s;cursor:pointer;}
.card:hover {transform:scale(1.03);}
</style>
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="recruiterDashboard.jsp">Campus Placement Portal</a>
    <ul class="navbar-nav ms-auto">
      <li class="nav-item"><a class="nav-link" href="postJob.jsp">Post Job</a></li>
      <li class="nav-item"><a class="nav-link" href="manageJobs.jsp">Manage Jobs</a></li>
      <li class="nav-item"><a class="nav-link" href="viewApplicationsRecruiter.jsp">View Applications</a></li>
      <li class="nav-item ms-3"><a class="btn btn-light" href="recruiterLogin.jsp">Logout</a></li>
    </ul>
  </div>
</nav>

<!-- Centered Cards -->
<div class="container mt-5 flex-grow-1">
  <h2 class="text-center text-primary mb-4">Recruiter Dashboard</h2>
  <div class="d-flex justify-content-center">
    <div class="row g-4" style="max-width:1000px;">
      <div class="col-md-4">
        <div class="card p-4 text-center" onclick="location.href='postJob.jsp'">
          <h5 class="card-title">Post Job</h5>
          <p class="card-text">Create new job or internship postings with requirements, skills, stipend/salary, and deadlines.</p>
          <a href="postJob.jsp" class="btn btn-primary">Manage Posting</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card p-4 text-center" onclick="location.href='manageJobs.jsp'">
          <h5 class="card-title">Manage Jobs</h5>
          <p class="card-text">View, edit, or delete your posted jobs. Keep postings updated for students.</p>
          <a href="manageJobs.jsp" class="btn btn-primary">Manage Jobs</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card p-4 text-center" onclick="location.href='viewApplicationsRecruiter.jsp'">
          <h5 class="card-title">View Applications</h5>
          <p class="card-text">Browse student applications, review resumes, and shortlist candidates.</p>
          <a href="viewApplicationsRecruiter.jsp" class="btn btn-primary">View Applications</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  Campus Placement Portal – Empowering recruiters with talent opportunities<br>
  © 2026 Campus Placement Portal | All Rights Reserved
</footer>
</body>
</html>
