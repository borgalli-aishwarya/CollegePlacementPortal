<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String companyName = (String) session.getAttribute("companyName");

    if (companyName == null) {
        response.sendRedirect("recruiter_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Recruiter Dashboard | Campus Placement Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">


    <style>

        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            margin: 0;
            background: #f5f7fc;
            color: #1f2937;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            background: linear-gradient(
                90deg,
                #3b4cb8,
                #4f32c2,
                #5a2eb8
            );

            padding: 12px 18px;
        }

        .navbar-brand {
            color: white !important;
            font-size: 24px;
            font-weight: 700;
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            margin-left: 20px;
            padding: 12px 15px !important;
            border-radius: 8px;
        }

        /* Dashboard active link - NO YELLOW BOX */

        .nav-link.active {
            background: transparent !important;
            color: white !important;
        }

        .nav-link:hover {
            background: rgba(255,255,255,0.15);
            color: white !important;
        }

        .logout-btn {
            background: white;
            color: #111827 !important;
            border-radius: 8px;
            padding: 10px 18px !important;
            margin-left: 20px;
        }

        .logout-btn:hover {
            background: #f3f4f6;
            color: #111827 !important;
        }


        /* ================= MAIN ================= */

        .main-container {
            min-height: calc(100vh - 150px);
            padding: 40px 0 60px;
        }


        /* ================= WELCOME ================= */

        .welcome-box {
            background: white;
            border-radius: 16px;
            padding: 35px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            margin-bottom: 28px;
        }

        .welcome-box h1 {
            font-size: 34px;
            font-weight: 700;
            margin-bottom: 12px;
            color: #111827;
        }

        .welcome-box p {
            font-size: 17px;
            color: #64748b;
            margin-bottom: 0;
        }


        /* ================= CARDS ================= */

        .card-box {
            background: white;
            border-radius: 16px;
            padding: 32px;
            text-align: center;
            min-height: 255px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .card-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.12);
        }

        .card-box i {
            margin-bottom: 18px;
        }

        .card-box h5 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .card-box p {
            color: #64748b;
            min-height: 50px;
        }

        .card-box .btn {
            margin-top: 10px;
            padding: 11px;
            font-weight: 500;
            border-radius: 7px;
        }


        /* ================= FOOTER ================= */

        .footer {
            background: linear-gradient(
                90deg,
                #3b4cb8,
                #4f32c2,
                #5a2eb8
            );

            color: white;
            text-align: center;
            padding: 25px;
        }

        .footer h5 {
            font-size: 20px;
            font-weight: 600;
        }

        .footer p {
            margin: 5px 0;
        }


        /* ================= MOBILE ================= */

        @media (max-width: 991px) {

            .nav-link {
                margin-left: 0;
                margin-top: 8px;
            }

            .logout-btn {
                margin-left: 0;
                margin-top: 10px;
                display: inline-block;
            }

        }

    </style>

</head>


<body>


<!-- ================================================= -->
<!-- NAVBAR -->
<!-- ================================================= -->

<nav class="navbar navbar-expand-lg navbar-dark">

    <div class="container-fluid">


        <!-- LOGO -->

        <a class="navbar-brand fw-bold"
           href="recruiterDashboard.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <!-- MOBILE MENU -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- NAVIGATION -->

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">


                <!-- ================= DASHBOARD ================= -->

                <li class="nav-item">

                    <a class="nav-link active"
                       href="recruiterDashboard.jsp">

                        <i class="fa-solid fa-house"></i>

                        Dashboard

                    </a>

                </li>


                <!-- ================= POST JOB ================= -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="posts.jsp">

                        <i class="fa-solid fa-plus"></i>

                        Post Job

                    </a>

                </li>


                <!-- ================= MANAGE JOBS ================= -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="ManageJobsServlet">

                        <i class="fa-solid fa-briefcase"></i>

                        Manage Jobs

                    </a>

                </li>


                <!-- ================= MANAGE APPLICANTS ================= -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="ManageApplicantsServlet">

                        <i class="fa-solid fa-users"></i>

                        Applications

                    </a>

                </li>


                <!-- ================= LOGOUT ================= -->

                <li class="nav-item ms-lg-3">

                    <a class="btn logout-btn"
                       href="index.jsp">

                        <i class="fa-solid fa-right-from-bracket"></i>

                        Logout

                    </a>

                </li>


            </ul>

        </div>

    </div>

</nav>


<!-- ================================================= -->
<!-- MAIN CONTENT -->
<!-- ================================================= -->

<div class="main-container">

    <div class="container">


        <!-- ================= WELCOME ================= -->

        <div class="welcome-box">

            <h1>

                Welcome, <%= companyName %>!

            </h1>

            <p>

                Manage your job postings, review student applications,
                and recruit the best candidates for your organization.

            </p>

        </div>


        <!-- ================================================= -->
        <!-- DASHBOARD CARDS -->
        <!-- ================================================= -->

        <div class="row g-4">


            <!-- ================= POST JOB ================= -->

            <div class="col-lg-4 col-md-6">

                <div class="card-box">

                    <i class="fa-solid fa-plus fa-2x text-primary"></i>

                    <h5>

                        Post New Job

                    </h5>

                    <p>

                        Create and publish new job openings for students.

                    </p>

                    <a href="posts.jsp"
                       class="btn btn-primary w-100">

                        <i class="fa-solid fa-plus"></i>

                        Post Job

                    </a>

                </div>

            </div>


            <!-- ================= MANAGE JOBS ================= -->

            <div class="col-lg-4 col-md-6">

                <div class="card-box">

                    <i class="fa-solid fa-briefcase fa-2x text-success"></i>

                    <h5>

                        Manage Jobs

                    </h5>

                    <p>

                        View, edit or remove your posted jobs.

                    </p>

                    <a href="ManageJobsServlet"
                       class="btn btn-success w-100">

                        <i class="fa-solid fa-briefcase"></i>

                        Manage Jobs

                    </a>

                </div>

            </div>


            <!-- ================= APPLICATIONS ================= -->

            <div class="col-lg-4 col-md-6">

                <div class="card-box">

                    <i class="fa-solid fa-users fa-2x text-warning"></i>

                    <h5>

                        Applications

                    </h5>

                    <p>

                        View students who have applied for your jobs.

                    </p>

                    <a href="ManageApplicantsServlet"
                       class="btn btn-warning w-100">

                        <i class="fa-solid fa-users"></i>

                        View Applications

                    </a>

                </div>

            </div>


        </div>

    </div>

</div>


<!-- ================================================= -->
<!-- FOOTER -->
<!-- ================================================= -->

<footer class="footer">

    <h5>

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </h5>

    <p>

        Empowering recruiters to hire talented students.

    </p>

    <p>

        © 2026 Campus Placement Portal

    </p>

</footer>


<!-- Bootstrap JavaScript -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>