<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String companyName = (String) session.getAttribute("companyName");

if (companyName == null) {
response.sendRedirect("recruiter_login.jsp");
return;
}

Integer id = (Integer) request.getAttribute("id");
String title = (String) request.getAttribute("title");
String roleType = (String) request.getAttribute("roleType");
String requirements = (String) request.getAttribute("requirements");
String technicalSkills = (String) request.getAttribute("technicalSkills");
Integer duration = (Integer) request.getAttribute("duration");
String salary = (String) request.getAttribute("salary");
java.sql.Date deadline =
(java.sql.Date) request.getAttribute("deadline");

/*

* If duration is NULL in database,
* show an empty field instead of 0.
  */
  String durationValue = "";

if (duration != null) {
durationValue = String.valueOf(duration);
}

String deadlineValue = "";

if (deadline != null) {
deadlineValue = deadline.toString();
}
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
   content="width=device-width, initial-scale=1">

<title>Edit Job | Campus Placement Portal</title>

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

/* NAVBAR */

.navbar,
.footer {
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
    margin-left: 18px;
    font-weight: 500;
}

.nav-link:hover {
    color: #e0e4ff !important;
}

/* MAIN */

.main-section {
    padding: 30px 0;
    min-height: calc(100vh - 150px);
}

.form-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 10px 25px rgba(0,0,0,.10);
}

.page-title {
    color: #3b4cb8;
    font-weight: 700;
}

.form-label {
    font-weight: 600;
    margin-bottom: 7px;
}

.form-control,
.form-select {
    border-radius: 8px;
    padding: 10px 12px;
    border: 1px solid #d9dce8;
}

.form-control:focus,
.form-select:focus {
    border-color: #3b4cb8;
    box-shadow: 0 0 0 0.15rem rgba(59,76,184,.15);
}

/* DURATION HELP TEXT */

.duration-help {
    font-size: 12px;
    color: #777;
    margin-top: 5px;
}

/* BUTTONS */

.update-btn {
    background: #3b4cb8;
    color: white;
    font-weight: 600;
    border: none;
}

.update-btn:hover {
    background: #2f3da0;
    color: white;
}

.cancel-btn {
    font-weight: 600;
}

/* FOOTER */

.footer {
    color: white;
    padding: 20px 0;
    text-align: center;
}

.footer p {
    margin-bottom: 4px;
}

/* MOBILE */

@media (max-width: 768px) {

    .main-section {
        padding: 20px 10px;
    }

    .form-card {
        padding: 22px;
    }

    .navbar-brand {
        font-size: 17px;
    }

    .nav-link {
        margin-left: 0;
        padding: 8px 0;
    }
}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

```
<div class="container-fluid px-4">

    <a class="navbar-brand fw-bold"
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

                <a class="nav-link"
                   href="posts.jsp">

                    <i class="fa-solid fa-plus"></i>
                    Post Job

                </a>

            </li>

            <!-- Manage Jobs -->

            <li class="nav-item">

                <a class="nav-link active"
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

<div class="container">

```
<div class="row justify-content-center">

    <div class="col-lg-8 col-md-10">

        <div class="form-card">

            <h2 class="text-center page-title mb-4">

                <i class="fa-solid fa-pen-to-square"></i>

                Edit Job

            </h2>


            <form action="EditJobServlet"
                  method="post">

                <!-- JOB ID -->

                <input type="hidden"
                       name="id"
                       value="<%= id %>">


                <!-- JOB TITLE -->

                <div class="mb-3">

                    <label class="form-label">
                        Job Title
                    </label>

                    <input type="text"
                           class="form-control"
                           name="title"
                           value="<%= title != null ? title : "" %>"
                           required>

                </div>


                <!-- COMPANY -->

                <div class="mb-3">

                    <label class="form-label">
                        Company Name
                    </label>

                    <input type="text"
                           class="form-control"
                           value="<%= companyName %>"
                           readonly>

                </div>


                <!-- ROLE TYPE -->

                <div class="mb-3">

                    <label class="form-label">
                        Job Role
                    </label>

                    <select class="form-select"
                            name="roleType"
                            required>

                        <option value="">
                            Select Role
                        </option>

                        <option value="Software Developer"
                            <%= "Software Developer".equals(roleType) ? "selected" : "" %>>
                            Software Developer
                        </option>

                        <option value="Java Developer"
                            <%= "Java Developer".equals(roleType) ? "selected" : "" %>>
                            Java Developer
                        </option>

                        <option value="Python Developer"
                            <%= "Python Developer".equals(roleType) ? "selected" : "" %>>
                            Python Developer
                        </option>

                        <option value="Web Developer"
                            <%= "Web Developer".equals(roleType) ? "selected" : "" %>>
                            Web Developer
                        </option>

                        <option value="Full Stack Developer"
                            <%= "Full Stack Developer".equals(roleType) ? "selected" : "" %>>
                            Full Stack Developer
                        </option>

                        <option value="Data Analyst"
                            <%= "Data Analyst".equals(roleType) ? "selected" : "" %>>
                            Data Analyst
                        </option>

                        <option value="Data Scientist"
                            <%= "Data Scientist".equals(roleType) ? "selected" : "" %>>
                            Data Scientist
                        </option>

                        <option value="UI/UX Designer"
                            <%= "UI/UX Designer".equals(roleType) ? "selected" : "" %>>
                            UI/UX Designer
                        </option>

                        <option value="Other"
                            <%= "Other".equals(roleType) ? "selected" : "" %>>
                            Other
                        </option>

                    </select>

                </div>


                <!-- REQUIREMENTS -->

                <div class="mb-3">

                    <label class="form-label">
                        Requirements
                    </label>

                    <textarea
                        class="form-control"
                        name="requirements"
                        rows="3"
                        required><%= requirements != null ? requirements : "" %></textarea>

                </div>


                <!-- TECHNICAL SKILLS -->

                <div class="mb-3">

                    <label class="form-label">
                        Technical Skills
                    </label>

                    <textarea
                        class="form-control"
                        name="technicalSkills"
                        rows="3"
                        required><%= technicalSkills != null ? technicalSkills : "" %></textarea>

                </div>


                <!-- DURATION + SALARY -->

                <div class="row">

                    <!-- DURATION -->

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Duration (Months)
                        </label>

                        <input type="number"
                               class="form-control"
                               name="duration"
                               value="<%= durationValue %>"
                               min="1">

                        <div class="duration-help">
                            Leave blank for full-time jobs.
                            Enter months for internships.
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
                               value="<%= salary != null ? salary : "" %>"
                               required>

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
                           value="<%= deadlineValue %>"
                           required>

                </div>


                <!-- BUTTONS -->

                <div class="d-flex gap-2">

                    <button type="submit"
                            class="btn update-btn flex-grow-1">

                        <i class="fa-solid fa-check"></i>

                        Update Job

                    </button>

                    <a href="ManageJobsServlet"
                       class="btn btn-secondary cancel-btn">

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</div>
```

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
        Empowering recruiters to hire talented students.
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
