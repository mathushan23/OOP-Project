package web;

import Database.DoctorImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;

import java.io.IOException;

@WebServlet("/updateDoctor")
public class updateDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract updated doctor details from the form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String qualification = request.getParameter("qualification");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String gender = request.getParameter("gender");
        String language = request.getParameter("language");

        // Create an updated Doctor object
        Doctor updatedDoctor = new Doctor(id, name, age, qualification, specialization, hospital, gender, language);

        // Update doctor in the database
        DoctorImpl doctorImpl = new DoctorImpl();
        doctorImpl.updateDoctor(updatedDoctor);

        // Redirect back to the doctor list
        response.sendRedirect("viewDoctor");
    }
}
