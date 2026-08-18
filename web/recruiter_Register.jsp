<%-- 
    Document   : recruiter_Register.jsp
    Created on : 2 Aug, 2026, 1:58:04 PM
    Author     : Aishwarya
--%>

<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Recruiter Registration | Campus Placement Portal</title>


<!-- Bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">


<!-- Font Awesome -->

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<!-- Google Font -->

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


/* NAVBAR */

.navbar {
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );

    padding: 16px 0;
}

.navbar-brand {
    color: white !important;
    font-weight: 700;
    font-size: 24px;
}

.nav-link {
    color: white !important;
    margin-left: 20px;
    font-weight: 500;
}

.nav-link:hover {
    color: #ddd !important;
}


/* REGISTER SECTION */

.register-section {
    padding: 60px 0;
}


.card-register {

    background: white;

    padding: 40px;

    border-radius: 18px;

    box-shadow:
        0 15px 35px rgba(0,0,0,.15);

}


/* FORM */

.card-register label {

    font-weight: 500;

    margin-bottom: 7px;

    color: #222;

}


.form-control,
.form-select {

    height: 46px;

    border-radius: 8px;

    border: 1px solid #ced4da;

}


.form-control:focus,
.form-select:focus {

    border-color: #3158ff;

    box-shadow:
        0 0 0 0.2rem rgba(49,88,255,.15);

}


/* BUTTON */

.btn-register {

    background: #2468ff;

    color: white;

    width: 100%;

    height: 48px;

    border: none;

    border-radius: 10px;

    font-size: 16px;

    font-weight: 600;

    transition: .3s;

}


.btn-register:hover {

    background: #0d5ae6;

}


/* FOOTER */

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


        <!-- MOBILE BUTTON -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar"
                aria-controls="mainNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- HOME -->

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



<!-- ================= REGISTRATION ================= -->

<section class="register-section">

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card-register">


<h3 class="text-center mb-4">

    <i class="fa-solid fa-building"
       style="color:#4f32c2;"></i>

    Recruiter Registration

</h3>


<p class="text-center text-muted mb-4">

    Create your recruiter account to post jobs
    and manage student applications.

</p>



<form action="RecruiterRegisterServlet"
      method="post"
      class="row g-3">


<!-- COMPANY NAME -->

<div class="col-12">

    <label class="form-label">

        Company Name

    </label>

    <input type="text"
           class="form-control"
           name="company_name"
           placeholder="Enter Company Name"
           required>

</div>



<!-- HR CONTACT -->

<div class="col-12">

    <label class="form-label">

        HR Contact Person

    </label>

    <input type="text"
           class="form-control"
           name="hr_contact_person"
           placeholder="Enter HR Name"
           required>

</div>



<!-- EMAIL -->

<div class="col-md-6">

    <label class="form-label">

        Email Address

    </label>

    <input type="email"
           class="form-control"
           name="email"
           placeholder="Enter Email Address"
           required>

</div>



<!-- PHONE -->

<div class="col-md-6">

    <label class="form-label">

        Phone Number

    </label>

    <input type="tel"
           class="form-control"
           name="phone"
           placeholder="Enter Phone Number"
           required>

</div>



<!-- COMPANY WEBSITE -->

<div class="col-12">

    <label class="form-label">

        Company Website

    </label>

    <input type="url"
           class="form-control"
           name="website_url"
           placeholder="https://company-website.com">

</div>



<!-- LOCATION -->

<div class="col-12">

    <label class="form-label">

        Company Location

    </label>

    <input type="text"
           class="form-control"
           name="location"
           placeholder="Enter Company Location">

</div>



<!-- PASSWORD -->

<div class="col-md-6">

    <label class="form-label">

        Password

    </label>

    <input type="password"
           class="form-control"
           name="password"
           placeholder="Create Password"
           required>

</div>



<!-- CONFIRM PASSWORD -->

<div class="col-md-6">

    <label class="form-label">

        Confirm Password

    </label>

    <input type="password"
           class="form-control"
           name="confirmPassword"
           placeholder="Confirm Password"
           required>

</div>



<!-- SUBMIT -->

<div class="col-12 mt-4">

    <button type="submit"
            class="btn-register">

        <i class="fa-solid fa-user-plus"></i>

        Create Account

    </button>

</div>


</form>



<!-- LOGIN -->

<p class="text-center mt-3">

    Already have an account?

    <a href="recruiter_login.jsp"
       style="color:#3158ff;font-weight:600;text-decoration:none;">

        Login Here

    </a>

</p>


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