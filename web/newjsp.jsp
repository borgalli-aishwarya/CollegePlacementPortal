<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login - Campus Placement Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f7f8fc;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /*================ NAVBAR ================*/
        .navbar {
            background: linear-gradient(90deg, #5364ff, #3f51e8, #3d2bb7);
            padding: 16px 0;
            box-shadow: 0 5px 20px rgba(0, 0, 0, .12);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            font-size: 28px;
            font-weight: 700;
            color: white !important;
        }

        .nav-link {
            color: white !important;
            font-size: 16px;
            margin-left: 20px;
            font-weight: 500;
            transition: .3s;
        }

        .nav-link:hover {
            color: #ddd !important;
        }

        .signup-btn {
            border: 2px solid white;
            color: white;
            padding: 8px 22px;
            border-radius: 8px;
            font-weight: 600;
            background: transparent;
            text-decoration: none;
            transition: .3s;
        }

        .signup-btn:hover {
            background: white;
            color: #3f51e8;
        }

        /*================ LOGIN MAIN SECTION ================*/
        .login-section {
            flex: 1;
            display: flex;
            align-items: center;
            padding: 60px 0;
        }

        /* Left Side Welcome Banner */
        .welcome-title {
            font-size: 52px;
            font-weight: 800;
            color: #3f51e8;
            margin-bottom: 15px;
        }

        .welcome-subtitle {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 30px;
            max-width: 480px;
        }

        .feature-list {
            list-style: none;
            padding: 0;
        }

        .feature-list li {
            font-size: 16px;
            font-weight: 500;
            color: #333;
            margin-bottom: 14px;
            display: flex;
            align-items: center;
        }

        .feature-list li i {
            color: #3f51e8;
            margin-right: 12px;
            font-size: 18px;
        }

        /* Right Side Login Card */
        .login-card {
            background: white;
            border-radius: 20px;
            padding: 40px 35px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, .08);
            width: 100%;
            max-width: 420px;
            margin: auto;
        }

        .login-card h3 {
            font-size: 28px;
            font-weight: 700;
            color: #222;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 500;
            color: #444;
            margin-bottom: 6px;
        }

        .input-group-text {
            background: #fff;
            border-right: none;
            color: #666;
            font-size: 14px;
        }

        .form-control {
            height: 44px;
            font-size: 14px;
            border-left: none;
            border-radius: 0 8px 8px 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #ced4da;
        }

        .input-group:focus-within {
            box-shadow: 0 0 0 0.2rem rgba(83, 100, 255, 0.2);
            border-radius: 8px;
        }

        .input-group:focus-within .input-group-text,
        .input-group:focus-within .form-control {
            border-color: #5364ff;
        }

        .forgot-link {
            color: #3158ff;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        .btn-login-submit {
            background: #3158ff;
            color: white;
            height: 46px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            width: 100%;
            margin-top: 15px;
            transition: .3s;
        }

        .btn-login-submit:hover {
            background: #2345d9;
            color: white;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .register-link a {
            color: #3158ff;
            font-weight: 600;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /*================ FOOTER ================*/
        footer {
            background: linear-gradient(90deg, #5364ff, #3f51e8, #3d2bb7);
            color: white;
            padding: 25px 0;
            margin-top: auto;
            text-align: center;
        }

        footer h5 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        footer p {
            font-size: 14px;
            margin-bottom: 6px;
            color: #e0e0e0;
        }

        footer .copyright {
            font-size: 13px;
            color: #d1d1d1;
            margin-bottom: 0;
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fa-solid fa-graduation-cap me-2"></i>Campus Placement Portal
            </a>

            <button class="navbar-toggler bg-white" data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Jobs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Companies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item ms-2">
                        <a href="register.jsp" class="btn signup-btn">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- MAIN CONTENT -->
    <section class="login-section">
        <div class="container">
            <div class="row align-items-center">
                
                <!-- Left Side Banner -->
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <h1 class="welcome-title">Welcome Back!</h1>
                    <p class="welcome-subtitle">
                        Login to access your placement dashboard and manage your career opportunities.
                    </p>

                    <ul class="feature-list">
                        <li><i class="fa-solid fa-circle-check"></i> Apply for Campus Drives</li>
                        <li><i class="fa-solid fa-circle-check"></i> Track Applications</li>
                        <li><i class="fa-solid fa-circle-check"></i> View Company Details</li>
                        <li><i class="fa-solid fa-circle-check"></i> Update Resume</li>
                    </ul>
                </div>

                <!-- Right Side Login Card -->
                <div class="col-lg-6">
                    <div class="login-card">
                        <h3>Student Login</h3>

                        <form action="StudentLoginServlet" method="POST">
                            <!-- Email Input -->
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                                </div>
                            </div>

                            <!-- Password Input -->
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                                </div>
                            </div>

                            <!-- Remember Me & Forgot Password -->
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe">
                                    <label class="form-check-label text-secondary" style="font-size: 13px;" for="rememberMe">
                                        Remember Me
                                    </label>
                                </div>
                                <a href="#" class="forgot-link">Forgot Password?</a>
                            </div>

                            <!-- Login Button -->
                            <button type="submit" class="btn btn-login-submit">Login</button>
                        </form>

                        <div class="register-link">
                            Don't have an account? <a href="register.jsp">Register Now</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        <div class="container text-center">
            <h5><i class="fa-solid fa-graduation-cap me-2"></i>Campus Placement Portal</h5>
            <p>Empowering students with career opportunities.</p>
            <p class="copyright">© 2026 Campus Placement Portal | All Rights Reserved</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html><%-- 
    Document   : newjsp
    Created on : 31 Jul, 2026, 9:33:25 PM
    Author     : Aishwarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
