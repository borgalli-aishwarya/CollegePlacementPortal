<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String companyName =
(String) session.getAttribute("companyName");

if (companyName == null) {
response.sendRedirect("recruiter_login.jsp");
return;
}
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
   content="width=device-width, initial-scale=1">

<title>Post New Job | Campus Placement Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

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
    min-height: 100vh;
}


/* ================= NAVBAR ================= */

.navbar {
    background: linear-gradient(
        90deg,
        #3b4cb8,
        #4f32c2,
        #5a2eb8
    );

    min-height: 64px;
}

.navbar-brand {
    color: white !important;
    font-weight: 700;
    font-size: 21px;
}

.nav-link {
    color: white !important;
    font-weight: 500;
    margin-left: 15px;
    border-radius: 8px;
    padding: 8px 12px !important;
}

.nav-link:hover,
.nav-link.active {
    background: rgba(255,255,255,.14);
}


/* ================= MAIN ================= */

.main-section {
    padding: 22px 15px;
    min-height: calc(100vh - 64px);
}

.form-card {
    background: white;
    border-radius: 16px;

    padding: 25px 30px;

    box-shadow:
        0 8px 25px rgba(0,0,0,.08);

    max-width: 1100px;
    margin: auto;
}

.page-title {
    color: #3b4cb8;
    font-weight: 700;
    margin-bottom: 20px;
}


/* ================= FORM ================= */

.form-label {
    font-weight: 500;
    color: #17213c;
    margin-bottom: 6px;
}

.form-control,
.form-select {
    border-radius: 8px;
    border: 1px solid #d8dce8;
    padding: 9px 12px;
    font-size: 14px;
}

.form-control:focus,
.form-select:focus {

    border-color: #3b4cb8;

    box-shadow:
        0 0 0 0.15rem rgba(59,76,184,.15);
}

textarea.form-control {
    resize: vertical;
}


/* ================= DURATION HELP ================= */

.duration-help {
    font-size: 11px;
    color: #777;
    margin-top: 4px;
}


/* ================= BUTTON ================= */

.post-btn {

    background:
        linear-gradient(
            90deg,
            #3b4cb8,
            #4f32c2
        );

    color: white;

    border: none;

    border-radius: 8px;

    padding: 10px 22px;

    font-weight: 600;

    font-size: 14px;

    transition: .2s;
}

.post-btn:hover {

    transform: translateY(-1px);

    color: white;

    box-shadow:
        0 5px 15px rgba(59,76,184,.25);
}


/* ================= FOOTER ================= */

.footer {

    background:
        linear-gradient(
            90deg,
            #3b4cb8,
            #4f32c2,
            #5a2eb8
        );

    color: white;

    text-align: center;

    padding: 18px 0;

    margin-top: 20px;
}

.footer p {
    margin-bottom: 3px;
    font-size: 13px;
}


/* ================= MOBILE ================= */

@media (max-width: 768px) {

    .main-section {
        padding: 15px 10px;
    }

    .form-card {
        padding: 20px 18px;
    }

    .navbar-brand {
        font-size: 17px;
    }

    .nav-link {
        margin-left: 0;
    }
}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

```
<div class="container-fluid px-4">

    <a class="navbar-brand"
       href="recruiterDashboard.jsp">

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </a>


    <button class="navbar-toggler bg-light"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav">

        <span class="navbar-toggler-icon"></span>

    </button>


    <div class="collapse navbar-collapse"
         id="navbarNav">

        <ul class="navbar-nav ms-auto">

            <!-- Dashboard -->

            <li class="nav-item">

                <a class="nav-link"
                   href="recruiterDashboard.jsp">

                    <i class="fa-solid fa-house"></i>

                    Dashboard

                </a>

            </li>


            <!-- Post Job -->

            <li class="nav-item">

                <a class="nav-link active"
                   href="posts.jsp">

                    <i class="fa-solid fa-plus"></i>

                    Post Job

                </a>

            </li>


            <!-- Manage Jobs -->

            <li class="nav-item">

                <a class="nav-link"
                   href="ManageJobsServlet">

                    <i class="fa-solid fa-briefcase"></i>

                    Manage Jobs

                </a>

            </li>


            <!-- Applications -->

            <li class="nav-item">

                <a class="nav-link"
                   href="viewApplicationsRecruiter.jsp">

                    <i class="fa-solid fa-users"></i>

                    Applications

                </a>

            </li>


            <!-- Logout -->

            <li class="nav-item ms-3">

                <a class="btn btn-light"
                   href="index.jsp">

                    <i class="fa-solid fa-right-from-bracket"></i>

                    Logout

                </a>

            </li>

        </ul>

    </div>

</div>
```

</nav>

<!-- ================= MAIN ================= -->

<section class="main-section">

<div class="container-fluid">

<div class="form-card">

```
<!-- TITLE -->

<h2 class="page-title">

    <i class="fa-solid fa-briefcase"></i>

    Post New Job

</h2>


<!-- FORM -->

<form action="PostJobServlet"
      method="post"
      onsubmit="return validateForm()">


    <!-- ================= JOB TITLE ================= -->

    <div class="mb-3">

        <label class="form-label">
            Job Title
        </label>

        <input type="text"
               class="form-control"
               name="title"
               placeholder="Example: Data Analyst"
               required>

    </div>


    <!-- ================= COMPANY ================= -->

    <div class="mb-3">

        <label class="form-label">
            Company Name
        </label>

        <input type="text"
               class="form-control"
               name="company"
               value="<%= companyName %>"
               readonly>

    </div>


    <!-- ================= ROLE TYPE ================= -->

    <div class="mb-3">

        <label class="form-label">
            Role Type
        </label>

        <select class="form-select"
                name="roleType"
                id="roleType"
                onchange="handleRoleType()"
                required>

            <option value="">
                Select Role Type
            </option>

            <option value="Internship">
                Internship
            </option>

            <option value="Full Time">
                Full Time
            </option>

        </select>

    </div>


    <!-- ================= JOB ROLE ================= -->

    <div class="mb-3">

        <label class="form-label">
            Enter Your Role
        </label>

        <select class="form-select"
                id="jobRole"
                onchange="setJobTitle()">

            <option value="">
                Select Job Role
            </option>

            <option value="Data Analyst">
                Data Analyst
            </option>

            <option value="Java Developer">
                Java Developer
            </option>

            <option value="Software Developer">
                Software Developer
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

            <option value="Data Scientist">
                Data Scientist
            </option>

            <option value="UI/UX Designer">
                UI/UX Designer
            </option>

            <option value="Other">
                Other
            </option>

        </select>

    </div>


    <!-- ================= REQUIREMENTS ================= -->

    <div class="mb-3">

        <label class="form-label">
            Requirements
        </label>

        <textarea class="form-control"
                  name="requirements"
                  rows="3"
                  placeholder="Example: Graduate with good communication skills"
                  required></textarea>

    </div>


    <!-- ================= TECHNICAL SKILLS ================= -->

    <div class="mb-3">

        <label class="form-label">
            Technical Skills
        </label>

        <textarea class="form-control"
                  name="technicalSkills"
                  rows="3"
                  placeholder="Example: Java, SQL, HTML, CSS"
                  required></textarea>

    </div>


    <!-- ================= DURATION + SALARY ================= -->

    <div class="row">

        <!-- DURATION -->

        <div class="col-md-6 mb-3">

            <label class="form-label">
                Duration (Months)
            </label>

            <input type="number"
                   class="form-control"
                   name="duration"
                   id="duration"
                   min="1"
                   placeholder="Example: 6">

            <div class="duration-help"
                 id="durationHelp">

                Select Internship to enter duration.

            </div>

        </div>


        <!-- SALARY -->

        <div class="col-md-6 mb-3">

            <label class="form-label">
                Salary / Stipend
            </label>

            <input type="text"
                   class="form-control"
                   name="salary"
                   placeholder="Example: ₹25,000/month"
                   required>

        </div>

    </div>


    <!-- ================= DEADLINE ================= -->

    <div class="mb-4">

        <label class="form-label">
            Application Deadline
        </label>

        <input type="date"
               class="form-control"
               name="deadline"
               required>

    </div>


    <!-- ================= BUTTON ================= -->

    <div class="text-start">

        <button type="submit"
                class="post-btn">

            <i class="fa-solid fa-paper-plane"></i>

            Post Job

        </button>

    </div>


</form>
```

</div>

</div>

</section>

<!-- ================= FOOTER ================= -->

<footer class="footer">

```
<div class="container">

    <h6>

        <i class="fa-solid fa-graduation-cap"></i>

        Campus Placement Portal

    </h6>

    <p>
        Empowering recruiters to hire talented students.
    </p>

    <p>
        © 2026 Campus Placement Portal
    </p>

</div>
```

</footer>

<!-- ================= JAVASCRIPT ================= -->

<script>

/*
 * When Internship is selected:
 * Duration becomes required.
 *
 * When Full Time is selected:
 * Duration becomes optional.
 */
function handleRoleType() {

    const roleType =
        document.getElementById("roleType").value;

    const duration =
        document.getElementById("duration");

    const durationHelp =
        document.getElementById("durationHelp");


    if (roleType === "Internship") {

        duration.required = true;

        duration.placeholder =
            "Example: 6";

        durationHelp.innerHTML =
            "Enter internship duration in months.";

    }

    else if (roleType === "Full Time") {

        duration.required = false;

        duration.value = "";

        duration.placeholder =
            "Not required for full-time";

        durationHelp.innerHTML =
            "Duration is not required for full-time jobs.";

    }

    else {

        duration.required = false;

        duration.placeholder =
            "Example: 6";

        durationHelp.innerHTML =
            "Select Internship to enter duration.";
    }
}


/*
 * Selecting a job role automatically fills
 * the Job Title field.
 */
function setJobTitle() {

    const jobRole =
        document.getElementById("jobRole").value;

    const title =
        document.querySelector(
            'input[name="title"]'
        );

    if (jobRole !== "" &&
        jobRole !== "Other") {

        title.value = jobRole;

    }
}


/*
 * Final validation before submitting.
 */
function validateForm() {

    const roleType =
        document.getElementById("roleType").value;

    const duration =
        document.getElementById("duration").value;


    // Internship must have duration

    if (roleType === "Internship" &&
        duration.trim() === "") {

        alert(
            "Please enter the internship duration in months."
        );

        return false;
    }


    // Duration cannot be zero

    if (duration.trim() !== "" &&
        parseInt(duration) < 1) {

        alert(
            "Duration must be at least 1 month."
        );

        return false;
    }


    return true;
}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
