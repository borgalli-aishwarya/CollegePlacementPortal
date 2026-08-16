<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Student Login | Campus Placement Portal</title>

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
    font-family: 'Poppins', sans-serif;
}

body {
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

    padding: 10px 20px;
}

.navbar-brand {
    color: white !important;
    font-size: 24px;
    font-weight: 700;
}

.nav-link {
    color: white !important;
    font-weight: 500;
    padding: 10px 15px !important;
}

.nav-link:hover {
    color: #dbeafe !important;
}

.nav-link.active {
    color: white !important;
}


/* ================= HERO ================= */

.hero {
    min-height: calc(100vh - 70px);
    display: flex;
    align-items: center;
    padding: 50px 0;
}


/* ================= LEFT CONTENT ================= */

.left h1 {
    font-size: 48px;
    color: #3d2fc7;
    font-weight: 700;
}

.left p {
    color: #64748b;
    line-height: 1.7;
}

.left ul {
    padding-left: 0;
}

.left li {
    list-style: none;
    margin: 16px 0;
    font-size: 16px;
    color: #1f2937;
}

.left li i {
    color: #4357e8;
    margin-right: 10px;
}


/* ================= LOGIN CARD ================= */

.card-login {
    background: white;
    padding: 40px;
    border-radius: 18px;

    box-shadow:
        0 15px 35px rgba(0, 0, 0, 0.12);

    width: 100%;
}

.card-login h3 {
    color: #111827;
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
    margin-right: 7px;
}


/* ================= FORM ================= */

.form-label {
    font-weight: 500;
    color: #374151;
}

.input-group-text {
    background: #f8f9fa;
    min-width: 45px;
    justify-content: center;
}

.form-control {
    height: 45px;
}

.form-control:focus {
    border-color: #4357e8;

    box-shadow:
        0 0 0 0.2rem rgba(67, 87, 232, 0.15);
}


/* ================= LOGIN BUTTON ================= */

.btn-login {
    background: #2468ff;
    color: white;

    width: 100%;
    height: 48px;

    border: none;
    border-radius: 10px;

    font-weight: 600;

    transition: 0.3s;
}

.btn-login:hover {
    background: #0d5ae6;
    color: white;
}


/* ================= LINKS ================= */

.login-link {
    color: #2468ff;
    text-decoration: none;
}

.login-link:hover {
    text-decoration: underline;
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

.footer h5 {
    font-weight: 600;
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

    .left ul {
        text-align: left;
        display: inline-block;
    }

    .navbar-brand {
        font-size: 20px;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand"
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


<!-- ================= HERO ================= -->

<section class="hero">

<div class="container">

<div class="row align-items-center">


<!-- ================= LEFT SIDE ================= -->

<div class="col-lg-6 left">

    <h1>
        Welcome Back!
    </h1>

    <p class="mt-3 fs-5">

        Login to access your placement dashboard
        and manage your career opportunities.

    </p>


    <ul class="mt-4">

        <li>

            <i class="fa-solid fa-circle-check"></i>

            Apply for Campus Drives

        </li>

        <li>

            <i class="fa-solid fa-circle-check"></i>

            Track Applications

        </li>

        <li>

            <i class="fa-solid fa-circle-check"></i>

            View Company Details

        </li>

        <li>

            <i class="fa-solid fa-circle-check"></i>

            Update Resume

        </li>

    </ul>

</div>


<!-- ================= LOGIN CARD ================= -->

<div class="col-lg-5 offset-lg-1">

<div class="card-login">


<h3 class="text-center mb-4">

    Student Login

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

if ("db".equals(error)) {

%>

<div class="login-error">

    <i class="fa-solid fa-circle-exclamation"></i>

    <strong>Unable to connect to the database.</strong>

    Please try again later.

</div>

<%

}

%>


<!-- ================= LOGIN FORM ================= -->

<form action="studentloginservlet"
      method="post">


<!-- EMAIL -->

<div class="mb-3">

    <label class="form-label">
        Email
    </label>

    <div class="input-group">

        <span class="input-group-text">

            <i class="fa-solid fa-envelope"></i>

        </span>

        <input type="email"
               name="email"
               class="form-control"
               placeholder="Enter your email"
               autocomplete="email"
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
               placeholder="Enter your password"
               autocomplete="current-password"
               required>

    </div>

</div>


<!-- REMEMBER / FORGOT -->

<div class="d-flex justify-content-between
            align-items-center mb-3">

    <div>

        <input type="checkbox"
               name="remember"
               id="remember">

        <label for="remember">
            Remember Me
        </label>

    </div>


    <a href="#"
       class="login-link">

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

<p class="text-center mt-3 mb-0">

    Don't have an account?

    <a href="student_register.jsp"
       class="login-link">

        Register Now

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
        Empowering students with career opportunities.
    </p>

    <p>
        © 2026 Campus Placement Portal
    </p>

</div>

</footer>


<!-- ================= BOOTSTRAP ================= -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>