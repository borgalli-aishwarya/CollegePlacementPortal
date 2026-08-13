<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="modell.job" %>

<%
    String companyName =
            (String) session.getAttribute("companyName");

    if (companyName == null) {
        response.sendRedirect("recruiterLogin.jsp");
        return;
    }

    List<job> jobs =
            (List<job>) request.getAttribute("jobs");

    String successMessage =
            (String) request.getAttribute("successMessage");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Manage Jobs | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Poppins, sans-serif;
}

body {
    background: #f5f7fc;
    min-height: 100vh;
}

.navbar,
.footer {
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );
}

.navbar-brand,
.nav-link {
    color: white !important;
}

.nav-link {
    margin-left: 18px;
    font-weight: 500;
}

.main-section {
    padding: 45px 0;
    min-height: 75vh;
}

.page-title {
    color: #3b4cb8;
    font-weight: 700;
}

.page-subtitle {
    color: #6c757d;
    margin-bottom: 35px;
}

.alert {
    border-radius: 10px;
}

.job-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    margin-bottom: 25px;
    box-shadow: 0 8px 25px rgba(0,0,0,.10);
    transition: .3s;
}

.job-card:hover {
    transform: translateY(-4px);
}

.job-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
}

.job-title {
    color: #3b4cb8;
    font-weight: 700;
    margin-bottom: 8px;
}

.company-name {
    color: #555;
    font-weight: 500;
}

.role-badge {
    background: #e8eaff;
    color: #3b4cb8;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: 600;
}

.divider {
    border-top: 1px solid #eee;
    margin: 20px 0;
}

.info-title {
    font-weight: 600;
    color: #444;
    margin-bottom: 6px;
}

.info-text {
    color: #666;
}

.info-box {
    background: #f8f9fc;
    padding: 15px;
    border-radius: 10px;
    height: 100%;
}

.info-icon {
    color: #3b4cb8;
    margin-right: 5px;
}

.action-buttons {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}

.edit-btn {
    background: #ffc107;
    color: #212529;
    font-weight: 600;
}

.edit-btn:hover {
    background: #e0a800;
}

.delete-btn {
    background: #dc3545;
    color: white;
    font-weight: 600;
}

.delete-btn:hover {
    background: #bb2d3b;
    color: white;
}

.empty-card {
    background: white;
    border-radius: 15px;
    padding: 50px;
    text-align: center;
    box-shadow: 0 8px 25px rgba(0,0,0,.10);
}

.empty-icon {
    color: #adb5bd;
    margin-bottom: 20px;
}

.footer {
    color: white;
    padding: 25px 0;
    text-align: center;
}

</style>

</head>

<body>


<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand fw-bold"
   href="recruiterDashboard.jsp">

    <i class="fa-solid fa-graduation-cap"></i>
    Campus Placement Portal

</a>

<button class="navbar-toggler bg-light"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav">

    <span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
     id="navbarNav">

<ul class="navbar-nav ms-auto">

<li class="nav-item">

<a class="nav-link"
   href="recruiterDashboard.jsp">

    <i class="fa-solid fa-house"></i>
    Dashboard

</a>

</li>

<li class="nav-item">

<a class="nav-link active"
   href="ManageJobsServlet">

    <i class="fa-solid fa-briefcase"></i>
    Manage Jobs

</a>

</li>

<li class="nav-item">

<a class="nav-link"
   href="posts.jsp">

    <i class="fa-solid fa-plus"></i>
    Post Job

</a>

</li>

<li class="nav-item ms-3">

<a class="btn btn-light"
   href="index.jsp">

    <i class="fa-solid fa-right-from-bracket"></i>
    Logout

</a>

</li>

</ul>

</div>

</div>

</nav>


<!-- MAIN -->

<section class="main-section">

<div class="container">


<div class="text-center">

<h1 class="page-title">

    <i class="fa-solid fa-briefcase"></i>

    Manage Posted Jobs

</h1>

<p class="page-subtitle">

    Jobs posted by
    <strong><%= companyName %></strong>

</p>

</div>


<!-- SUCCESS MESSAGE -->

<%
if (successMessage != null) {
%>

<div class="alert alert-success alert-dismissible fade show">

    <i class="fa-solid fa-circle-check"></i>

    <strong><%= successMessage %></strong>

    <button type="button"
            class="btn-close"
            data-bs-dismiss="alert">
    </button>

</div>

<%
}
%>


<!-- ERROR MESSAGE -->

<%
if (error != null) {
%>

<div class="alert alert-danger">

    <i class="fa-solid fa-circle-exclamation"></i>

    <%= error %>

</div>

<%
}
%>


<%
if (jobs != null && !jobs.isEmpty()) {

    for (job j : jobs) {
%>


<!-- JOB CARD -->

<div class="job-card">


<div class="job-header">

<div>

<h3 class="job-title">

    <%= j.getTitle() %>

</h3>

<div class="company-name">

    <i class="fa-solid fa-building"></i>

    <%= j.getCompany() %>

</div>

</div>


<span class="role-badge">

    <%= j.getRoleType() %>

</span>

</div>


<div class="divider"></div>


<!-- REQUIREMENTS + SKILLS -->

<div class="row">


<div class="col-md-6 mb-3">

<div class="info-title">

    Requirements

</div>

<div class="info-text">

    <%= j.getRequirements() %>

</div>

</div>


<div class="col-md-6 mb-3">

<div class="info-title">

    Technical Skills

</div>

<div class="info-text">

    <%= j.getTechnicalSkills() %>

</div>

</div>


</div>


<!-- JOB DETAILS -->

<div class="row">


<div class="col-md-4 mb-3">

<div class="info-box">

<div class="info-title">

<i class="fa-solid fa-clock info-icon"></i>

Duration

</div>

<div class="info-text">

<%= j.getDurationMonths() %> Months

</div>

</div>

</div>


<div class="col-md-4 mb-3">

<div class="info-box">

<div class="info-title">

<i class="fa-solid fa-money-bill-wave info-icon"></i>

Salary / Stipend

</div>

<div class="info-text">

<%= j.getStipendSalary() %>

</div>

</div>

</div>


<div class="col-md-4 mb-3">

<div class="info-box">

<div class="info-title">

<i class="fa-solid fa-calendar-days info-icon"></i>

Deadline

</div>

<div class="info-text">

<%= j.getDeadline() %>

</div>

</div>

</div>


</div>


<!-- BUTTONS -->

<div class="action-buttons">


<a href="EditJobServlet?id=<%= j.getId() %>"
   class="btn edit-btn">

    <i class="fa-solid fa-pen-to-square"></i>

    Edit

</a>


<form action="DeleteJobServlet"
      method="post"
      style="display:inline;"
      onsubmit="return confirm('Are you sure you want to delete this job?');">

<input type="hidden"
       name="id"
       value="<%= j.getId() %>">

<button type="submit"
        class="btn delete-btn">

    <i class="fa-solid fa-trash"></i>

    Delete

</button>

</form>


</div>


</div>


<%
    }

} else {
%>


<!-- NO JOBS -->

<div class="empty-card">

<i class="fa-solid fa-briefcase fa-3x empty-icon"></i>

<h3>No Jobs Posted Yet</h3>

<p class="text-muted">

    You haven't posted any jobs yet.

</p>

<a href="posts.jsp"
   class="btn btn-primary">

    <i class="fa-solid fa-plus"></i>

    Post New Job

</a>

</div>


<%
}
%>


</div>

</section>


<!-- FOOTER -->

<footer class="footer">

<div class="container">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>
Empowering recruiters to hire talented students.
</p>

<p>
© 2026 Campus Placement Portal
</p>

</div>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>