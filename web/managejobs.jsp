<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="modell.job" %>

<%
    HttpSession currentSession = request.getSession(false);

    if (currentSession == null ||
        currentSession.getAttribute("recruiterId") == null) {

        response.sendRedirect("recruiter_login.jsp");
        return;
    }

    String companyName =
            (String) currentSession.getAttribute("companyName");

    List<job> jobs =
            (List<job>) request.getAttribute("jobs");

    String error =
            request.getParameter("error");

    String deleted =
            request.getParameter("deleted");

    String updated =
            request.getParameter("updated");

    String success =
            request.getParameter("success");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Manage Jobs | Campus Placement Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!-- Poppins -->
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

            padding: 14px 20px;
        }

        .navbar-brand {
            color: white !important;
            font-size: 24px;
            font-weight: 700;
        }

        .nav-link {
            color: white !important;
            font-size: 16px;
            font-weight: 500;
            margin-left: 10px;
            padding: 12px 15px !important;
            border-radius: 8px;
            transition: 0.3s;
        }

        .nav-link:hover {
            background: rgba(255,255,255,0.15);
            color: white !important;
        }

        .nav-link.active {
            background: rgba(255,255,255,0.12) !important;
            color: white !important;
        }

        .logout-btn {
            background: white;
            color: #111827 !important;
            border: none;
            border-radius: 8px;
            padding: 10px 18px !important;
            margin-left: 18px;
            font-weight: 500;
        }

        .logout-btn:hover {
            background: #f1f1f1;
            color: #111827 !important;
        }

        /* ================= MAIN ================= */

        .main {
            padding: 45px 0 60px;
            min-height: calc(100vh - 160px);
        }

        /* ================= TITLE ================= */

        .page-title {
            color: #3b4cb8;
            font-weight: 700;
            font-size: 42px;
        }

        .page-subtitle {
            color: #64748b;
            font-size: 17px;
        }

        /* ================= ALERTS ================= */

        .alert {
            border-radius: 10px;
        }

        /* ================= JOB CARD ================= */

        .job-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .job-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 15px 35px rgba(0,0,0,0.12);
        }

        /* ================= JOB TITLE ================= */

        .job-title {
            color: #3b4cb8;
            font-weight: 700;
        }

        .company {
            color: #555;
            font-size: 16px;
        }

        /* ================= ROLE ================= */

        .role {
            background: #e8eaf6;
            color: #3b4cb8;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            white-space: nowrap;
        }

        /* ================= INFO BOX ================= */

        .info-box {
            background: #f8f9fc;
            padding: 18px;
            border-radius: 10px;
            height: 100%;
        }

        .info-title {
            color: #222;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .info-title i {
            color: #3b4cb8;
            margin-right: 5px;
        }

        .info-text {
            color: #666;
            line-height: 1.6;
            word-break: break-word;
        }

        /* ================= BUTTONS ================= */

        .btn {
            border-radius: 7px;
            font-weight: 500;
        }

        .btn-warning {
            color: #212529;
        }

        .btn-primary {
            background: #3b4cb8;
            border-color: #3b4cb8;
        }

        .btn-primary:hover {
            background: #303f9f;
            border-color: #303f9f;
        }

        .btn-danger {
            background: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background: #bb2d3b;
            border-color: #bb2d3b;
        }

        /* ================= EMPTY ================= */

        .empty-card {
            background: white;
            border-radius: 16px;
            padding: 60px 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .empty-card i {
            color: #adb5bd;
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

            .navbar-brand {
                font-size: 20px;
            }

            .nav-link {
                margin-left: 0;
                margin-top: 5px;
            }

            .logout-btn {
                margin-left: 0;
                margin-top: 10px;
                display: inline-block;
            }

            .page-title {
                font-size: 32px;
            }

            .job-card {
                padding: 20px;
            }

            .role {
                margin-top: 10px;
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

        <a class="navbar-brand"
           href="recruiterDashboard.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#recruiterNavbar"
                aria-controls="recruiterNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse"
             id="recruiterNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center">


                <!-- DASHBOARD -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="recruiterDashboard.jsp">

                        <i class="fa-solid fa-house"></i>

                        Dashboard

                    </a>

                </li>


                <!-- POST JOB -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="posts.jsp">

                        <i class="fa-solid fa-plus"></i>

                        Post Job

                    </a>

                </li>


                <!-- MANAGE JOBS -->

                <li class="nav-item">

                    <a class="nav-link active"
                       href="ManageJobsServlet">

                        <i class="fa-solid fa-briefcase"></i>

                        Manage Jobs

                    </a>

                </li>


                <!-- APPLICANTS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="ManageApplicantsServlet">

                        <i class="fa-solid fa-users"></i>

                        Applicants

                    </a>

                </li>


                <!-- LOGOUT -->

                <li class="nav-item">

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
<!-- MAIN -->
<!-- ================================================= -->

<div class="container main">


    <!-- PAGE TITLE -->

    <h1 class="text-center page-title mb-2">

        <i class="fa-solid fa-briefcase"></i>

        Manage Jobs

    </h1>


    <p class="text-center page-subtitle mb-4">

        Jobs posted by

        <strong>
            <%= companyName != null ? companyName : "Your Company" %>
        </strong>

    </p>


    <!-- ================================================= -->
    <!-- DELETE SUCCESS -->
    <!-- ================================================= -->

    <%
        if ("1".equals(deleted)) {
    %>

        <div class="alert alert-success">

            <i class="fa-solid fa-circle-check"></i>

            <strong>Success!</strong>
            Job deleted successfully.

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!-- DELETE FAILED -->
    <!-- ================================================= -->

    <%
        if ("0".equals(deleted)) {
    %>

        <div class="alert alert-danger">

            <i class="fa-solid fa-circle-exclamation"></i>

            <strong>Delete failed.</strong>
            The job could not be deleted.

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!-- UPDATE SUCCESS -->
    <!-- ================================================= -->

    <%
        if ("1".equals(updated)) {
    %>

        <div class="alert alert-success">

            <i class="fa-solid fa-circle-check"></i>

            <strong>Success!</strong>
            Job updated successfully.

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!-- POST SUCCESS -->
    <!-- ================================================= -->

    <%
        if ("1".equals(success)) {
    %>

        <div class="alert alert-success">

            <i class="fa-solid fa-circle-check"></i>

            <strong>Success!</strong>
            Job added successfully.

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!-- ERROR -->
    <!-- ================================================= -->

    <%
        if (error != null) {
    %>

        <div class="alert alert-danger">

            <i class="fa-solid fa-circle-exclamation"></i>

            <strong>Error:</strong>

            <%= error %>

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!-- JOB LIST -->
    <!-- ================================================= -->

    <%
        if (jobs != null && !jobs.isEmpty()) {

            for (job j : jobs) {
    %>


        <!-- ================================================= -->
        <!-- JOB CARD -->
        <!-- ================================================= -->

        <div class="job-card">


            <!-- HEADER -->

            <div class="d-flex justify-content-between
                        align-items-start flex-wrap">


                <div>

                    <h3 class="job-title">

                        <%= j.getTitle() %>

                    </h3>


                    <p class="company mb-0">

                        <i class="fa-solid fa-building"></i>

                        <%= j.getCompany() %>

                    </p>

                </div>


                <span class="role">

                    <i class="fa-solid fa-user-tie"></i>

                    <%= j.getRoleType() %>

                </span>


            </div>


            <hr>


            <!-- ================================================= -->
            <!-- INFORMATION -->
            <!-- ================================================= -->

            <div class="row g-3">


                <!-- REQUIREMENTS -->

                <div class="col-md-6">

                    <div class="info-box">

                        <div class="info-title">

                            <i class="fa-solid fa-list-check"></i>

                            Requirements

                        </div>

                        <div class="info-text">

                            <%= j.getRequirements() != null
                                    ? j.getRequirements()
                                    : "Not specified" %>

                        </div>

                    </div>

                </div>


                <!-- TECHNICAL SKILLS -->

                <div class="col-md-6">

                    <div class="info-box">

                        <div class="info-title">

                            <i class="fa-solid fa-code"></i>

                            Technical Skills

                        </div>

                        <div class="info-text">

                            <%= j.getTechnicalSkills() != null
                                    ? j.getTechnicalSkills()
                                    : "Not specified" %>

                        </div>

                    </div>

                </div>


                <!-- DURATION -->

                <div class="col-md-4">

                    <div class="info-box">

                        <div class="info-title">

                            <i class="fa-solid fa-clock"></i>

                            Duration

                        </div>

                         <div class="info-text">

    <%= j.getDurationMonths() %> Months

</div>

                    </div>

                </div>


                <!-- SALARY -->

                <div class="col-md-4">

                    <div class="info-box">

                        <div class="info-title">

                            <i class="fa-solid fa-money-bill-wave"></i>

                            Salary / Stipend

                        </div>

                        <div class="info-text">

                            <%= j.getStipendSalary() != null
                                    ? j.getStipendSalary()
                                    : "Not specified" %>

                        </div>

                    </div>

                </div>


                <!-- DEADLINE -->

                <div class="col-md-4">

                    <div class="info-box">

                        <div class="info-title">

                            <i class="fa-solid fa-calendar-days"></i>

                            Deadline

                        </div>

                        <div class="info-text">

                            <%= j.getDeadline() != null
                                    ? j.getDeadline()
                                    : "Not specified" %>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- BUTTONS -->
            <!-- ================================================= -->

            <div class="mt-4 d-flex gap-2 flex-wrap">


                <!-- EDIT -->

                <a href="EditJobServlet?id=<%= j.getId() %>"
                   class="btn btn-warning">

                    <i class="fa-solid fa-pen-to-square"></i>

                    Edit

                </a>


                <!-- ================================================= -->
                <!-- DELETE -->
                <!-- ================================================= -->

              <form action="DeleteJobServlet"
      method="post"
      style="display:inline;"
      onsubmit="return confirm('Are you sure you want to delete this job?');">

    <input type="hidden"
           name="job_id"
           value="<%= j.getId() %>">

    <button type="submit"
            class="btn btn-danger">

        <i class="fa-solid fa-trash"></i>

        Delete

    </button>

</form>

            </div>


        </div>


    <%
            }

        } else {
    %>


        <!-- ================================================= -->
        <!-- NO JOBS -->
        <!-- ================================================= -->

        <div class="empty-card">

            <i class="fa-solid fa-briefcase fa-3x mb-3"></i>

            <h3>
                No Jobs Posted Yet
            </h3>

            <p class="text-muted">

                You haven't posted any jobs yet.

            </p>


            <a href="posts.jsp"
               class="btn btn-primary">

                <i class="fa-solid fa-plus"></i>

                Post New Job

            </a>

        </div>


    <%
        }
    %>


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


<!-- ================================================= -->
<!-- DELETE CONFIRMATION -->
<!-- ================================================= -->

<script>

function confirmDelete(jobId) {

    return confirm(
        "Are you sure you want to delete this job?\n\n" +
        "Job ID: " + jobId +
        "\n\nThis will also remove applications associated with this job."
    );

}

</script>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>