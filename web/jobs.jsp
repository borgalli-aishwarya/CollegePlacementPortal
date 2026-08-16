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

    <title>Jobs | Campus Placement Portal</title>

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

        .job-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,.12);
            margin-bottom: 25px;
        }

        .job-card:hover {
            transform: translateY(-3px);
            transition: .3s;
        }

        .footer {
            background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
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

        <!-- LOGO -->
        <a class="navbar-brand fw-bold"
           href="<%= studentLoggedIn ? "studentDashboard.jsp" : "index.jsp" %>">

            <i class="fa-solid fa-graduation-cap"></i>
            Campus Placement Portal

        </a>


        <ul class="navbar-nav ms-auto align-items-center">

            <% if (studentLoggedIn) { %>

                <!-- ================= STUDENT NAVBAR ================= -->

                <li class="nav-item">
                    <a class="nav-link"
                       href="studentDashboard.jsp">

                        <i class="fa-solid fa-house"></i>
                        Dashboard

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link active"
                       href="jobs.jsp">

                        <i class="fa-solid fa-briefcase"></i>
                        Jobs

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link"
                       href="companies.jsp">

                        <i class="fa-solid fa-building"></i>
                        Companies

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link"
                       href="view_applications.jsp">

                        <i class="fa-solid fa-file-lines"></i>
                        My Applications

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link"
                       href="updateresume.jsp">

                        <i class="fa-solid fa-file-arrow-up"></i>
                        Update Resume

                    </a>
                </li>


                <li class="nav-item ms-3">
                    <a class="btn btn-light"
                       href="index.jsp">

                        <i class="fa-solid fa-right-from-bracket"></i>
                        Logout

                    </a>
                </li>


            <% } else { %>

                <!-- ================= PUBLIC NAVBAR ================= -->

                <li class="nav-item">
                    <a class="nav-link"
                       href="index.jsp">

                        <i class="fa-solid fa-house"></i>
                        Home

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link active"
                       href="jobs.jsp">

                        <i class="fa-solid fa-briefcase"></i>
                        Jobs

                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link"
                       href="companies.jsp">

                        <i class="fa-solid fa-building"></i>
                        Companies

                    </a>
                </li>


                <li class="nav-item ms-3">
                    <a class="btn btn-light"
                       href="student_login.jsp">

                        <i class="fa-solid fa-right-to-bracket"></i>
                        Login

                    </a>
                </li>


                <li class="nav-item ms-2">
                    <a class="btn btn-warning"
                       href="student_register.jsp">

                        <i class="fa-solid fa-user-plus"></i>
                        Register

                    </a>
                </li>

            <% } %>

        </ul>

    </div>

</nav>


<!-- JOBS -->

<div class="container mt-5">

    <h2 class="text-center text-primary mb-4">

        <i class="fa-solid fa-briefcase"></i>
        Available Jobs

    </h2>


<%

    database db = new database();

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    boolean foundJobs = false;

    try {

        con = db.connectDB();

        if (con == null) {

            throw new Exception("Unable to connect to database.");

        }

        String sql = "SELECT * FROM jobs ORDER BY id DESC";

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();


        while (rs.next()) {

            foundJobs = true;

%>


    <!-- JOB CARD -->

    <div class="card job-card">

        <div class="card-body">

            <h3 class="text-primary">

                <%= rs.getString("title") %>

            </h3>


            <h5 class="text-muted">

                <i class="fa-solid fa-building"></i>

                <%= rs.getString("company") %>

            </h5>


            <hr>


            <p>
                <b>Role:</b>
                <%= rs.getString("role_type") %>
            </p>


            <p>
                <b>Requirements:</b>
                <%= rs.getString("requirements") %>
            </p>


            <p>
                <b>Technical Skills:</b>
                <%= rs.getString("technical_skills") %>
            </p>


            <p>
                <b>Duration:</b>
                <%= rs.getInt("duration_months") %> Months
            </p>


            <p>
                <b>Salary / Stipend:</b>
                <%= rs.getString("stipend_salary") %>
            </p>


            <p>
                <b>Last Date:</b>
                <%= rs.getDate("deadline") %>
            </p>


            <% if (studentLoggedIn) { %>

                <form action="applyjobservlet" method="post">

                    <input type="hidden"
                           name="jobId"
                           value="<%= rs.getInt("id") %>">

                    <button type="submit"
                            class="btn btn-primary">

                        <i class="fa-solid fa-paper-plane"></i>
                        Apply Now

                    </button>

                </form>

            <% } else { %>

                <a href="student_login.jsp"
                   class="btn btn-primary">

                    <i class="fa-solid fa-right-to-bracket"></i>
                    Login to Apply

                </a>

            <% } %>

        </div>

    </div>


<%

        }


        if (!foundJobs) {

%>

            <div class="alert alert-warning text-center">

                <i class="fa-solid fa-circle-exclamation"></i>

                No Jobs Available

            </div>

<%

        }

    } catch (Exception e) {

%>

        <div class="alert alert-danger">

            <strong>Database Error:</strong>

            <%= e.getMessage() %>

        </div>

<%

        e.printStackTrace();

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception e) {
        }

        try {
            if (ps != null) ps.close();
        } catch (Exception e) {
        }

        try {
            if (con != null) con.close();
        } catch (Exception e) {
        }

    }

%>

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