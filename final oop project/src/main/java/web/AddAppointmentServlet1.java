package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class AddAppointmentServlet
 */
@WebServlet("/AddAppointmentServlet1")
public class AddAppointmentServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/oopproject"; // Update with your DB
    private static final String DB_USER = "root"; // Your DB username
    private static final String DB_PASSWORD = "1234"; // Your DB password

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAppointmentServlet1() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form parameters
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        String phone = request.getParameter("phone");
        String preferredDate = request.getParameter("date");
        String preferredTime = request.getParameter("time");
        String specialization = request.getParameter("specialization");
        String doctor = request.getParameter("doctor");

        // Database insertion logic
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the appointment details
            String insertSQL = "INSERT INTO appointments (full_name, age, phone, preferred_date, preferred_time, specialization, doctor) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertSQL);

            // Set values for the query parameters
            preparedStatement.setString(1, fullName);
            preparedStatement.setInt(2, age);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, preferredDate);
            preparedStatement.setString(5, preferredTime);
            preparedStatement.setString(6, specialization);
            preparedStatement.setString(7, doctor);

            // Execute the SQL query
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                // If insertion is successful, display a success message
                out.println("<h2>Appointment successfully added!</h2>");
                out.println("<p>Thank you for your appointment request.</p>");
                out.println("<p><a href='adminHome.jsp'>Go back to Home</a></p>"); // Replace with the actual form page
            } else {
                out.println("<h2>Error: Failed to add the appointment.</h2>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h2>Error: Unable to load the JDBC driver.</h2>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error: Unable to save appointment details to the database.</h2>");
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        response.sendRedirect("payment1.jsp");

    }
}
