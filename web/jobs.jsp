<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Jobs - Campus Placement Portal</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        body{
            background:#f8f9fa;
        }

        .navbar{
            background:linear-gradient(135deg,#5d73f8,#6a11cb);
        }

        .navbar-brand{
            color:#fff!important;
            font-weight:bold;
        }

        .navbar .nav-link{
            color:#fff!important;
            font-weight:500;
        }

        .job-card{
            border:none;
            border-radius:12px;
            box-shadow:0 5px 15px rgba(0,0,0,.15);
            margin-bottom:25px;
            transition:.3s;
        }

        .job-card:hover{
            transform:translateY(-5px);
        }

        .footer{
            background:linear-gradient(135deg,#5d73f8,#6a11cb);
            color:#fff;
            text-align:center;
            padding:25px;
            margin-top:50px;
        }

        .footer h5{
            font-weight:bold;
        }

    </style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-mortarboard-fill"></i>
            Campus Placement Portal
        </a>

        <ul class="navbar-nav ms-auto">

            <li class="nav-item">
                <a class="nav-link" href="studentDashboard.jsp">Home</a>
            </li>

            

        </ul>

    </div>

</nav>

<!-- Database Connection -->

<sql:setDataSource
        var="db"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/college_placement?useSSL=false&serverTimezone=UTC"
        user="root"
        password="Aishu@1726"/>

<!-- Fetch Jobs -->

<sql:query var="result" dataSource="${db}">
    SELECT * FROM jobs;
</sql:query>

<div class="container mt-5">

    <h2 class="text-center text-primary mb-4">
        Available Jobs
    </h2>

    <c:choose>

        <c:when test="${empty result.rows}">

            <div class="alert alert-warning text-center">
                No jobs available.
            </div>

        </c:when>

        <c:otherwise>

            <c:forEach var="row" items="${result.rows}">

                <div class="card job-card">

                    <div class="card-body">

                        <h4>${row.title}</h4>

                        <h6 class="text-muted">
                            ${row.company}
                        </h6>

                        <p>
                            <b>Role :</b>
                            ${row.roleType}
                        </p>

                        <p>
                            <b>Requirements :</b>
                            ${row.requirements}
                        </p>

                        <p>
                            <b>Skills :</b>
                            ${row.skills}
                        </p>

                        <a href="applyjob.jsp?id=${row.id}"
                           class="btn btn-primary">
                            Apply Now
                        </a>

                    </div>

                </div>

            </c:forEach>

        </c:otherwise>

    </c:choose>

</div>

<!-- Footer -->

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>