<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Doctor</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Edit Doctor Details</h2>
        <form action="updateDoctor" method="post">
            <input type="hidden" name="id" value="${doctor.ID}"> <!-- Hidden ID field -->
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="${doctor.name}" required>
            </div>
            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" class="form-control" value="${doctor.age}" required>
            </div>
            <div class="form-group">
                <label>Qualification</label>
                <input type="text" name="qualification" class="form-control" value="${doctor.qualification}" required>
            </div>
            <div class="form-group">
                <label>Specialization</label>
                <input type="text" name="specialization" class="form-control" value="${doctor.specialization}" required>
            </div>
            <div class="form-group">
                <label>Hospital</label>
                <input type="text" name="hospital" class="form-control" value="${doctor.hospital}" required>
            </div>
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="language">Language:</label>
            <input type="text" id="language" name="language" required>
            
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</body>
</html>
