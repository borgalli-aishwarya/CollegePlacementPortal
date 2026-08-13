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

.main-section {
    padding: 50px 0;
    min-height: 75vh;
}

.form-card {
    background: white;
    border-radius: 15px;
    padding: 40px;
    box-shadow: 0 10px 25px rgba(0,0,0,.10);
}

.page-title {
    color: #3b4cb8;
    font-weight: 700;
}

.form-label {
    font-weight: 600;
}

.form-control,
.form-select {
    border-radius: 8px;
    padding: 11px;
}

.update-btn {
    background: #3b4cb8;
    color: white;
    font-weight: 600;
}

.update-btn:hover {
    background: #2f3da0;
    color: white;
}

.cancel-btn {
    font-weight: 600;
}

.footer {
    color: white;
    padding: 25px 0;
    text-align: center;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

    <div class="container-fluid">

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

                <li class="nav-item">

                    <a class="nav-link"
                       href="recruiterDashboard.jsp">

                        <i class="fa-solid fa-house"></i>
                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="ManageJobsServlet">

                        <i class="fa-solid fa-briefcase"></i>
                        Manage Jobs

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="posts.jsp">

                        <i class="fa-solid fa-plus"></i>
                        Post Job

                    </a>

                </li>

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

</nav>


<!-- MAIN -->

<section class="main-section">

<div class="container">

    <div class="row justify-content-center">

        <div class="col-lg-8">

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
                               value="<%= title %>"
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
                            Role Type
                        </label>

                        <select class="form-select"
                                name="roleType"
                                required>

                            <option value="Internship"
                                <%= "Internship".equals(roleType)
                                    ? "selected" : "" %>>
                                Internship
                            </option>

                            <option value="Job"
                                <%= "Job".equals(roleType)
                                    ? "selected" : "" %>>
                                Job
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
                            rows="4"
                            required><%= requirements %></textarea>

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
                            required><%= technicalSkills %></textarea>

                    </div>


                    <div class="row">

                        <!-- DURATION -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Duration (Months)
                            </label>

                            <input type="number"
                                   class="form-control"
                                   name="duration"
                                   value="<%= duration %>"
                                   min="1"
                                   required>

                        </div>


                        <!-- SALARY -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Salary / Stipend
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="salary"
                                   value="<%= salary %>"
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
                               value="<%= deadline %>"
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