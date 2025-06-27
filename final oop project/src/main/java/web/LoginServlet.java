package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final String jdbcURL = "jdbc:mysql://localhost:3306/oopproject";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "1234";

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        User user = validateUser(email, password);

        if (user != null) {
            if ("neemo123@gmail.com".equals(email)) {
                response.sendRedirect("adminHome.jsp");
            } else {
                response.sendRedirect("Patienthome.jsp");
            }
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Email or Password');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
    } 

    private User validateUser(String email, String password) {
        User user = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement ps = con.prepareStatement("SELECT email, password FROM patient WHERE email = ?")) {
                 
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Assuming password is stored in a hashed format
                    if (password.equals(rs.getString("password"))) { // Replace with a proper password hashing check
                        user = new User();
                        user.setUsername(rs.getString("email"));
                        user.setRole("user"); // Set role based on your requirement
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
