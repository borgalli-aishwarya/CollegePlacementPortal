<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="modell.database" %>

<%
Integer recruiterId = (Integer) session.getAttribute("recruiterId");

if(recruiterId == null){
    response.sendRedirect("recruiter_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>View Applications | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

body{
background:#f5f7fc;
font-family:Poppins,sans-serif;
}

.navbar,
.footer{
background:linear-gradient(90deg,#3b4cb8,#4f32c2,#5a2eb8);
}

.navbar-brand,
.nav-link{
color:#fff!important;
}

.card{
border:none;
border-radius:15px;
box-shadow:0 10px 20px rgba(0,0,0,.12);
}

.footer{
margin-top:50px;
padding:20px;
text-align:center;
color:#fff;
}

.table th,
.table td{
text-align:center;
vertical-align:middle;
}

</style>

</head>

<body>

<!-- Navbar -->
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


                <!-- Dashboard -->

                <li class="nav-item">

                    <a class="nav-link active"
                       href="recruiterDashboard.jsp">

                        <i class="fa-solid fa-house"></i>

                        Dashboard

                    </a>

                </li>


                <!-- Post Job -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="posts.jsp">

                        <i class="fa-solid fa-plus"></i>

                        Post Job

                    </a>

                </li>


                <!-- Manage Jobs -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="managejobs.jsp">

                        <i class="fa-solid fa-briefcase"></i>

                        Manage Jobs

                    </a>

                </li>


                <!-- Applications -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="viewApplicationsRecruiter.jsp">

                        <i class="fa-solid fa-users"></i>

                        Applications

                    </a>

                </li>


                <!-- Logout -->

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

<div class="container mt-5">

<div class="card">

<div class="card-body">

<h2 class="text-center text-primary mb-4">

Student Applications

</h2>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>Student Name</th>

<th>Email</th>

<th>PRN</th>

<th>Job Title</th>

<th>Status</th>

<th>Applied On</th>

</tr>

</thead>

<tbody>

<%

try{

database db = new database();

Connection con = db.connectDB();

String sql =
"SELECT s.name,s.email,s.prn,j.title,a.status,a.applied_on " +
"FROM applications a " +
"INNER JOIN students s ON a.student_id=s.id " +
"INNER JOIN jobs j ON a.job_id=j.id " +
"WHERE j.recruiter_id=?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setInt(1,recruiterId);

ResultSet rs = ps.executeQuery();

boolean found=false;

while(rs.next()){

found=true;

%>

<tr>

<td><%=rs.getString("name")%></td>

<td><%=rs.getString("email")%></td>

<td><%=rs.getString("prn")%></td>

<td><%=rs.getString("title")%></td>

<td>

<%

String status=rs.getString("status");

if(status.equals("Applied")){

%>

<span class="badge bg-primary">Applied</span>

<%

}else if(status.equals("Shortlisted")){

%>

<span class="badge bg-warning text-dark">Shortlisted</span>

<%

}else if(status.equals("Rejected")){

%>

<span class="badge bg-danger">Rejected</span>

<%

}else{

%>

<span class="badge bg-success">Selected</span>

<%

}

%>

</td>

<td><%=rs.getString("applied_on")%></td>

</tr>

<%

}

if(!found){

%>

<tr>

<td colspan="6">

No Applications Received

</td>

</tr>

<%

}

rs.close();
ps.close();
con.close();

}catch(Exception ex){

%>

<tr>

<td colspan="6" class="text-danger">

<%=ex.getMessage()%>

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