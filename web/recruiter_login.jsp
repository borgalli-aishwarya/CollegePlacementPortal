<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Recruiter Login | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Poppins, sans-serif;
}

body {
    background: #f5f7fc;
}

/* ================= NAVBAR ================= */

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
    margin-left: 20px;
    font-weight: 500;
}

.nav-link:hover {
    color: #dbeafe !important;
}

/* ================= HERO ================= */

.hero {
    min-height: 82vh;
    display: flex;
    align-items: center;
}

.left h1 {
    font-size: 48px;
    color: #3d2fc7;
    font-weight: 700;
}

.left p {
    color: #666;
}

.left li {
    list-style: none;
    margin: 14px 0;
}

.left i {
    color: #4357e8;
    margin-right: 10px;
}

/* ================= LOGIN CARD ================= */

.card-login {
    background: white;
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0,0,0,.15);
}

.card-login h3 {
    color: #333;
    font-weight: 600;
}

/* ================= ERROR MESSAGE ================= */

.login-error {
    background: #f8d7da;
    color: #842029;
    border: 1px solid #f5c2c7;
    border-radius: 8px;
    padding: 12px 15px;
    margin-bottom: 20px;
    font-size: 14px;
}

.login-error i {
    margin-right: 8px;
}

/* ================= LOGIN BUTTON ================= */

.btn-login {
    background: #2468ff;
    color: white;
    width: 100%;
    height: 48px;
    border: none;
    border-radius: 10px;
    font-weight: 500;
}

.btn-login:hover {
    background: #0d5ae6;
    color: white;
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
    padding: 25px 0;
    text-align: center;
}

.footer p {
    margin: 5px 0;
}

/* ================= MOBILE ================= */

@media (max-width: 991px) {

    .hero {
        padding: 50px 0;
    }

    .left {
        text-align: center;
        margin-bottom: 40px;
    }

    .left h1 {
        font-size: 38px;
    }

    .nav-link {
        margin-left: 0;
    }

}

</style>

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand fw-bold"
           href="index.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <!-- MOBILE MENU -->

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

                    <a class="nav-link"
                       href="index.jsp">

                        <i class="fa-solid fa-house"></i>
                        Home

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero">

<div class="container">

<div class="row align-items-center">


<!-- ================= LEFT SIDE ================= -->

<div class="col-lg-6 left">

    <h1>
        Recruiter Portal
    </h1>

    <p class="mt-3 fs-5">
        Connect with talent for campus placement drives
        and job opportunities.
    </p>

    <ul class="mt-4">

        <li>
            <i class="fa-solid fa-circle-check"></i>
            Post Job Openings & Campus Drives
        </li>

        <li>
            <i class="fa-solid fa-circle-check"></i>
            Review Student Applications
        </li>

        <li>
            <i class="fa-solid fa-circle-check"></i>
            Manage the Recruitment Process
        </li>

    </ul>

</div>


<!-- ================= LOGIN FORM ================= -->

<div class="col-lg-5 offset-lg-1">

<div class="card-login">

    <h3 class="text-center mb-3">
        Recruiter Login
    </h3>


    <!-- ================= ERROR MESSAGE ================= -->

    <%
        String error = request.getParameter("error");

        if ("1".equals(error)) {
    %>

        <div class="login-error">

            <i class="fa-solid fa-circle-exclamation"></i>

            <strong>Invalid email or password.</strong>

            Please check your login details and try again.

        </div>

    <%
        }
    %>


    <!-- ================= LOGIN FORM ================= -->

    <form action="recruiterloginservlet"
          method="post">


        <!-- EMAIL -->

        <div class="mb-3">

            <label class="form-label">
                Email
            </label>

            <div class="input-group">

                <span class="input-group-text">

                    <i class="fa fa-envelope"></i>

                </span>

                <input class="form-control"
                       type="email"
                       name="email"
                       placeholder="Enter your email"
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

                    <i class="fa fa-lock"></i>

                </span>

                <input class="form-control"
                       type="password"
                       name="password"
                       placeholder="Enter your password"
                       required>

            </div>

        </div>


        <!-- OPTIONS -->

        <div class="d-flex justify-content-between mb-3">

            <div>

                <input type="checkbox"
                       name="remember">

                Remember Me

            </div>

            <a href="#">
                Forgot Password?
            </a>

        </div>


        <!-- LOGIN BUTTON -->

        <button type="submit"
                class="btn-login">

            <i class="fa-solid fa-right-to-bracket"></i>

            Login

        </button>


        <!-- REGISTER -->

        <p class="text-center mt-3">

            Don't have an account?

            <a href="recruiter_Register.jsp">
                Register Here
            </a>

        </p>


    </form>

</div>

</div>

</div>

</div>

</section>


<!-- ================= FOOTER ================= -->

<footer class="footer">

<div class="container">

    <h5>

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </h5>

    <p>
        Empowering recruiters to hire top talent.
    </p>

    <p>
        © 2026 Campus Placement Portal
    </p>

</div>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>