<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Jobs | Campus Placement Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
html, body {height:100%;margin:0;display:flex;flex-direction:column;}
body {background:#f5f7fc;font-family:Poppins,sans-serif;}
.navbar, footer {background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);}
.navbar-brand,.nav-link,footer {color:#fff!important}
footer {margin-top:auto;text-align:center;padding:15px 0;}
.card {transition:transform .2s;cursor:pointer;}
.card:hover {transform:scale(1.03);}
</style>
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.jsp">Campus Placement Portal</a>
    <ul class="navbar-nav ms-auto">
      <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
      <li class="nav-item"><a class="nav-link" href="jobs.jsp">Jobs</a></li>
      <li class="nav-item"><a class="nav-link" href="companies.jsp">Companies</a></li>
      <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
      <li class="nav-item ms-3"><a class="btn btn-light" href="studentRegister.jsp">Sign Up</a></li>
    </ul>
  </div>
</nav>

<!-- Job Cards -->
<div class="container mt-5 flex-grow-1">
  <h2 class="text-center text-primary mb-4">Available Jobs</h2>
  <div class="row g-4">
    <!-- Internship Card -->
    <div class="col-md-6">
      <div class="card p-3" data-bs-toggle="modal" data-bs-target="#job1Modal">
        <h5 class="card-title">Telecalling Internship</h5>
        <p class="card-text">RDGT Private Limited</p>
        <span class="badge bg-success">Internship</span>
        <p class="mt-2 text-muted">Deadline: Aug 14, 2026</p>
      </div>
    </div>
    <!-- Job Card -->
    <div class="col-md-6">
      <div class="card p-3" data-bs-toggle="modal" data-bs-target="#job2Modal">
        <h5 class="card-title">Product Manager</h5>
        <p class="card-text">VirtUp</p>
        <span class="badge bg-info">Full-time Job</span>
        <p class="mt-2 text-muted">Deadline: Aug 10, 2026</p>
      </div>
    </div>
  </div>
</div>

<!-- Internship Modal -->
<div class="modal fade" id="job1Modal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Telecalling Internship - RDGT Pvt Ltd</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Type:</strong> Internship (Work From Home)</p>
        <p><strong>Requirements:</strong> UG/PG students, no prior experience</p>
        <p><strong>Technical Skills:</strong> Communication, Customer Service, Goal Orientation, Sales</p>
        <p><strong>Duration:</strong> 3 months</p>
        <p><strong>Stipend:</strong> ₹8,000/month</p>
        <p><strong>Due Date:</strong> Aug 14, 2026</p>
      </div>
      <div class="modal-footer">
        <a href="applyJob.jsp?jobId=1" class="btn btn-success">Apply Now</a>
      </div>
    </div>
  </div>
</div>

<!-- Job Modal -->
<div class="modal fade" id="job2Modal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Product Manager - VirtUp</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Type:</strong> Full-time Job (Contract, Work From Home)</p>
        <p><strong>Requirements:</strong> Open to all, no prior experience required</p>
        <p><strong>Technical Skills:</strong> Collaboration, Data-driven decisions, Roadmapping</p>
        <p><strong>Salary:</strong> ₹15L – 18LPA</p>
        <p><strong>Due Date:</strong> Aug 10, 2026</p>
      </div>
      <div class="modal-footer">
        <a href="applyJob.jsp?jobId=2" class="btn btn-success">Apply Now</a>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="footer">
<div class="container-fluid">
<h5><i class="fa-solid fa-graduation-cap"></i> Campus Placement Portal</h5>
<p>Empowering students with career opportunities.</p>
<p>© 2026 Campus Placement Portal | All Rights Reserved</p>
</div>
</footer>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
