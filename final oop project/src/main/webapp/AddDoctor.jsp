<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .add-doctor-form {
            display: flex;
            flex-direction: column;
        }

        .add-doctor-form label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .add-doctor-form input,
        .add-doctor-form select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .add-doctor-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px;
            transition: background-color 0.3s ease;
        }

        .add-doctor-form input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
        }
    </style>

    <script>
        function validateForm() {
            // Clear previous error messages
            var errorMessage = document.getElementById("error-message");
            errorMessage.innerHTML = "";

            var name = document.getElementById("name").value;
            var age = document.getElementById("age").value;
            var qualification = document.getElementById("qualification").value;
            var specialization = document.getElementById("specialization").value;
            var hospital = document.getElementById("hospital").value;
            var gender = document.getElementById("gender").value;
            var language = document.getElementById("language").value;

            if (name == "") {
                errorMessage.innerHTML = "Name is required.";
                return false;
            }
            if (age == "" || age < 25 || age > 80) {
                errorMessage.innerHTML = "Age should be between 25 and 80.";
                return false;
            }
            if (qualification == "") {
                errorMessage.innerHTML = "Qualification is required.";
                return false;
            }
            if (specialization == "") {
                errorMessage.innerHTML = "Specialization is required.";
                return false;
            }
            if (hospital == "") {
                errorMessage.innerHTML = "Hospital is required.";
                return false;
            }
            if (gender == "") {
                errorMessage.innerHTML = "Gender is required.";
                return false;
            }
            if (language == "") {
                errorMessage.innerHTML = "Language is required.";
                return false;
            }

            return true; // If all validation passes, allow form submission
        }
        
        
   

    </script>

</head>
<body>
    <div class="container">
        <h1>Add Doctor</h1>
        <div id="error-message" class="error-message"></div>
        <form action="addDoctor" method="post" class="add-doctor-form" onsubmit="return validateForm()">
     
            
            <label for="name">Doctor Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="25" max="80" required>

            <label for="qualification">Qualification:</label>
            <input type="text" id="qualification" name="qualification" required>

            <label for="specialization">Specialization:</label>
            <input type="text" id="specialization" name="specialization" required>

            <label for="hospital">Hospital:</label>
            <input type="text" id="hospital" name="hospital" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="language">Language:</label>
            <input type="text" id="language" name="language" required>

            <input type="submit" value="Add Doctor" id="addDoctor2">
        </form>
    </div>
</body>
</html>
    