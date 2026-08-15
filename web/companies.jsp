<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
    Integer studentId = (Integer) session.getAttribute("studentId");
    boolean studentLoggedIn = (studentId != null);
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Companies | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

body {
    margin: 0;
    background: #f5f7fc;
    font-family: Poppins, sans-serif;
}

.navbar {
    background: linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
}

.navbar-brand,
.nav-link {
    color: white !important;
}

.nav-link {
    margin-left: 15px;
    font-weight: 500;
}

.nav-link:hover {
    color: #ffd700 !important;
}

.company-card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0,0,0,.12);
    margin-bottom: 25px;
}

.footer {
    background: linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
    color: white;
    padding: 25px;
    text-align: center;
    margin-top: 50px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand fw-bold"
   href="<%= studentLoggedIn ? "studentDashboard.jsp" : "index.jsp" %>">

<i class="fa-solid fa-graduation-cap"></i>
Campus Placement Portal

</a>

<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link"
   href="<%= studentLoggedIn ? "studentDashboard.jsp" : "index.jsp" %>">

<i class="fa-solid fa-house"></i>

<%= studentLoggedIn ? "Dashboard" : "Home" %>

</a>
</li>

<li class="nav-item">
<a class="nav-link" href="jobs.jsp">

<i class="fa-solid fa-briefcase"></i>
Jobs

</a>
</li>

<li class="nav-item">
<a class="nav-link active" href="companies.jsp">

<i class="fa-solid fa-building"></i>
Companies

</a>
</li>

<% if(studentLoggedIn) { %>

<li class="nav-item">
<a class="nav-link" href="view_applications.jsp">

<i class="fa-solid fa-file-lines"></i>
My Applications

</a>
</li>

<li class="nav-item ms-3">
<a class="btn btn-light" href="index.jsp">

<i class="fa-solid fa-right-from-bracket"></i>
Logout

</a>
</li>

<% } else { %>

<li class="nav-item ms-3">
<a class="btn btn-light" href="student_login.jsp">

<i class="fa-solid fa-right-to-bracket"></i>
Login

</a>
</li>

<li class="nav-item ms-2">
<a class="btn btn-warning" href="student_register.jsp">

<i class="fa-solid fa-user-plus"></i>
Register

</a>
</li>

<% } %>

</ul>

</div>

</nav>


<!-- COMPANIES -->

<div class="container mt-5">

<h2 class="text-center text-primary mb-4">

<i class="fa-solid fa-building"></i>
Companies

</h2>

<div class="row">

<%

database db = new database();
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    con = db.connectDB();

    if (con == null) {
        throw new Exception("Database connection failed.");
    }

    String sql =
        "SELECT id, company_name, hr_contact_person, email, phone, " +
        "job_title, industry, location, website_url, status " +
        "FROM recruiters " +
        "WHERE status = 'Approved' " +
        "ORDER BY id DESC";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();

    boolean found = false;

    while (rs.next()) {

        found = true;

%>

<div class="col-md-6 col-lg-4">

<div class="card company-card">

<div class="card-body">

<h4 class="text-primary">

<i class="fa-solid fa-building"></i>

<%= rs.getString("company_name") %>

</h4>

<hr>

<p>
<strong>Industry:</strong>
<%= rs.getString("industry") != null
        ? rs.getString("industry")
        : "Not specified" %>
</p>

<p>
<strong>Location:</strong>
<%= rs.getString("location") != null
        ? rs.getString("location")
        : "Not specified" %>
</p>

<p>
<strong>HR Contact:</strong>
<%= rs.getString("hr_contact_person") %>
</p>

<p>
<strong>Job Title:</strong>
<%= rs.getString("job_title") != null
        ? rs.getString("job_title")
        : "Not specified" %>
</p>

<p>
<strong>Email:</strong>
<%= rs.getString("email") %>
</p>

<% if(rs.getString("phone") != null) { %>

<p>
<strong>Phone:</strong>
<%= rs.getString("phone") %>
</p>

<% } %>

<% if(rs.getString("website_url") != null &&
      !rs.getString("website_url").trim().isEmpty()) { %>

<a href="<%= rs.getString("website_url") %>"
   target="_blank"
   class="btn btn-primary">

<i class="fa-solid fa-globe"></i>
Visit Website

</a>

<% } %>

</div>

</div>

</div>

<%

    }

    if (!found) {

%>

<div class="col-12">

<div class="alert alert-warning text-center">

<i class="fa-solid fa-circle-exclamation"></i>

No approved companies available.

</div>

</div>

<%

    }

} catch(Exception e) {

%>

<div class="col-12">

<div class="alert alert-danger text-center">

<strong>Database Error:</strong>

<%= e.getMessage() %>

</div>

</div>

<%

} finally {

    try {
        if (rs != null) rs.close();
    } catch(Exception e) {}

    try {
        if (ps != null) ps.close();
    } catch(Exception e) {}

    try {
        if (con != null) con.close();
    } catch(Exception e) {}

}

%>

</div>

</div>


<!-- FOOTER -->

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