<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - E-Channeling System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 130vh;
        }
        .signup-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .signup-btn {
            background-color: #007bff;
            border-color: #007bff;
        }
        .signup-btn:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="signup-container">
                <h2 class="text-center">Sign Up</h2>

                <!-- Sign Up Form -->
                <form action="addPatient" method="post" onsubmit="return validatePassword();">
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Fullname</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="Address" name="Address" placeholder="Enter your Address" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="text" class="form-control" id="age" name="age" placeholder="Enter your Age" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="Gender" class="form-label">Gender</label>
                        <input type="text" class="form-control" id="Gender" name="Gender" placeholder="Enter your Gender" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label">Mobile number</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your Mobile number" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="confirm-password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirmPassword" placeholder="Confirm your password" required>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button action="addPatient"type="submit" class="btn signup-btn btn-block">Sign Up</button>
                    </div>
                </form>

                <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
                
                <script>
                    function validatePassword() {
                        var password = document.getElementById("password").value;
                        var confirmPassword = document.getElementById("confirm-password").value;

                        if (password !== confirmPassword) {
                            alert("Passwords do not match. Please try again.");
                            return false;
                        }
                        return true;
                    }
                </script>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
