<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Registration - Campus Placement Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f7f8fc;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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

            box-shadow: 0 4px 15px rgba(0,0,0,.12);
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
        }

        .nav-link:hover {
            color: #ddd !important;
        }

        /* REGISTER SECTION */

        .register-section {
            flex: 1;
            padding: 45px 0;
        }

        .register-card {
            background: white;
            border-radius: 20px;
            padding: 40px 45px;
            box-shadow: 0 10px 30px rgba(0,0,0,.08);

            width: 100%;
            max-width: 900px;

            margin: auto;
        }

        .register-card h3 {
            font-size: 32px;
            font-weight: 700;
            color: #222;

            text-align: center;
            margin-bottom: 6px;
        }

        .register-subtitle {
            text-align: center;
            color: #666;
            font-size: 15px;
            margin-bottom: 30px;
        }

        /* LABELS */

        .form-label {
            font-size: 14px;
            font-weight: 500;
            color: #444;

            margin-bottom: 6px;
        }

        /* INPUTS */

        .form-control,
        .form-select {
            min-height: 44px;
            font-size: 14px;

            border-radius: 8px;

            border: 1px solid #ced4da;
        }

        .form-control:focus,
        .form-select:focus {

            border-color: #4b5cff;

            box-shadow:
                0 0 0 .2rem
                rgba(75,92,255,.2);
        }

        /* RESUME BOX */

        .resume-box {

            background: #f8f9fc;

            border: 1px dashed #9aa5d6;

            border-radius: 10px;

            padding: 18px;
        }

        .resume-box i {

            color: #4f32c2;

            margin-right: 8px;
        }

        .resume-help {

            color: #777;

            font-size: 12px;

            margin-top: 6px;
        }

        /* BUTTON */

        .btn-register-submit {

            background: #3158ff;

            color: white;

            height: 48px;

            border-radius: 8px;

            font-size: 16px;

            font-weight: 600;

            border: none;

            width: 100%;

            transition: .3s;
        }

        .btn-register-submit:hover {

            background: #2345d9;

            color: white;
        }

        /* LOGIN LINK */

        .login-link {

            text-align: center;

            margin-top: 20px;

            font-size: 14px;

            color: #555;
        }

        .login-link a {

            color: #3158ff;

            font-weight: 600;

            text-decoration: none;
        }

        .login-link a:hover {

            text-decoration: underline;
        }

        /* FOOTER */

        footer {

            background: linear-gradient(
                90deg,
                #3b4cb8 0%,
                #4f32c2 50%,
                #5a2eb8 100%
            );

            color: white;

            padding: 28px 15px;

            text-align: center;

            margin-top: auto;
        }

        .footer-title {

            font-size: 18px;

            font-weight: 700;

            margin-bottom: 6px;
        }

        .footer-subtitle {

            font-size: 14px;

            color: #e2e8f0;

            margin-bottom: 12px;
        }

        .copyright {

            font-size: 13px;

            color: #cbd5e1;

            margin-bottom: 0;
        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar navbar-expand-lg navbar-dark">

    <div class="container-fluid px-4">

        <a class="navbar-brand"
           href="index.jsp">

            <i class="fa-solid fa-graduation-cap"></i>

            Campus Placement Portal

        </a>


        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>


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



<!-- =====================================================
     REGISTRATION
     ===================================================== -->

<section class="register-section">

    <div class="container">

        <div class="register-card">


            <h3>

                <i class="fa-solid fa-user-plus"
                   style="color:#4f32c2;"></i>

                Student Registration

            </h3>


            <p class="register-subtitle">

                Create your account to access campus placement opportunities.

            </p>



            <!-- IMPORTANT:
                 enctype is required for resume upload
            -->

            <form action="StudentRegisterServlet"
                  method="post"
                  enctype="multipart/form-data"
                  class="row g-3">


                <!-- FULL NAME -->

                <div class="col-md-6">

                    <label class="form-label">

                        Full Name

                    </label>

                    <input type="text"
                           class="form-control"
                           name="name"
                           placeholder="Enter Full Name"
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



                <!-- MOBILE -->

                <div class="col-md-6">

                    <label class="form-label">

                        Mobile Number

                    </label>

                    <input type="tel"
                           class="form-control"
                           name="mobile"
                           placeholder="Enter Mobile Number"
                           required>

                </div>



                <!-- PRN -->

                <div class="col-md-6">

                    <label class="form-label">

                        PRN / Roll Number

                    </label>

                    <input type="text"
                           class="form-control"
                           name="prn"
                           placeholder="Enter PRN Number"
                           required>

                </div>



                <!-- COLLEGE -->

                <div class="col-md-6">

                    <label class="form-label">

                        College

                    </label>

                    <select class="form-select"
                            name="college"
                            required>

                        <option value="">
                            Select College
                        </option>

                        <option value="College of Engineering">
                            College of Engineering
                        </option>

                        <option value="Institute of Technology">
                            Institute of Technology
                        </option>

                    </select>

                </div>



                <!-- BRANCH -->

                <div class="col-md-6">

                    <label class="form-label">

                        Branch

                    </label>

                    <select class="form-select"
                            name="branch"
                            required>

                        <option value="">
                            Select Branch
                        </option>

                        <option value="CSE">
                            Computer Science & Engineering
                        </option>

                        <option value="IT">
                            Information Technology
                        </option>

                        <option value="ECE">
                            Electronics & Communication
                        </option>

                        <option value="MECH">
                            Mechanical Engineering
                        </option>

                    </select>

                </div>



                <!-- YEAR -->

                <div class="col-md-6">

                    <label class="form-label">

                        Year

                    </label>

                    <select class="form-select"
                            name="year"
                            required>

                        <option value="">
                            Select Year
                        </option>

                        <option value="1">
                            First Year (FE)
                        </option>

                        <option value="2">
                            Second Year (SE)
                        </option>

                        <option value="3">
                            Third Year (TE)
                        </option>

                        <option value="4">
                            Final Year (BE)
                        </option>

                    </select>

                </div>



                <!-- SEMESTER -->

                <div class="col-md-6">

                    <label class="form-label">

                        Semester

                    </label>

                    <select class="form-select"
                            name="semester"
                            required>

                        <option value="">
                            Select Semester
                        </option>

                        <option value="1">Semester I</option>
                        <option value="2">Semester II</option>
                        <option value="3">Semester III</option>
                        <option value="4">Semester IV</option>
                        <option value="5">Semester V</option>
                        <option value="6">Semester VI</option>
                        <option value="7">Semester VII</option>
                        <option value="8">Semester VIII</option>

                    </select>

                </div>



                <!-- DOB -->

                <div class="col-md-6">

                    <label class="form-label">

                        Date of Birth

                    </label>

                    <input type="date"
                           class="form-control"
                           name="dob"
                           required>

                </div>



                <!-- GENDER -->

                <div class="col-md-6">

                    <label class="form-label d-block">

                        Gender

                    </label>

                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="gender"
                               value="Male"
                               required>

                        <label class="form-check-label">
                            Male
                        </label>

                    </div>


                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="gender"
                               value="Female">

                        <label class="form-check-label">
                            Female
                        </label>

                    </div>


                    <div class="form-check form-check-inline">

                        <input class="form-check-input"
                               type="radio"
                               name="gender"
                               value="Other">

                        <label class="form-check-label">
                            Other
                        </label>

                    </div>

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



                <!-- =================================================
                     RESUME UPLOAD
                     ================================================= -->

                <div class="col-12">

                    <label class="form-label">

                        <i class="fa-solid fa-file-pdf"></i>

                        Upload Resume

                    </label>


                    <div class="resume-box">

                        <input type="file"
                               class="form-control"
                               name="resume"
                               accept=".pdf,.doc,.docx"
                               required>


                        <div class="resume-help">

                            Allowed formats:
                            PDF, DOC, DOCX

                            <br>

                            Maximum file size:
                            5 MB

                        </div>

                    </div>

                </div>



                <!-- SUBMIT -->

                <div class="col-12 mt-4">

                    <button type="submit"
                            class="btn-register-submit">

                        <i class="fa-solid fa-user-plus"></i>

                        Create Account

                    </button>

                </div>


            </form>



            <div class="login-link">

                Already have an account?

                <a href="student_login.jsp">
                    Login Here
                </a>

            </div>


        </div>

    </div>

</section>



<!-- FOOTER -->

<footer>

    <h5 class="footer-title">

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </h5>

    <p class="footer-subtitle">

        Empowering students with career opportunities.

    </p>

    <p class="copyright">

        © 2026 Campus Placement Portal

    </p>

</footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>