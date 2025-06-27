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
 * Servlet implementation class AddPatientServlet
 */
@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/oopproject"; // Update with your DB
    private static final String DB_USER = "root"; // Your DB username
    private static final String DB_PASSWORD = "1234"; // Your DB password

    public AddPatientServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Collecting form data
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("Address");
        int age = Integer.parseInt(request.getParameter("age")); // Corrected from "Age" to "age"
        String gender = request.getParameter("Gender");
        String phone = request.getParameter("phone"); // Corrected from "Mobilenumber" to "phone"
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String insertSQL = "INSERT INTO patient (Fullname, Address, Age, Gender, Mobilenumber, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, address);
            preparedStatement.setInt(3, age);
            preparedStatement.setString(4, gender);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, email);
            preparedStatement.setString(7, password);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h2>Patient successfully added!</h2>");
                out.println("<p>Thank you for registering.</p>");
                response.sendRedirect("Login.jsp");
            } else {
                out.println("<h2>Error: Failed to add the patient.</h2>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h2>Error: Unable to load the JDBC driver.</h2>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error: Unable to save patient details to the database.</h2>");
        } finally {
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
    }
}
