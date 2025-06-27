package web;

import Database.DoctorImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;

import java.io.IOException;


/**
 * Servlet implementation class findDoctor
 */
@WebServlet("/findDoctor")
public class findDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
        int id = Integer.parseInt(request.getParameter("id"));  // Get the doctor ID from the request
        DoctorImpl doctorImpl = new DoctorImpl();
        Doctor doctor = doctorImpl.getDoctorById(id);  // Fetch doctor details by ID

        if (doctor != null) {
            // If doctor exists, forward to the updateDoctor page
            request.setAttribute("doctor", doctor);  // Pass doctor details to updateDoctor.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateDoctor.jsp");
            dispatcher.forward(request, response);
        } else {
            // If doctor with the given ID doesn't exist, show an error message
            request.setAttribute("errorMessage", "Doctor with ID " + id + " not found.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewDoctor.jsp");
            dispatcher.forward(request, response);
        
	}
        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
