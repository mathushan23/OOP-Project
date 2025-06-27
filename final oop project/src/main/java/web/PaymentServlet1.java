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

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet1")
public class PaymentServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/oopproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data from the request
        String cardholderName = request.getParameter("cardholder-name");
        String cardNumber = request.getParameter("card-number");
        String expiryDate = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        // Database insertion logic
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the payment details
            String insertSQL = "INSERT INTO payments (cardholder_name, card_number, expiry_date, cvv) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, cardholderName);
            preparedStatement.setString(2, cardNumber);
            preparedStatement.setString(3, expiryDate);
            preparedStatement.setString(4, cvv);

            // Execute the update and check if insertion was successful
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
            	response.sendRedirect("Patienthome.jsp");
            	
            } else {
                out.println("Failed to process payment.");
            }

            // Close resources
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while processing the payment: " + e.getMessage());
        }
    }
}
