<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Login | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

/* LOGIN SECTION */

.login-section {
    min-height: 80vh;
    display: flex;
    align-items: center;
}

.info-section h1 {
    color: #3d2fc7;
    font-weight: 700;
    font-size: 48px;
}

.info-section p {
    color: #666;
}

.info-section li {
    list-style: none;
    margin: 15px 0;
}

.info-section li i {
    color: #4357e8;
    margin-right: 10px;
}

/* LOGIN CARD */

.login-card {
    background: white;
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}

.login-card h3 {
    font-weight: 600;
}

.btn-login {
    width: 100%;
    height: 48px;
    border: none;
    border-radius: 10px;
    background: #2468ff;
    color: white;
    font-size: 16px;
    font-weight: 500;
}

.btn-login:hover {
    background: #0d5ae6;
}

/* FOOTER */

.footer {
    background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
    color: white;
    padding: 25px;
    text-align: center;
}

</style>

</head>

<body>

<!-- NAVBAR -->

```jsp
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark"
     style="background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand fw-bold"
           href="index.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <!-- MOBILE MENU BUTTON -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar"
                aria-controls="mainNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- ONLY HOME -->

        <div class="collapse navbar-collapse"
             id="mainNavbar">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link active"
                       href="index.jsp">

                        <i class="fa-solid fa-house"></i>
                        Home

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>




<!-- LOGIN SECTION -->

<section class="login-section">

    <div class="container">

        <div class="row align-items-center">

            <!-- LEFT SIDE -->

            <div class="col-lg-6 info-section">

                <h1>
                    Admin Portal
                </h1>

                <p class="fs-5 mt-3">
                    Manage the Campus Placement Portal
                    with complete administrative control.
                </p>

                <ul class="mt-4">

                    <li>
                        <i class="fa-solid fa-circle-check"></i>
                        Approve Recruiter Accounts
                    </li>

                    <li>
                        <i class="fa-solid fa-circle-check"></i>
                        Manage Student Records
                    </li>

                    <li>
                        <i class="fa-solid fa-circle-check"></i>
                        Manage Job Postings
                    </li>

                    <li>
                        <i class="fa-solid fa-circle-check"></i>
                        View Applications
                    </li>

                </ul>

            </div>


            <!-- RIGHT SIDE -->

            <div class="col-lg-5 offset-lg-1">

                <div class="login-card">

                    <h3 class="text-center mb-4">
                        <i class="fa-solid fa-user-shield"></i>
                        Admin Login
                    </h3>


                    <!-- ERROR MESSAGES -->

                    <%
                        String error = request.getParameter("error");

                        if ("1".equals(error)) {
                    %>

                        <div class="alert alert-warning">
                            Please enter username and password.
                        </div>

                    <%
                        } else if ("invalid".equals(error)) {
                    %>

                        <div class="alert alert-danger">
                            Invalid username or password.
                        </div>

                    <%
                        } else if ("db".equals(error)) {
                    %>

                        <div class="alert alert-danger">
                            Database connection failed.
                        </div>

                    <%
                        } else if ("exception".equals(error)) {
                    %>

                        <div class="alert alert-danger">
                            Something went wrong. Please try again.
                        </div>

                    <%
                        }
                    %>


                    <!-- LOGIN FORM -->

                    <form action="AdminLoginServlet" method="post">

                        <!-- USERNAME -->

                        <div class="mb-3">

                            <label class="form-label">
                                Username
                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    <i class="fa-solid fa-user"></i>
                                </span>

                                <input type="text"
                                       name="username"
                                       class="form-control"
                                       placeholder="Enter username"
                                       required>

                            </div>

                        </div>


                        <!-- PASSWORD -->

                        <div class="mb-3">

                            <label class="form-label">
                                Password
                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    <i class="fa-solid fa-lock"></i>
                                </span>

                                <input type="password"
                                       name="password"
                                       class="form-control"
                                       placeholder="Enter password"
                                       required>

                            </div>

                        </div>


                        <!-- LOGIN BUTTON -->

                        <button type="submit"
                                class="btn-login">

                            <i class="fa-solid fa-right-to-bracket"></i>
                            Login

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- FOOTER -->

<footer class="footer">

    <div class="container">

        <h5>
            <i class="fa-solid fa-graduation-cap"></i>
            Campus Placement Portal
        </h5>

        <p>
            Empowering administrators to manage campus placements.
        </p>

        <p>
            © 2026 Campus Placement Portal
        </p>

    </div>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>