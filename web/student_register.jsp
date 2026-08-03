<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration - Campus Placement Portal</title>

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
            background: linear-gradient(90deg, #3b4cb8, #4f32c2, #5a2eb8);
            padding: 16px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .12);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: 700;
            color: white !important;
        }

        .nav-link {
            color: white !important;
            font-size: 15px;
            margin-left: 20px;
            font-weight: 500;
            transition: .3s;
        }

        .nav-link:hover {
            color: #ddd !important;
        }

        .signup-btn {
            background: white;
            color: #3b4cb8;
            padding: 8px 22px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: .3s;
        }

        .signup-btn:hover {
            background: #f0f0f0;
            color: #3b4cb8;
        }

        /*================ REGISTER SECTION ================*/
        .register-section {
            flex: 1;
            display: flex;
            align-items: center;
            padding: 45px 0;
        }

        .register-card {
            background: white;
            border-radius: 20px;
            padding: 40px 45px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, .06);
            width: 100%;
            max-width: 880px;
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

        /* Inputs & Form Controls */
        .form-label {
            font-size: 14px;
            font-weight: 500;
            color: #444;
            margin-bottom: 6px;
        }

        .form-control, .form-select {
            height: 44px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ced4da;
        }

        .form-control:focus, .form-select:focus {
            border-color: #4b5cff;
            box-shadow: 0 0 0 0.2rem rgba(75, 92, 255, 0.2);
        }

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

        /*================ EXACT FOOTER FROM YOUR IMAGE ================*/
        footer {
            background: linear-gradient(90deg, #3b4cb8 0%, #4f32c2 50%, #5a2eb8 100%);
            color: white;
            padding: 28px 15px;
            margin-top: auto;
            text-align: center;
            width: 100%;
        }

        .footer-title {
            font-size: 18px;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .footer-subtitle {
            font-size: 14px;
            color: #e2e8f0;
            margin-bottom: 12px;
            font-weight: 400;
        }

        .copyright {
            font-size: 13px;
            color: #cbd5e1;
            margin-bottom: 0;
            font-weight: 400;
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
                        <a href="studentLogin.jsp" class="btn signup-btn">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- REGISTER FORM CARD -->
    <section class="register-section">
        <div class="container">
            <div class="register-card">
                <h3><i class="fa-solid fa-user-plus me-2" style="color: #4f32c2;"></i>Student Registration</h3>
                <p class="register-subtitle">Create your account to access campus placement opportunities.</p>

                <form action="RegisterServlet" method="POST" enctype="multipart/form-data">
                    <div class="row g-3">
                        <!-- Full Name & Email -->
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullName" placeholder="Enter Full Name" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Email Address" required>
                        </div>

                        <!-- Mobile & PRN -->
                        <div class="col-md-6">
                            <label class="form-label">Mobile Number</label>
                            <input type="tel" class="form-control" name="mobile" placeholder="Enter Mobile Number" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">PRN / Roll Number</label>
                            <input type="text" class="form-control" name="prn" placeholder="Enter PRN Number" required>
                        </div>

                        <!-- College & Branch -->
                        <div class="col-md-6">
                            <label class="form-label">College</label>
                            <select class="form-select" name="college" required>
                                <option value="" selected disabled>Select College</option>
                                <option value="College of Engineering">College of Engineering</option>
                                <option value="Institute of Technology">Institute of Technology</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Branch</label>
                            <select class="form-select" name="branch" required>
                                <option value="" selected disabled>Select Branch</option>
                                <option value="CSE">Computer Science & Engg.</option>
                                <option value="IT">Information Technology</option>
                                <option value="ECE">Electronics & Comm.</option>
                                <option value="MECH">Mechanical Engg.</option>
                            </select>
                        </div>

                        <!-- Year & Semester -->
                        <div class="col-md-6">
                            <label class="form-label">Year</label>
                            <select class="form-select" name="year" required>
                                <option value="" selected disabled>Select Year</option>
                                <option value="FE">First Year (FE)</option>
                                <option value="SE">Second Year (SE)</option>
                                <option value="TE">Third Year (TE)</option>
                                <option value="BE">Final Year (BE)</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Semester</label>
                            <select class="form-select" name="semester" required>
                                <option value="" selected disabled>Select Semester</option>
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

                        <!-- DOB & Gender -->
                       <div class="col-md-6">
    <label class="form-label">Date of Birth</label>
    <input type="date" class="form-control" name="dob" required>
</div>
<div class="col-md-6">
    <label class="form-label d-block">Gender</label>
    
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Male" required>
        <label class="form-check-label" for="genderMale">Male</label>
    </div>
    
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Female">
        <label class="form-check-label" for="genderFemale">Female</label>
    </div>
    
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="genderOther" value="Other">
        <label class="form-check-label" for="genderOther">Other</label>
    </div>
</div>
                        <!-- Password & Confirm Password -->
                        <div class="col-md-6">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Create Password" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                        </div>

                        <!-- Resume Upload -->
                        <div class="col-12">
                            <label class="form-label">Upload Resume (PDF)</label>
                            <input type="file" class="form-control" name="resume" accept=".pdf" required>
                        </div>

                        <!-- Terms Checkbox -->
                        <div class="col-12 mt-2">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="terms" required>
                                <label class="form-check-label text-secondary" style="font-size: 13px;" for="terms">
                                    I agree to the Terms & Conditions and confirm all details are accurate.
                                </label>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-12 mt-3">
                            <button type="submit" class="btn btn-register-submit">Create Account</button>
                        </div>
                    </div>
                </form>

                <div class="login-link">
                    Already have an account? <a href="studentLogin.jsp">Login Here</a>
                </div>
            </div>
        </div>
    </section>

    <!-- EXACT FOOTER -->
    <footer>
        <div class="container text-center">
            <h5 class="footer-title">
                <i class="fa-solid fa-graduation-cap"></i>
                Campus Placement Portal
            </h5>
            <p class="footer-subtitle">Empowering students with career opportunities.</p>
            <p class="copyright">© 2026 Campus Placement Portal | All Rights Reserved</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>