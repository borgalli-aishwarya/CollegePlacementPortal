<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Job | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
html, body {height:100%;margin:0;display:flex;flex-direction:column;}
body {background:#f5f7fc;font-family:Poppins,sans-serif;}
.navbar, footer {background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);}
.navbar-brand,.nav-link,footer {color:#fff!important}
footer {margin-top:auto;text-align:center;padding:15px 0;}
.card {box-shadow:0 2px 6px rgba(0,0,0,.1);}
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

<!-- Centered Form Card -->
<div class="container mt-5 flex-grow-1 d-flex justify-content-center">
  <div class="card p-4" style="max-width:700px; width:100%;">
    <h2 class="text-center text-primary mb-4">Post a New Job</h2>
    <form action="PostJobServlet" method="post">
      <div class="mb-3"><label>Job Title</label><input type="text" name="title" class="form-control" required></div>
      <div class="mb-3"><label>Company</label><input type="text" name="company" class="form-control" required></div>
      <div class="mb-3"><label>Type</label>
        <select name="type" class="form-control">
          <option>Internship</option>
          <option>Job</option>
        </select>
      </div>
      <div class="mb-3"><label>Requirements</label><textarea name="requirements" class="form-control"></textarea></div>
      <div class="mb-3"><label>Technical Skills</label><textarea name="skills" class="form-control"></textarea></div>
      <div class="mb-3"><label>Duration (for Internship)</label><input type="text" name="duration" class="form-control"></div>
      <div class="mb-3"><label>Stipend/Salary</label><input type="text" name="stipend" class="form-control"></div>
      <div class="mb-3"><label>Deadline</label><input type="date" name="deadline" class="form-control"></div>
      <button class="btn btn-success w-100">Post Job</button>
    </form>
  </div>
</div>

<!-- Footer -->
<footer>
  Campus Placement Portal – Empowering recruiters with talent opportunities<br>
  © 2026 Campus Placement Portal | All Rights Reserved
</footer>
</body>
</html>
