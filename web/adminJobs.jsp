<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="modell.database" %>

<%
    // =========================
    // CHECK ADMIN LOGIN
    // =========================

    Integer adminId = (Integer) session.getAttribute("adminId");

    if (adminId == null) {
        response.sendRedirect("admin_Login.jsp");
        return;
    }


    // =========================
    // DATABASE VARIABLES
    // =========================

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        database db = new database();

        con = db.connectDB();


        if (con == null) {

            out.println("<div class='alert alert-danger text-center'>");
            out.println("Database connection failed.");
            out.println("</div>");

        } else {

            String sql =
                "SELECT id, recruiter_id, title, company, role_type, " +
                "requirements, technical_skills, duration_months, " +
                "stipend_salary, deadline " +
                "FROM jobs " +
                "ORDER BY id DESC";


            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Manage Jobs | Admin</title>


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
}


/* NAVBAR */

.navbar {
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
    margin-left: 15px;
    font-weight: 500;
}

.nav-link:hover {
    color: #ffd700 !important;
}


/* PAGE TITLE */

.page-title {
    color: #246bfd;
    font-weight: 600;
}


/* TABLE */

.table-container {
    background: white;
    border-radius: 15px;
    padding: 25px;

    box-shadow:
        0 10px 25px rgba(0,0,0,.10);
}

.table th {
    white-space: nowrap;
}

.table td {
    vertical-align: middle;
}


/* FOOTER */

.footer {
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );

    color: white;

    padding: 25px;

    text-align: center;

    margin-top: 50px;
}

</style>

</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid px-4">


<a class="navbar-brand fw-bold"
   href="adminDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>


<div class="navbar-nav ms-auto">


<a class="nav-link"
   href="adminDashboard.jsp">

<i class="fa-solid fa-house"></i>
Dashboard

</a>


<a class="nav-link"
   href="adminStudents.jsp">

<i class="fa-solid fa-user-graduate"></i>
Students

</a>


<a class="nav-link"
   href="adminRecruiters.jsp">

<i class="fa-solid fa-building"></i>
Recruiters

</a>


<a class="nav-link active"
   href="adminJobs.jsp">

<i class="fa-solid fa-briefcase"></i>
Jobs

</a>


<a class="nav-link"
   href="adminApplications.jsp">

<i class="fa-solid fa-file-lines"></i>
Applications

</a>


<a class="btn btn-light ms-3"
   href="admin_Login.jsp">

<i class="fa-solid fa-right-from-bracket"></i>
Logout

</a>


</div>

</div>

</nav>



<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container mt-5">


<h2 class="text-center page-title mb-4">

<i class="fa-solid fa-briefcase"></i>

Posted Jobs

</h2>



<div class="table-container">


<div class="table-responsive">


<table class="table table-bordered table-hover align-middle">


<thead class="table-primary">

<tr>

<th>ID</th>

<th>Company</th>

<th>Job Title</th>

<th>Role</th>

<th>Requirements</th>

<th>Technical Skills</th>

<th>Duration</th>

<th>Salary / Stipend</th>

<th>Deadline</th>

</tr>

</thead>


<tbody>

<%

boolean hasJobs = false;


while (rs.next()) {

    hasJobs = true;

%>

<tr>

<td>
<%= rs.getInt("id") %>
</td>


<td>
<%= rs.getString("company") %>
</td>


<td>
<%= rs.getString("title") %>
</td>


<td>
<%= rs.getString("role_type") %>
</td>


<td>
<%= rs.getString("requirements") %>
</td>


<td>
<%= rs.getString("technical_skills") %>
</td>


<td>

<%= rs.getInt("duration_months") %>

Months

</td>


<td>
<%= rs.getString("stipend_salary") %>
</td>


<td>
<%= rs.getDate("deadline") %>
</td>

</tr>


<%

}

if (!hasJobs) {

%>

<tr>

<td colspan="9"
    class="text-center">

<div class="alert alert-warning mb-0">

<i class="fa-solid fa-circle-info"></i>

No jobs have been posted yet.

</div>

</td>

</tr>

<%

}

%>

</tbody>

</table>


</div>

</div>


</div>



<!-- =========================
     FOOTER
========================= -->

<footer class="footer">


<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>


<p>

Admin Panel

</p>


<p>

© 2026 Campus Placement Portal

</p>


</footer>


</body>

</html>


<%

        }

    } catch (Exception e) {

        out.println("<div style='margin:30px; padding:20px; background:#f8d7da; color:#842029; border-radius:10px;'>");

        out.println("<h4>Database Error</h4>");

        out.println("<p>" + e.getMessage() + "</p>");

        out.println("</div>");

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