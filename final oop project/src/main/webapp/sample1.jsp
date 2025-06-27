<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Channelling Application Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('rose.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        input[type="text"],
        input[type="tel"],
        input[type="date"],
        input[type="time"],
        input[type="number"],
        select {
            width: 90%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }
        button {
            width: 90%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.1em;
        }
        button:hover {
            background-color: #218838;
        }
        .success-message {
            display: none;
            text-align: center;
            margin-top: 30px;
            color: #28a745;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>E-Channelling Application Form</h1>
        <form id="channellingForm" method="post" action="AddAppointmentServlet1">
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required min="1" max="120">
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required pattern="^\d{10}$" title="Please enter a valid 10-digit phone number.">
            </div>
            <div class="form-group">
                <label for="date">Preferred Date:</label>
                <input type="date" id="date" name="date" required min="" onfocus="setMinDate()">
            </div>
            <div class="form-group">
                <label for="time">Preferred Time:</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div class="form-group">
                <label for="specialization">Doctor's Specialization:</label>
                <select id="specialization" name="specialization" required onchange="updateDoctors()">
                    <option value="">--Select--</option>
                    <option value="cardiology">Cardiology</option>
                    <option value="neurology">Neurology</option>
                    <option value="orthopedics">Orthopedics</option>
                </select>
            </div>
            <div class="form-group">
                <label for="doctor">Select Doctor:</label>
                <select id="doctor" name="doctor" required>
                    <option value="">--Select a specialization first--</option>
                </select>
            </div>
            <button type="submit" href="payment1.jsp">Submit Application</button>
        </form>

        <div class="success-message" id="successMessage">
            <h2>Application Submitted!</h2>
            <p>Your appointment request has been sent.</p>
        </div>
    </div>

    <script>
        const doctors = {
            cardiology: ['Dr. Smith', 'Dr. Johnson'],
            neurology: ['Dr. Lee', 'Dr. Brown'],
            orthopedics: ['Dr. Wilson', 'Dr. Taylor']
        };

        function updateDoctors() {
            const specializationSelect = document.getElementById('specialization');
            const doctorSelect = document.getElementById('doctor');
            const selectedSpecialization = specializationSelect.value;

            // Clear existing options
            doctorSelect.innerHTML = '';

            if (selectedSpecialization && doctors[selectedSpecialization]) {
                doctors[selectedSpecialization].forEach(doctor => {
                    const option = document.createElement('option');
                    option.value = doctor;
                    option.textContent = doctor;
                    doctorSelect.appendChild(option);
                });
            } else {
                doctorSelect.innerHTML = '<option value="">--Select a specialization first--</option>';
            }
        }

        function setMinDate() {
            const today = new Date();
            const minDate = today.toISOString().split('T')[0];
            document.getElementById('date').setAttribute('min', minDate);
        }

        // Set the minimum date on load
        window.onload = setMinDate;
    </script>
</body>
</html>
