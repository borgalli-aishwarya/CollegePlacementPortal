<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
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

<title>Recruiters | Admin | Campus Placement Portal</title>

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

.page-title{
    color:#3b4cb8;
    font-weight:600;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,.10);
}

.table th,
.table td{
    text-align:center;
    vertical-align:middle;
    white-space:nowrap;
}

.footer{
    background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
    color:white;
    padding:25px;
    text-align:center;
    margin-top:60px;
}

</style>

</head>

<body>


<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand fw-bold" href="adminDashboard.jsp">

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</a>


<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link" href="adminDashboard.jsp">
<i class="fa-solid fa-house"></i>
Dashboard
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="adminStudents.jsp">
<i class="fa-solid fa-users"></i>
Students
</a>
</li>

<li class="nav-item">
<a class="nav-link active" href="adminRecruiters.jsp">
<i class="fa-solid fa-building"></i>
Recruiters
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="adminJobs.jsp">
<i class="fa-solid fa-briefcase"></i>
Jobs
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="adminApplications.jsp">
<i class="fa-solid fa-file-lines"></i>
Applications
</a>
</li>

<li class="nav-item ms-3">

<a class="btn btn-light ms-3"
   href="AdminLogoutServlet">

    <i class="fa-solid fa-right-from-bracket"></i>

    Logout

</a>

</li>

</ul>

</div>

</nav>


<div class="container mt-5 mb-5">

<h2 class="text-center page-title mb-4">

<i class="fa-solid fa-building"></i>

Registered Recruiters

</h2>


<div class="card">

<div class="card-body">

<div class="table-responsive">

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>ID</th>

<th>Company</th>

<th>HR Contact</th>

<th>Email</th>

<th>Phone</th>

<th>Industry</th>

<th>Location</th>

<th>Website</th>

<th>Status</th>

</tr>

</thead>


<tbody>

<%

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    database db = new database();

    con = db.connectDB();

    if(con == null){
        throw new Exception("Database connection failed.");
    }


    String sql =
        "SELECT id, company_name, hr_contact_person, email, " +
        "phone, industry, location, website_url, status " +
        "FROM recruiters " +
        "ORDER BY id DESC";


    ps = con.prepareStatement(sql);

    rs = ps.executeQuery();

    boolean found = false;


    while(rs.next()) {

        found = true;

        String status = rs.getString("status");

%>

<tr>

<td>
<%=rs.getInt("id")%>
</td>

<td>
<strong>
<%=rs.getString("company_name")%>
</strong>
</td>

<td>
<%=rs.getString("hr_contact_person")%>
</td>

<td>
<%=rs.getString("email")%>
</td>

<td>
<%=rs.getString("phone")%>
</td>

<td>
<%=rs.getString("industry")%>
</td>

<td>
<%=rs.getString("location")%>
</td>

<td>

<%

String website = rs.getString("website_url");

if(website != null && !website.trim().isEmpty()) {

%>

<a href="<%=website%>"
   target="_blank"
   class="btn btn-sm btn-outline-primary">

<i class="fa-solid fa-globe"></i>

Visit

</a>

<%

} else {

%>

<span class="text-muted">
Not provided
</span>

<%

}

%>

</td>


<td>

<%

if("Approved".equals(status)) {

%>

<span class="badge bg-success">

Approved

</span>

<%

} else if("Pending".equals(status)) {

%>

<span class="badge bg-warning text-dark">

Pending

</span>

<%

} else if("Rejected".equals(status)) {

%>

<span class="badge bg-danger">

Rejected

</span>

<%

} else {

%>

<span class="badge bg-secondary">

<%=status%>

</span>

<%

}

%>

</td>

</tr>

<%

    }


    if(!found) {

%>

<tr>

<td colspan="9"
    class="text-center text-muted py-4">

<i class="fa-solid fa-circle-info"></i>

No recruiters registered.

</td>

</tr>

<%

    }

} catch(Exception e) {

%>

<tr>

<td colspan="9"
    class="text-danger text-center py-4">

<i class="fa-solid fa-triangle-exclamation"></i>

Database Error:

<%=e.getMessage()%>

</td>

</tr>

<%

    e.printStackTrace();

} finally {

    try{
        if(rs != null) rs.close();
    }catch(Exception e){}

    try{
        if(ps != null) ps.close();
    }catch(Exception e){}

    try{
        if(con != null) con.close();
    }catch(Exception e){}

}

%>

</tbody>

</table>

</div>

</div>

</div>

</div>


<footer class="footer">

<h5>

<i class="fa-solid fa-graduation-cap"></i>

Campus Placement Portal

</h5>

<p>Recruiter Management</p>

<p>© 2026 Campus Placement Portal</p>

</footer>


</body>

</html>