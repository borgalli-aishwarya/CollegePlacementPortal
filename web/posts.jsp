<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Post New Job</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f5f7fc;
            margin: 0;
        }

        .navbar {
            background: linear-gradient(
                90deg,
                #3b4cb8,
                #4f32c2,
                #5a2eb8
            );
            padding: 15px 0;
        }

        .navbar-brand {
            color: white !important;
            font-weight: 700;
            font-size: 23px;
        }

        .nav-link {
            color: white !important;
            margin-left: 20px;
        }

        .job-section {
            padding: 50px 0;
        }

        .job-card {
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.10);
            max-width: 800px;
            margin: auto;
        }

        .job-title {
            text-align: center;
            color: #2468ff;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 7px;
        }

        .form-control,
        .form-select {
            min-height: 50px;
            border-radius: 9px;
        }

        textarea.form-control {
            min-height: 120px;
        }

        .btn-post {
            width: 100%;
            background: #2468ff;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 9px;
            font-size: 17px;
            font-weight: 600;
        }

        .btn-post:hover {
            background: #1457df;
            color: white;
        }

        #otherRoleDiv {
            display: none;
        }

    </style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

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
                       href="recruiter_dashboard.jsp">

                        <i class="fa-solid fa-house"></i>
                        Dashboard

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- ================= POST JOB ================= -->

<section class="job-section">

    <div class="container">

        <div class="job-card">

            <h2 class="job-title">

                <i class="fa-solid fa-briefcase"></i>

                Post New Job

            </h2>


            <!-- IMPORTANT -->
            <!-- Action must be PostJobServlet -->

            <form action="PostJobServlet"
                  method="post">


                <!-- JOB TITLE -->

                <div class="mb-3">

                    <label class="form-label">
                        Job Title
                    </label>

                    <input type="text"
                           class="form-control"
                           name="title"
                           placeholder="Example: Java Developer"
                           required>

                </div>


                <!-- COMPANY -->

                <div class="mb-3">

                    <label class="form-label">
                        Company Name
                    </label>

                    <input type="text"
                           class="form-control"
                           name="company"
                           value="Infosys"
                           readonly>

                </div>


                <!-- ROLE -->

                <div class="mb-3">

                    <label class="form-label">
                        Role Type
                    </label>

                    <select class="form-select"
                            name="roleType"
                            id="roleType"
                            onchange="showOtherRole()"
                            required>

                        <option value="">
                            Select Role
                        </option>

                        <option value="Software Developer">
                            Software Developer
                        </option>

                        <option value="Java Developer">
                            Java Developer
                        </option>

                        <option value="Python Developer">
                            Python Developer
                        </option>

                        <option value="Web Developer">
                            Web Developer
                        </option>

                        <option value="Full Stack Developer">
                            Full Stack Developer
                        </option>

                        <option value="Data Analyst">
                            Data Analyst
                        </option>

                        <option value="Data Scientist">
                            Data Scientist
                        </option>

                        <option value="Cloud Engineer">
                            Cloud Engineer
                        </option>

                        <option value="Software Tester">
                            Software Tester
                        </option>

                        <option value="UI UX Designer">
                            UI/UX Designer
                        </option>

                        <option value="Business Analyst">
                            Business Analyst
                        </option>

                        <option value="Intern">
                            Intern
                        </option>

                        <option value="Other">
                            Other
                        </option>

                    </select>

                </div>


                <!-- OTHER ROLE -->

                <div class="mb-3"
                     id="otherRoleDiv">

                    <label class="form-label">
                        Enter Your Role
                    </label>

                    <input type="text"
                           class="form-control"
                           name="otherRole"
                           id="otherRole"
                           placeholder="Enter your role">

                </div>


                <!-- REQUIREMENTS -->

                <div class="mb-3">

                    <label class="form-label">
                        Requirements
                    </label>

                    <textarea class="form-control"
                              name="requirements"
                              placeholder="Example: Graduate with good communication skills"
                              required></textarea>

                </div>


                <!-- TECHNICAL SKILLS -->

                <div class="mb-3">

                    <label class="form-label">
                        Technical Skills
                    </label>

                    <textarea class="form-control"
                              name="technicalSkills"
                              placeholder="Example: Java, SQL, HTML, CSS"
                              required></textarea>

                </div>


                <!-- DURATION + SALARY -->

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Duration (Months)
                        </label>

                        <input type="number"
                               class="form-control"
                               name="duration"
                               placeholder="Example: 6"
                               min="1">

                    </div>


                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Salary / Stipend
                        </label>

                        <input type="text"
                               class="form-control"
                               name="salary"
                               placeholder="Example: ₹25,000/month">

                    </div>

                </div>


                <!-- DEADLINE -->

                <div class="mb-4">

                    <label class="form-label">
                        Application Deadline
                    </label>

                    <input type="date"
                           class="form-control"
                           name="deadline"
                           required>

                </div>


                <!-- SUBMIT -->

                <button type="submit"
                        class="btn-post">

                    <i class="fa-solid fa-paper-plane"></i>

                    Post Job

                </button>

            </form>

        </div>

    </div>

</section>


<script>

function showOtherRole() {

    var role =
        document.getElementById("roleType").value;

    var otherDiv =
        document.getElementById("otherRoleDiv");

    var otherInput =
        document.getElementById("otherRole");


    if (role === "Other") {

        otherDiv.style.display = "block";

        otherInput.required = true;

    } else {

        otherDiv.style.display = "none";

        otherInput.required = false;

        otherInput.value = "";
    }
}

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>