<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Companies - Campus Placement Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  

    <style>
        /* ===== NAVBAR ===== */
        .navbar {
            background: linear-gradient(135deg, #5d73f8, #6a11CB);
        }
        .navbar-brand {
            color: white !important;
            font-weight: 600;
            display: flex;
            align-items: center;
        }
        .navbar-brand i { margin-right: 8px; }
        .navbar .nav-link { color: white !important; font-weight: 500; }
        .navbar .nav-link:hover { color: #ffd700 !important; }
        .signup-btn {
            border: 2px solid white; color: white !important;
            padding: 6px 16px; border-radius: 8px;
            font-weight: 600; background: transparent; transition: .3s;
        }
        .signup-btn:hover { background: white; color: #6a11CB !important; }

        /* ===== COMPANY CARD ===== */
        .company-card {
            border: none; border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform .2s;
        }
        .company-card:hover { transform: translateY(-5px); }
        .company-card .card-title { color: #6a11CB; font-weight: 600; }

        /* ===== FOOTER ===== */
      .footer{
            background:linear-gradient(135deg,#5d73f8,#6a11cb);
            color:#fff;
            text-align:center;
            padding:25px;
            margin-top:50px;
        }

        .footer h5{
            font-weight:bold;
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand fw-bold" href="studentDashboard.jsp">
            <i class="fa-solid fa-graduation-cap"></i>
            Campus Placement Portal
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav" aria-controls="navbarNav" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="studentDashboard.jsp">Home</a></li>
                
                
            </ul>
        </div>
    </div>
</nav>

<!-- ===== COMPANIES LIST ===== -->
<div class="container mt-5">
    <h2 class="mb-4 text-center text-primary">Registered Companies</h2>

    <!-- Dynamic Loop (later from CompaniesServlet) -->
    <c:forEach var="company" items="${companiesList}">
        <div class="card company-card mb-3">
            <div class="card-body">
                <h5 class="card-title">${company.name}</h5>
                <h6 class="card-subtitle mb-2 text-muted">${company.industry}</h6>
                <p><strong>Location:</strong> ${company.location}</p>
                <p><strong>Email:</strong> ${company.email}</p>
            </div>
        </div>
    </c:forEach>
</div>

<!-- ===== FOOTER ===== -->
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
