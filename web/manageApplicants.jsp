<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%

    /* =====================================================
       CHECK RECRUITER LOGIN
       ===================================================== */

    HttpSession currentSession =
            request.getSession(false);


    if (currentSession == null ||
        currentSession.getAttribute("recruiterId") == null) {

        response.sendRedirect(
                "recruiter_login.jsp"
        );

        return;
    }


    String companyName =
            (String)
            currentSession.getAttribute(
                    "companyName"
            );


    List<Map<String, Object>> applicants =
            (List<Map<String, Object>>)
            request.getAttribute(
                    "applicants"
            );


    String error =
            (String)
            request.getAttribute(
                    "error"
            );


    String successMessage =
            (String)
            request.getAttribute(
                    "successMessage"
            );

%>


<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="UTF-8">


<meta name="viewport"
      content="width=device-width, initial-scale=1">


<title>
    Manage Applicants | Campus Placement Portal
</title>


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


/* =====================================================
   NAVBAR
   ===================================================== */

.navbar {

    background:
        linear-gradient(
            90deg,
            #3b4cb8,
            #4f32c2,
            #5a2eb8
        );

    padding: 12px 18px;

}


.navbar-brand {

    color: white !important;

    font-size: 23px;

    font-weight: 700;

}


.nav-link {

    color: white !important;

    font-weight: 500;

    margin-left: 15px;

    padding: 10px 14px !important;

    border-radius: 8px;

}


.nav-link:hover {

    background:
        rgba(255,255,255,.15);

}


.logout-btn {

    background: white;

    color: #111827 !important;

    border-radius: 8px;

    padding: 10px 18px !important;

    margin-left: 15px;

    font-weight: 600;

}


.logout-btn:hover {

    background: #f3f4f6;

}


/* =====================================================
   MAIN
   ===================================================== */

.main {

    padding: 45px 0 60px;

    min-height: 75vh;

}


/* =====================================================
   TITLE
   ===================================================== */

.page-title {

    color: #3f51b5;

    font-weight: 700;

}


.page-subtitle {

    color: #64748b;

}


/* =====================================================
   ALERT
   ===================================================== */

.alert {

    border-radius: 10px;

}


/* =====================================================
   APPLICANT CARD
   ===================================================== */

.applicant-card {

    background: white;

    border-radius: 16px;

    padding: 28px;

    margin-bottom: 25px;

    box-shadow:
        0 10px 30px
        rgba(0,0,0,.08);

}


.student-name {

    color: #3f51b5;

    font-weight: 700;

    margin-bottom: 8px;

}


.job-name {

    color: #555;

}


/* =====================================================
   INFORMATION BOX
   ===================================================== */

.info-box {

    background: #f8f9fc;

    padding: 16px;

    border-radius: 10px;

    height: 100%;

}


.info-title {

    font-weight: 600;

    color: #333;

    margin-bottom: 6px;

}


.info-text {

    color: #666;

    word-break: break-word;

}


/* =====================================================
   STATUS
   ===================================================== */

.status {

    padding: 8px 16px;

    border-radius: 20px;

    font-weight: 600;

    display: inline-block;

}


.status-applied {

    background: #cff4fc;

    color: #055160;

}


.status-shortlisted {

    background: #fff3cd;

    color: #664d03;

}


.status-rejected {

    background: #f8d7da;

    color: #842029;

}


.status-selected {

    background: #d1e7dd;

    color: #0f5132;

}


/* =====================================================
   RESUME
   ===================================================== */

.resume-section {

    background: #f8f9fc;

    border-radius: 12px;

    padding: 18px;

    margin-top: 20px;

}


.resume-title {

    font-weight: 600;

    margin-bottom: 10px;

    color: #333;

}


/* =====================================================
   BUTTONS
   ===================================================== */

.btn-primary {

    background: #3f51b5;

    border-color: #3f51b5;

}


.btn-primary:hover {

    background: #303f9f;

    border-color: #303f9f;

}


.btn-warning {

    font-weight: 600;

}


.btn-danger {

    font-weight: 600;

}


.btn-success {

    font-weight: 600;

}


/* =====================================================
   EMPTY
   ===================================================== */

.empty-card {

    background: white;

    border-radius: 16px;

    padding: 55px;

    text-align: center;

    box-shadow:
        0 10px 30px
        rgba(0,0,0,.08);

}


.empty-card i {

    color: #adb5bd;

}


/* =====================================================
   FOOTER
   ===================================================== */

.footer {

    background:
        linear-gradient(
            90deg,
            #3b4cb8,
            #4f32c2,
            #5a2eb8
        );

    color: white;

    padding: 25px;

    text-align: center;

}


.footer h5 {

    font-size: 20px;

    font-weight: 600;

}


.footer p {

    margin: 5px 0;

}


/* =====================================================
   MOBILE
   ===================================================== */

@media (max-width: 991px) {

    .nav-link {

        margin-left: 0;

        margin-top: 5px;

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


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar navbar-expand-lg navbar-dark">


    <div class="container-fluid">


        <!-- LOGO -->

        <a class="navbar-brand"
           href="recruiterDashboard.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <!-- MOBILE -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#recruiterNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- MENU -->

        <div class="collapse navbar-collapse"
             id="recruiterNavbar">


            <ul class="navbar-nav ms-auto align-items-lg-center">


                <li class="nav-item">

                    <a class="nav-link"
                       href="recruiterDashboard.jsp">

                        <i class="fa-solid fa-house"></i>

                        Dashboard

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="posts.jsp">

                        <i class="fa-solid fa-plus"></i>

                        Post Job

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="ManageJobsServlet">

                        <i class="fa-solid fa-briefcase"></i>

                        Manage Jobs

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link active"
                       href="ManageApplicantsServlet">

                        <i class="fa-solid fa-users"></i>

                        Applicants

                    </a>

                </li>


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



<!-- =====================================================
     MAIN
     ===================================================== -->

<div class="container main">


    <h1 class="text-center page-title mb-2">

        <i class="fa-solid fa-users"></i>

        Manage Applicants

    </h1>


    <p class="text-center page-subtitle mb-4">

        Applications received for jobs posted by

        <strong>
            <%= companyName %>
        </strong>

    </p>



    <!-- SUCCESS -->

    <%

        if (successMessage != null) {

    %>

        <div class="alert alert-success">

            <i class="fa-solid fa-circle-check"></i>

            <strong>
                <%= successMessage %>
            </strong>

        </div>

    <%

        }

    %>



    <!-- ERROR -->

    <%

        if (error != null) {

    %>

        <div class="alert alert-danger">

            <i class="fa-solid fa-circle-exclamation"></i>

            <%= error %>

        </div>

    <%

        }

    %>



    <!-- =================================================
         APPLICANTS
         ================================================= -->

    <%

        if (applicants != null &&
            !applicants.isEmpty()) {


            for (Map<String, Object> applicant :
                    applicants) {


                String status =
                        (String)
                        applicant.get("status");


                String statusClass =
                        "status-applied";


                if ("Shortlisted".equals(status)) {

                    statusClass =
                            "status-shortlisted";

                }

                else if ("Rejected".equals(status)) {

                    statusClass =
                            "status-rejected";

                }

                else if ("Selected".equals(status)) {

                    statusClass =
                            "status-selected";

                }

    %>



    <!-- =================================================
         APPLICANT CARD
         ================================================= -->

    <div class="applicant-card">


        <!-- HEADER -->

        <div class="d-flex justify-content-between
                    align-items-start
                    flex-wrap
                    gap-3
                    mb-3">


            <div>

                <h3 class="student-name">

                    <i class="fa-solid fa-user-graduate"></i>

                    <%= applicant.get("studentName") %>

                </h3>


                <p class="job-name mb-1">

                    Applied for:

                    <strong>
                        <%= applicant.get("jobTitle") %>
                    </strong>

                </p>


                <p class="text-muted mb-0">

                    <i class="fa-solid fa-building"></i>

                    <%= applicant.get("company") %>

                </p>

            </div>


            <span class="status <%= statusClass %>">

                <%= status %>

            </span>


        </div>


        <hr>



        <!-- =================================================
             STUDENT DETAILS
             ================================================= -->

        <h5 class="mb-3">

            <i class="fa-solid fa-id-card"></i>

            Student Details

        </h5>


        <div class="row g-3">


            <!-- NAME -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-user"></i>

                        Student Name

                    </div>

                    <div class="info-text">

                        <%= applicant.get("studentName") %>

                    </div>

                </div>

            </div>


            <!-- EMAIL -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-envelope"></i>

                        Email

                    </div>

                    <div class="info-text">

                        <%= applicant.get("studentEmail") %>

                    </div>

                </div>

            </div>


            <!-- MOBILE -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-phone"></i>

                        Mobile

                    </div>

                    <div class="info-text">

                        <%= applicant.get("studentMobile") %>

                    </div>

                </div>

            </div>


            <!-- PRN -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-id-card"></i>

                        PRN

                    </div>

                    <div class="info-text">

                        <%= applicant.get("prn") %>

                    </div>

                </div>

            </div>


            <!-- COLLEGE -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-school"></i>

                        College

                    </div>

                    <div class="info-text">

                        <%= applicant.get("college") %>

                    </div>

                </div>

            </div>


            <!-- BRANCH -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-graduation-cap"></i>

                        Branch

                    </div>

                    <div class="info-text">

                        <%= applicant.get("branch") %>

                    </div>

                </div>

            </div>


            <!-- YEAR -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-calendar"></i>

                        Year

                    </div>

                    <div class="info-text">

                        <%= applicant.get("year") %>

                    </div>

                </div>

            </div>


            <!-- SEMESTER -->

            <div class="col-md-4">

                <div class="info-box">

                    <div class="info-title">

                        <i class="fa-solid fa-calendar-days"></i>

                        Semester

                    </div>

                    <div class="info-text">

                        <%= applicant.get("semester") %>

                    </div>

                </div>

            </div>


        </div>



        <!-- =================================================
             RESUME
             ================================================= -->

        <%

            String resumeUrl =
                    (String)
                    applicant.get("resumeUrl");


            if (resumeUrl != null &&
                !resumeUrl.trim().isEmpty()) {

        %>


        <div class="resume-section">


            <div class="resume-title">

                <i class="fa-solid fa-file-pdf"></i>

                Student Resume

            </div>


            <a href="<%= request.getContextPath() + "/" + resumeUrl %>"
               target="_blank"
               class="btn btn-primary">


                <i class="fa-solid fa-eye"></i>

                View Resume


            </a>


            <a href="<%= request.getContextPath() + "/" + resumeUrl %>"
               download
               class="btn btn-outline-primary">


                <i class="fa-solid fa-download"></i>

                Download Resume


            </a>


        </div>


        <%

            }

        %>



        <hr>



        <!-- =================================================
             APPLICATION ACTIONS
             ================================================= -->

        <h5 class="mb-3">

            <i class="fa-solid fa-gears"></i>

            Application Actions

        </h5>


        <div class="d-flex flex-wrap gap-2">


            <!-- SHORTLIST -->

            <form action="ManageApplicantsServlet"
                  method="post">


                <input type="hidden"
                       name="applicationId"
                       value="<%= applicant.get("applicationId") %>">


                <input type="hidden"
                       name="action"
                       value="shortlist">


                <button type="submit"
                        class="btn btn-warning">


                    <i class="fa-solid fa-user-check"></i>

                    Shortlist


                </button>


            </form>



            <!-- REJECT -->

            <form action="ManageApplicantsServlet"
                  method="post"
                  onsubmit="return confirm('Are you sure you want to reject this applicant?');">


                <input type="hidden"
                       name="applicationId"
                       value="<%= applicant.get("applicationId") %>">


                <input type="hidden"
                       name="action"
                       value="reject">


                <button type="submit"
                        class="btn btn-danger">


                    <i class="fa-solid fa-user-xmark"></i>

                    Reject


                </button>


            </form>



            <!-- SELECT / APPROVE -->

            <form action="ManageApplicantsServlet"
                  method="post"
                  onsubmit="return confirm('Are you sure you want to select this applicant?');">


                <input type="hidden"
                       name="applicationId"
                       value="<%= applicant.get("applicationId") %>">


                <input type="hidden"
                       name="action"
                       value="select">


                <button type="submit"
                        class="btn btn-success">


                    <i class="fa-solid fa-circle-check"></i>

                    Select / Approve


                </button>


            </form>


        </div>


    </div>


    <%

            }

        }

        else {

    %>



    <!-- =================================================
         NO APPLICANTS
         ================================================= -->

    <div class="empty-card">


        <i class="fa-solid fa-users fa-3x mb-3"></i>


        <h3>

            No Applications Yet

        </h3>


        <p class="text-muted">

            No students have applied for your jobs yet.

        </p>


        <a href="ManageJobsServlet"
           class="btn btn-primary">


            <i class="fa-solid fa-briefcase"></i>

            View Jobs


        </a>


    </div>


    <%

        }

    %>


</div>



<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer class="footer">


    <h5>

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </h5>


    <p>

        Recruiter Applicant Management

    </p>


    <p>

        © 2026 Campus Placement Portal

    </p>


</footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>