<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Channeling</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Font (For a modern font) -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Internal CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
        }

        /* Sidebar Styles */
        #sidebar-wrapper {
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            background-color: #2c3e50;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        #sidebar-wrapper .sidebar-heading {
            padding: 1.5rem 1.25rem;
            font-size: 1.4rem;
            color: #ecf0f1;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
        }

        #sidebar-wrapper .list-group-item {
            background-color: #2c3e50;
            color: #ecf0f1;
            border: none;
            padding: 15px 20px;
            font-size: 1rem;
        }

        #sidebar-wrapper .list-group-item:hover {
            background-color: #34495e;
            color: #ffffff;
        }

        #sidebar-wrapper .list-group-item.active {
            background-color: #16a085;
            color: #ffffff;
        }

        /* Page Content */
        #page-content-wrapper {
            margin-left: 250px;
            padding: 20px;
        }

        .navbar {
            background-color: #ecf0f1;
            padding: 15px;
            border-bottom: 1px solid #dcdde1;
        }

        .navbar .nav-link {
            color: #2c3e50;
            font-weight: 500;
        }

        /* Main Dashboard Content */
        .container-fluid h1 {
            font-size: 2.5rem;
            color: #34495e;
            font-weight: bold;
        }

        .container-fluid p {
            font-size: 1.2rem;
            color: #7f8c8d;
        }

        /* Doctor Details Section */
        #doctor-details-section h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        #add-doctor-btn {
            background-color: #16a085;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }

        #add-doctor-btn:hover {
            background-color: #1abc9c;
        }

        .card-header {
            background-color: #16a085;
            color: #ffffff;
            font-weight: bold;
        }

        .card-body {
            background-color: #ecf0f1;
        }

        .card-body p {
            font-size: 1.1rem;
            color: #7f8c8d;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            #sidebar-wrapper {
                width: 100%;
                height: auto;
                position: relative;
            }

            #page-content-wrapper {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="d-flex" id="wrapper">
        <div id="sidebar-wrapper">
            <div class="sidebar-heading">E-Channeling Admin</div>
            <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action active">Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action">Manage Users</a>
                <a href="#" class="list-group-item list-group-item-action">Appointments</a>
                <a href="viewDoctor?id=${doctor.id}" class="list-group-item list-group-item-action" id="doctor-details-link">Doctors</a>
            </div>
        </div>

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <button class="btn btn-outline-secondary" id="menu-toggle">Toggle Menu</button>

                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="adminHome.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container-fluid">
                <h1 class="mt-4">Welcome to E-Channeling Admin Dashboard</h1>
                <p>Manage your e-channeling system efficiently with user management, doctor appointments, and more.</p>
            </div>

            <!-- Doctor Details Section -->
            <div class="container-fluid" id="doctor-details-section" style="display:none;">
                <h2 class="mt-4">Manage Doctor Details</h2>
                
                
                
             
    <button class="btn" id="add-doctor-btn">Add New Doctor</button>
   
                <form action="viewDoctor" method="post" style="display:inline;">
                                   
                <a href="viewDoctor?id=${doctor.id}">View Doctor</a>
                </form>

            
    </div>
</div>
                

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Internal JavaScript -->
    <script>
        // Toggle the sidebar menu
        document.getElementById("menu-toggle").addEventListener("click", function(e) {
            e.preventDefault();
            document.getElementById("wrapper").classList.toggle("toggled");
        });

        // Show Doctor Details section when "Doctors" is clicked
        document.getElementById("doctor-details-link").addEventListener("click", function(e) {
            e.preventDefault();
            document.getElementById("doctor-details-section").style.display = "block";
        });

        // Add New Doctor button event
        document.getElementById("add-doctor-btn").addEventListener("click", function() {
            window.location.href = "AddDoctor.jsp";

            
        });
    </script>

</body>
</html>
    