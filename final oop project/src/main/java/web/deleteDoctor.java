package web;

import Database.DoctorImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteDoctor")
public class deleteDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the doctor ID from the request parameter
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);  // Parse the ID if it's valid

                // Use DoctorImpl to delete the doctor from the database
                DoctorImpl doctorImpl = new DoctorImpl();
                doctorImpl.deleteDoctor(id); // Call the method to delete the doctor by ID

                // Redirect back to the doctor list page after deletion
                response.sendRedirect("viewDoctor");
            } catch (NumberFormatException e) {
                // Log the error and redirect back with an error message (optional)
                System.out.println("Invalid doctor ID: " + idParam);
                response.sendRedirect("viewDoctor?error=invalidId");
            }
        } else {
            // Handle case where ID is missing
            System.out.println("Doctor ID is missing");
            response.sendRedirect("viewDoctor?error=missingId");
        }
    }
}
