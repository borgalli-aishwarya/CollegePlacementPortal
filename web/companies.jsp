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

* {
    box-sizing: border-box;
    font-family: Poppins, sans-serif;
}

body {
    margin: 0;
    background: #f5f7fc;
    min-height: 100vh;
}

.navbar {
    background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
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

.page-title {
    color: #1769ff;
    font-weight: 600;
    margin-top: 50px;
    margin-bottom: 40px;
    text-align: center;
}

.company-card {
    border: none;
    border-radius: 18px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    margin-bottom: 30px;
    transition: 0.3s;
    height: 100%;
}

.company-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.16);
}

.company-name {
    color: #1769ff;
    font-size: 28px;
    font-weight: 600;
}

.company-info {
    font-size: 18px;
    margin-bottom: 20px;
}

.company-info strong {
    color: #111;
}

.website-btn {
    background: #1769ff;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 10px 16px;
    text-decoration: none;
    display: inline-block;
}

.website-btn:hover {
    background: #0d5bd7;
    color: white;
}

.footer {
    background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
    color: white;
    padding: 25px;
    text-align: center;
    margin-top: 60px;
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

        <ul class="navbar-nav ms-auto align-items-center">

            <% if (studentLoggedIn) { %>

                <!-- STUDENT NAVBAR -->

                <li class="nav-item">
                    <a class="nav-link" href="studentDashboard.jsp">
                        <i class="fa-solid fa-house"></i>
                        Dashboard
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

                <li class="nav-item">
                    <a class="nav-link" href="view_applications.jsp">
                        <i class="fa-solid fa-file-lines"></i>
                        My Applications
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="updateresume.jsp">
                        <i class="fa-solid fa-file-arrow-up"></i>
                        Update Resume
                    </a>
                </li>

                <li class="nav-item ms-3">
                    <a class="btn btn-light" href="index.jsp">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Logout
                    </a>
                </li>

            <% } else { %>

                <!-- PUBLIC NAVBAR -->

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fa-solid fa-house"></i>
                        Home
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

<!-- PAGE TITLE -->

<div class="container">

    <h1 class="page-title">

        <i class="fa-solid fa-building"></i>
        Companies

    </h1>


    <div class="row">

<%

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    database db = new database();

    con = db.connectDB();

    if (con == null) {

%>

        <div class="col-12">

            <div class="alert alert-danger text-center">

                Unable to connect to database.

            </div>

        </div>

<%

    } else {

        String sql =
            "SELECT id, company_name, hr_contact_person, email, phone, " +
            "industry, location, website_url, status " +
            "FROM recruiters " +
            "ORDER BY id DESC";

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        boolean found = false;

        while (rs.next()) {

            found = true;

%>

        <div class="col-md-6 col-lg-4 mb-4">

            <div class="card company-card">

                <div class="card-body p-4">

                    <h3 class="company-name">

                        <i class="fa-solid fa-building"></i>

                        <%= rs.getString("company_name") %>

                    </h3>

                    <hr>


                    <p class="company-info">

                        <strong>Industry:</strong>

                        <%= rs.getString("industry") != null
                            ? rs.getString("industry")
                            : "Not specified" %>

                    </p>


                    <p class="company-info">

                        <strong>Location:</strong>

                        <%= rs.getString("location") != null
                            ? rs.getString("location")
                            : "Not specified" %>

                    </p>


                    <p class="company-info">

                        <strong>HR Contact:</strong>

                        <%= rs.getString("hr_contact_person") != null
                            ? rs.getString("hr_contact_person")
                            : "Not specified" %>

                    </p>


                    <p class="company-info">

                        <strong>Email:</strong>

                        <%= rs.getString("email") != null
                            ? rs.getString("email")
                            : "Not specified" %>

                    </p>


                    <p class="company-info">

                        <strong>Phone:</strong>

                        <%= rs.getString("phone") != null
                            ? rs.getString("phone")
                            : "Not specified" %>

                    </p>


                    <% if (rs.getString("website_url") != null
                           && !rs.getString("website_url").trim().isEmpty()) { %>

                        <a href="<%= rs.getString("website_url") %>"
                           target="_blank"
                           class="website-btn">

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

                No companies registered yet.

            </div>

        </div>

<%

        }

    }

} catch (Exception e) {

%>

        <div class="col-12">

            <div class="alert alert-danger">

                <strong>Database Error:</strong>

                <%= e.getMessage() %>

            </div>

        </div>

<%

} finally {

    try {
        if (rs != null) rs.close();
    } catch (Exception e) {}

    try {
        if (ps != null) ps.close();
    } catch (Exception e) {}

    try {
        if (con != null) con.close();
    } catch (Exception e) {}

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