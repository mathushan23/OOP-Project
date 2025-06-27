<%@ page import="java.util.List" %>
<%@ page import="model.Doctor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<style>        #add-doctor-btn {
            background-color: #16a085;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }

        #add-doctor-btn:hover {
            background-color: #1abc9c;
        }</style>
    <div class="container">
        <h1 class="mt-4">Doctor List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Specialization</th>
                    <th>Hospital</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Doctor> doctorList =(List<Doctor>) request.getAttribute("doctorList");

                    if (doctorList != null) {
                        for (int i = 0; i < doctorList.size(); i++) {
                            Doctor doctor = doctorList.get(i);
                %>
                            <tr>
                                <td><%= doctor.getID() %></td>
                                <td><%= doctor.getName() %></td>
                                <td><%= doctor.getSpecialization() %></td>
                                <td><%= doctor.getHospital() %></td>
                                
                         
                          </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4">No doctors available</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <form action="findDoctor" method="get" class="form-inline mb-4">
    <div class="form-group">
        <label for="doctorId" class="sr-only">Enter Doctor ID</label>
        <input type="number" name="id" id="doctorId" class="form-control" placeholder="Enter Doctor ID" required>
    </div>
    <button type="submit" class="btn btn-primary ml-2">Edit Profile</button>
    <a href="deleteDoctor?id=${doctor.ID}" class="btn btn-danger" 
   onclick="return confirm('Are you sure you want to delete this doctor?');">Delete</a>

</form>
    
    
</body>
</html>
