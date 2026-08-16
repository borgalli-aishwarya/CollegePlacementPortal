<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
    // ==============================
    // CHECK ADMIN LOGIN
    // ==============================

    Integer adminId = (Integer) session.getAttribute("adminId");
    String adminUsername = (String) session.getAttribute("adminUsername");

    // Your login servlet may currently use adminUser.
    // This handles both names.
    if (adminUsername == null) {
        adminUsername = (String) session.getAttribute("adminUser");
    }

    if (adminId == null) {
        response.sendRedirect("admin_Login.jsp");
        return;
    }

    if (adminUsername == null) {
        adminUsername = "Admin";
    }


    // ==============================
    // COUNTS
    // ==============================

    int studentCount = 0;
    int recruiterCount = 0;
    int jobCount = 0;
    int applicationCount = 0;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        database db = new database();
        con = db.connectDB();

        if (con != null) {

            // Students
            ps = con.prepareStatement(
                "SELECT COUNT(*) FROM students"
            );

            rs = ps.executeQuery();

            if (rs.next()) {
                studentCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // Recruiters
            ps = con.prepareStatement(
                "SELECT COUNT(*) FROM recruiters"
            );

            rs = ps.executeQuery();

            if (rs.next()) {
                recruiterCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // Jobs
            ps = con.prepareStatement(
                "SELECT COUNT(*) FROM jobs"
            );

            rs = ps.executeQuery();

            if (rs.next()) {
                jobCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // Applications
            ps = con.prepareStatement(
                "SELECT COUNT(*) FROM applications"
            );

            rs = ps.executeQuery();

            if (rs.next()) {
                applicationCount = rs.getInt(1);
            }

            rs.close();
            ps.close();
        }

    } catch (Exception e) {

        e.printStackTrace();

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


<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Admin Dashboard | Campus Placement Portal</title>


<!-- Bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">


<!-- Font Awesome -->

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<!-- Google Font -->

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
    color: #222;
}


/* ================= NAVBAR ================= */

.navbar {
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );

    padding: 14px 25px;
}

.navbar-brand {
    color: white !important;
    font-weight: 700;
    font-size: 21px;
}

.nav-link {
    color: white !important;
    margin-left: 18px;
    font-weight: 500;
}

.nav-link:hover {
    color: #ffd700 !important;
}

.logout-btn {
    margin-left: 20px;
}


/* ================= MAIN ================= */

.container-main {
    width: 90%;
    max-width: 1200px;
    margin: 35px auto;
}


/* ================= WELCOME ================= */

.welcome {
    background: white;
    padding: 30px;
    border-radius: 12px;
    text-align: center;

    box-shadow: 0 5px 15px rgba(0,0,0,0.08);
}

.welcome h1 {
    margin: 0;
    font-size: 32px;
    font-weight: 600;
}

.welcome p {
    margin-top: 10px;
    color: #666;
}


/* ================= STATISTICS ================= */

.stats {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-top: 25px;
}

.stat {
    background: white;
    padding: 22px;
    border-radius: 12px;
    text-align: center;

    box-shadow: 0 5px 15px rgba(0,0,0,0.08);
}

.stat i {
    font-size: 30px;
    margin-bottom: 10px;
}

.stat h2 {
    margin: 5px 0;
    font-size: 28px;
}

.stat p {
    margin: 0;
    color: #666;
}


/* ================= MANAGEMENT ================= */

.section-title {
    text-align: center;
    margin: 35px 0 20px;
    font-size: 24px;
    font-weight: 600;
}

.management {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.manage {
    background: white;
    padding: 25px 20px;
    border-radius: 12px;
    text-align: center;

    box-shadow: 0 5px 15px rgba(0,0,0,0.08);
}

.manage i {
    font-size: 32px;
    color: #2468ff;
    margin-bottom: 12px;
}

.manage h4 {
    font-size: 19px;
    margin-bottom: 15px;
}


/* ================= BUTTONS ================= */

.btn-custom {
    width: 100%;
    border: none;
    padding: 10px;
    border-radius: 7px;
    color: white;
    text-decoration: none;
    display: block;
}

.btn-blue {
    background: #2468ff;
}

.btn-green {
    background: #198754;
}

.btn-yellow {
    background: #ffbd00;
    color: black;
}

.btn-red {
    background: #dc3545;
}


/* ================= FOOTER ================= */

.footer {
    margin-top: 45px;
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );

    color: white;
    text-align: center;
    padding: 22px;
}

.footer p {
    margin: 5px;
}


/* ================= MOBILE ================= */

@media(max-width: 900px) {

    .stats,
    .management {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media(max-width: 600px) {

    .stats,
    .management {
        grid-template-columns: 1fr;
    }

    .navbar {
        padding: 12px;
    }

    .nav-link {
        margin-left: 0;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">


<a class="navbar-brand"
   href="adminDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>


<button class="navbar-toggler bg-light"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#adminNavbar">

<span class="navbar-toggler-icon"></span>

</button>


<div class="collapse navbar-collapse"
     id="adminNavbar">


<div class="ms-auto">


<a class="nav-link d-inline-block"
   href="adminDashboard.jsp">

<i class="fa-solid fa-house"></i>
Dashboard

</a>


<a class="nav-link d-inline-block"
   href="adminStudents.jsp">

<i class="fa-solid fa-user-graduate"></i>
Students

</a>


<a class="nav-link d-inline-block"
   href="adminRecruiters.jsp">

<i class="fa-solid fa-building"></i>
Recruiters

</a>


<a class="nav-link d-inline-block"
   href="adminJobs.jsp">

<i class="fa-solid fa-briefcase"></i>
Jobs

</a>


<a class="nav-link d-inline-block"
   href="adminApplications.jsp">

<i class="fa-solid fa-file-lines"></i>
Applications

</a>

<a class="btn btn-light ms-3"
   href="AdminLogoutServlet">

    <i class="fa-solid fa-right-from-bracket"></i>

    Logout

</a>


</div>

</div>

</div>

</nav>



<!-- ================= MAIN ================= -->

<div class="container-main">


<!-- WELCOME -->

<div class="welcome">

<h1>
Welcome, <%= adminUsername %>!
</h1>

<p>
Manage students, recruiters, jobs and applications from one place.
</p>

</div>



<!-- ================= STATISTICS ================= -->

<div class="stats">


<!-- STUDENTS -->

<div class="stat">

<i class="fa-solid fa-user-graduate text-primary"></i>

<h2>
<%= studentCount %>
</h2>

<p>Students</p>

</div>


<!-- RECRUITERS -->

<div class="stat">

<i class="fa-solid fa-building text-success"></i>

<h2>
<%= recruiterCount %>
</h2>

<p>Recruiters</p>

</div>


<!-- JOBS -->

<div class="stat">

<i class="fa-solid fa-briefcase text-warning"></i>

<h2>
<%= jobCount %>
</h2>

<p>Jobs</p>

</div>


<!-- APPLICATIONS -->

<div class="stat">

<i class="fa-solid fa-file-lines text-danger"></i>

<h2>
<%= applicationCount %>
</h2>

<p>Applications</p>

</div>


</div>



<!-- ================= MANAGEMENT ================= -->

<div class="section-title">

<i class="fa-solid fa-gear"></i>

Manage Portal

</div>


<div class="management">


<!-- STUDENTS -->

<div class="manage">

<i class="fa-solid fa-user-graduate"></i>

<h4>Students</h4>

<a href="adminStudents.jsp"
   class="btn-custom btn-blue">

View Students

</a>

</div>


<!-- RECRUITERS -->

<div class="manage">

<i class="fa-solid fa-building"></i>

<h4>Recruiters</h4>

<a href="adminRecruiters.jsp"
   class="btn-custom btn-green">

View Recruiters

</a>

</div>


<!-- JOBS -->

<div class="manage">

<i class="fa-solid fa-briefcase"></i>

<h4>Jobs</h4>

<a href="adminJobs.jsp"
   class="btn-custom btn-yellow">

View Jobs

</a>

</div>


<!-- APPLICATIONS -->

<div class="manage">

<i class="fa-solid fa-file-lines"></i>

<h4>Applications</h4>

<a href="adminApplications.jsp"
   class="btn-custom btn-red">

View Applications

</a>

</div>


</div>


</div>



<!-- ================= FOOTER ================= -->

<footer class="footer">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>
Admin Management Panel
</p>

<p>
© 2026 Campus Placement Portal
</p>

</footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>