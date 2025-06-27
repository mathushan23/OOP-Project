package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;
import Impl.DoctorInterface;
import Database.Dbconnection;
import Database.DoctorImpl;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class addDoctor
 */
@WebServlet("/addDoctor")
@MultipartConfig(maxFileSize = 16177215)
public class addDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addDoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve form data from request
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String qualification = request.getParameter("qualification");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String gender = request.getParameter("gender");
        String language = request.getParameter("language");

        // Create and populate Doctor object
        Doctor doctor = new Doctor();
        doctor.setName(name);
        doctor.setAge(age);
        doctor.setQualification(qualification);
        doctor.setSpecialization(specialization);
        doctor.setHospital(hospital);
        doctor.setGender(gender);
        doctor.setLanguage(language);

        // Option 1: Use PreparedStatement for direct insertion
        try (Connection connection = Dbconnection.getDbConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO doctors (name, age, qualification, specialization, hospital, gender, language) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, doctor.getName());
            preparedStatement.setInt(2, doctor.getAge());
            preparedStatement.setString(3, doctor.getQualification());
            preparedStatement.setString(4, doctor.getSpecialization());
            preparedStatement.setString(5, doctor.getHospital());
            preparedStatement.setString(6, doctor.getGender());
            preparedStatement.setString(7, doctor.getLanguage());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error during database insertion: " + e.getMessage());
            request.setAttribute("error", "An error occurred while adding the doctor.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return; // Prevent further execution if there's an error
        }

        // Option 2: Use the DoctorImpl class (if it handles database interaction)
        DoctorImpl doctorImpl = new DoctorImpl();
        doctorImpl.addDoctor(doctor);  // Assuming there's a method to save a doctor in DoctorImpl

        // Redirect to admin home page after successful insertion
        response.sendRedirect("adminHome.jsp");
    }
}
