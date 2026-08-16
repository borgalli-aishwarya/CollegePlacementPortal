<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
    // Check admin login
    String adminUsername = (String) session.getAttribute("adminUsername");

    if (adminUsername == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Applications | Admin | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

*{
    box-sizing:border-box;
    font-family:Poppins,sans-serif;
}

body{
    margin:0;
    background:#f5f7fc;
}

/* Navbar */

.navbar{
    background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
}

.navbar-brand,
.nav-link{
    color:white !important;
}

.nav-link{
    margin-left:15px;
    font-weight:500;
}

.nav-link:hover{
    color:#ffd700 !important;
}

/* Main */

.main-container{
    margin-top:40px;
    margin-bottom:50px;
}

.page-title{
    color:#3b4cb8;
    font-weight:600;
}

/* Card */

.application-card{
    border:none;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,.10);
}

/* Table */

.table{
    vertical-align:middle;
}

.table th{
    text-align:center;
    white-space:nowrap;
}

.table td{
    text-align:center;
    vertical-align:middle;
}

/* Footer */

.footer{
    background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
    color:white;
    padding:25px;
    text-align:center;
    margin-top:50px;
}

</style>

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand fw-bold"
   href="adminDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>


<button class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>


<div class="collapse navbar-collapse"
     id="navbarNav">

<ul class="navbar-nav ms-auto">


<!-- Dashboard -->

<li class="nav-item">

<a class="nav-link"
   href="adminDashboard.jsp">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

</li>


<!-- Students -->

<li class="nav-item">

<a class="nav-link"
   href="adminStudents.jsp">

<i class="fa-solid fa-users"></i>

Students

</a>

</li>


<!-- Recruiters -->

<li class="nav-item">

<a class="nav-link"
   href="adminRecruiters.jsp">

<i class="fa-solid fa-building"></i>

Recruiters

</a>

</li>


<!-- Jobs -->

<li class="nav-item">

<a class="nav-link"
   href="adminJobs.jsp">

<i class="fa-solid fa-briefcase"></i>

Jobs

</a>

</li>


<!-- Applications -->

<li class="nav-item">

<a class="nav-link active"
   href="adminApplications.jsp">

<i class="fa-solid fa-file-lines"></i>

Applications

</a>

</li>


<!-- Logout -->

<li class="nav-item ms-3">

<a class="btn btn-light ms-3"
   href="AdminLogoutServlet">

    <i class="fa-solid fa-right-from-bracket"></i>

    Logout

</a>

</li>


</ul>

</div>

</div>

</nav>


<!-- ================= MAIN ================= -->

<div class="container main-container">


<h2 class="text-center page-title mb-4">

<i class="fa-solid fa-file-lines"></i>

All Applications

</h2>


<div class="card application-card">

<div class="card-body">


<div class="table-responsive">

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>ID</th>

<th>Student</th>

<th>Email</th>

<th>Job</th>

<th>Company</th>

<th>Status</th>

<th>Applied On</th>

</tr>

</thead>


<tbody>


<%

Connection con = null;

PreparedStatement ps = null;

ResultSet rs = null;

boolean found = false;


try {

    database db = new database();

    con = db.connectDB();


    if (con == null) {

        throw new Exception("Database connection failed.");

    }


    /*
     * Get application details
     *
     * applications
     *      ↓
     * students
     *      ↓
     * jobs
     */

    String sql =
        "SELECT a.id, " +
        "s.name AS student_name, " +
        "s.email AS student_email, " +
        "j.title AS job_title, " +
        "j.company AS company_name, " +
        "a.status, " +
        "a.applied_on " +
        "FROM applications a " +
        "INNER JOIN students s ON a.student_id = s.id " +
        "INNER JOIN jobs j ON a.job_id = j.id " +
        "ORDER BY a.id DESC";


    ps = con.prepareStatement(sql);

    rs = ps.executeQuery();


    while (rs.next()) {

        found = true;

        String status = rs.getString("status");

%>


<tr>


<!-- Application ID -->

<td>

<%= rs.getInt("id") %>

</td>


<!-- Student -->

<td>

<%= rs.getString("student_name") %>

</td>


<!-- Email -->

<td>

<%= rs.getString("student_email") %>

</td>


<!-- Job -->

<td>

<%= rs.getString("job_title") %>

</td>


<!-- Company -->

<td>

<%= rs.getString("company_name") %>

</td>


<!-- Status -->

<td>

<%

if ("Applied".equals(status)) {

%>

<span class="badge bg-primary">

Applied

</span>

<%

} else if ("Shortlisted".equals(status)) {

%>

<span class="badge bg-warning text-dark">

Shortlisted

</span>

<%

} else if ("Rejected".equals(status)) {

%>

<span class="badge bg-danger">

Rejected

</span>

<%

} else if ("Selected".equals(status)) {

%>

<span class="badge bg-success">

Selected

</span>

<%

} else {

%>

<span class="badge bg-secondary">

<%= status %>

</span>

<%

}

%>

</td>


<!-- Applied Date -->

<td>

<%= rs.getString("applied_on") %>

</td>


</tr>


<%

    }


    if (!found) {

%>


<tr>

<td colspan="7"
    class="text-center text-muted py-4">

<i class="fa-solid fa-circle-info"></i>

No applications found.

</td>

</tr>


<%

    }


} catch (Exception e) {

%>


<tr>

<td colspan="7"
    class="text-danger text-center py-4">

<i class="fa-solid fa-triangle-exclamation"></i>

Database Error:

<%= e.getMessage() %>

</td>

</tr>


<%

    e.printStackTrace();

} finally {


    try {

        if (rs != null)
            rs.close();

    } catch (Exception e) {
    }


    try {

        if (ps != null)
            ps.close();

    } catch (Exception e) {
    }


    try {

        if (con != null)
            con.close();

    } catch (Exception e) {
    }

}

%>


</tbody>

</table>

</div>

</div>

</div>

</div>


<!-- ================= FOOTER ================= -->

<footer class="footer">

<div class="container">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>

Admin Application Management

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