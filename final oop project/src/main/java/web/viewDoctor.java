package web;

import Database.DoctorImpl;
import model.Doctor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewDoctor")
public class viewDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorImpl doctorImpl = new DoctorImpl();
        List<Doctor> doctors = doctorImpl.getAllDoctors();
        request.setAttribute("doctorList", doctors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewDoctor.jsp");
        dispatcher.forward(request, response);
    }
}
