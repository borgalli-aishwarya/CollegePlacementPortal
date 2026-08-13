<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Companies - Campus Placement Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        body {
            background: #f5f7fc;
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        .navbar {
            background: linear-gradient(135deg, #5d73f8, #6a11cb);
            padding: 14px 0;
        }

        .navbar-brand {
            color: white !important;
            font-weight: 600;
            font-size: 22px;
        }

        .navbar-brand i {
            margin-right: 8px;
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            margin-left: 15px;
        }

        .nav-link:hover {
            color: #ffd700 !important;
        }

        .page-title {
            color: #1769ff;
            font-weight: 600;
            margin-top: 50px;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 40px;
        }

        .company-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.10);
            transition: 0.3s;
            overflow: hidden;
        }

        .company-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .company-icon {
            font-size: 42px;
            color: #5a2eb8;
            margin-bottom: 10px;
        }

        .company-name {
            color: #5a2eb8;
            font-weight: 600;
        }

        .info {
            margin-bottom: 10px;
            color: #555;
        }

        .info i {
            width: 22px;
            color: #5a2eb8;
        }

        .website-btn {
            background: linear-gradient(135deg, #5d73f8, #6a11cb);
            border: none;
            color: white;
        }

        .website-btn:hover {
            color: white;
            opacity: 0.9;
        }

        .empty-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.10);
            padding: 60px;
        }

        .empty-icon {
            font-size: 55px;
            color: #777;
            margin-bottom: 20px;
        }

        .footer {
            background: linear-gradient(135deg, #5d73f8, #6a11cb);
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 60px;
        }

        .footer h5 {
            font-weight: 600;
        }

    </style>

</head>


<body>


<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a class="navbar-brand"
           href="index.jsp">

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

            <ul class="navbar-nav ms-auto align-items-center">


                <li class="nav-item">

                    <a class="nav-link"
                       href="index.jsp">

                        <i class="fa-solid fa-house"></i>

                        Home

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="jobs.jsp">

                        <i class="fa-solid fa-briefcase"></i>

                        Jobs

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link active"
                       href="companies.jsp">

                        <i class="fa-solid fa-building"></i>

                        Companies

                    </a>

                </li>


                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="fa-solid fa-right-to-bracket"></i>

                        Login

                    </a>


                    <ul class="dropdown-menu">

                        <li>

                            <a class="dropdown-item"
                               href="student_login.jsp">

                                <i class="fa-solid fa-user-graduate"></i>

                                Student Login

                            </a>

                        </li>


                        <li>

                            <a class="dropdown-item"
                               href="recruiter_login.jsp">

                                <i class="fa-solid fa-building"></i>

                                Recruiter Login

                            </a>

                        </li>


                        <li>

                            <a class="dropdown-item"
                               href="admin_Login.jsp">

                                <i class="fa-solid fa-user-shield"></i>

                                Admin Login

                            </a>

                        </li>

                    </ul>

                </li>


            </ul>

        </div>

    </div>

</nav>



<sql:setDataSource
    var="db"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/college_placement?useSSL=false&amp;serverTimezone=UTC"
    user="root"
    password="Aishu@1726"/>



<sql:query var="companies" dataSource="${db}">

    SELECT company_name,
           hr_contact_person,
           email,
           job_title,
           industry,
           location,
           website_url
    FROM recruiters
    WHERE status = 'Approved'
    ORDER BY company_name

</sql:query>



<div class="container">

    <h1 class="text-center page-title">

        <i class="fa-solid fa-building"></i>

        Registered Companies

    </h1>


    <p class="text-center page-subtitle">

        Companies registered with Campus Placement Portal

    </p>



    <c:choose>


        <c:when test="${empty companies.rows}">


            <div class="card empty-card text-center">

                <i class="fa-solid fa-building-circle-exclamation empty-icon"></i>

                <h3>No Companies Available</h3>

                <p class="text-muted">

                    No approved companies are currently registered.

                </p>

            </div>


        </c:when>


        <c:otherwise>


            <div class="row">


                <c:forEach var="company"
                           items="${companies.rows}">


                    <div class="col-md-6 col-lg-4 mb-4">


                        <div class="card company-card h-100">


                            <div class="card-body p-4">


                                <div class="text-center">

                                    <i class="fa-solid fa-building company-icon"></i>

                                </div>


                                <h4 class="text-center company-name">

                                    ${company.company_name}

                                </h4>


                                <hr>


                                <p class="info">

                                    <i class="fa-solid fa-industry"></i>

                                    <strong>Industry:</strong>

                                    ${company.industry}

                                </p>


                                <p class="info">

                                    <i class="fa-solid fa-location-dot"></i>

                                    <strong>Location:</strong>

                                    ${company.location}

                                </p>


                                <p class="info">

                                    <i class="fa-solid fa-user"></i>

                                    <strong>HR:</strong>

                                    ${company.hr_contact_person}

                                </p>


                                <p class="info">

                                    <i class="fa-solid fa-briefcase"></i>

                                    <strong>Hiring For:</strong>

                                    ${company.job_title}

                                </p>


                                <p class="info">

                                    <i class="fa-solid fa-envelope"></i>

                                    <strong>Email:</strong>

                                    ${company.email}

                                </p>


                                <c:if test="${not empty company.website_url}">

                                    <div class="text-center mt-4">

                                        <a href="${company.website_url}"
                                           target="_blank"
                                           class="btn website-btn">

                                            <i class="fa-solid fa-globe"></i>

                                            Visit Website

                                        </a>

                                    </div>

                                </c:if>


                            </div>


                        </div>


                    </div>


                </c:forEach>


            </div>


        </c:otherwise>


    </c:choose>


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