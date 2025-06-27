package Database;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Database.Dbconnection;
import model.Doctor;

public class DoctorImpl{
	
	    private static final String INSERT_DOCTOR_SQL = "INSERT INTO doctors (name,age,qualification,specialization,hospital,gender,language) VALUES (?, ?, ?, ?, ?,?,?)";
	    private static final String SELECT_ALL_DOCTORS = "SELECT * FROM doctors";
	    private static final String UPDATE_DOCTORS = "UPDATE doctors SET name = ?, age = ?, qualification = ?, specialization = ?,hospital=?,gender=?,language=? WHERE id = ?";
	    private static final String DELETE_DOCTOR = "DELETE FROM doctors WHERE id = ?";

	    
	    public void addDoctor(Doctor doctor) {
	        try (Connection connection = Dbconnection.getDbConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DOCTOR_SQL)) {
	        	
	            preparedStatement.setInt(1, doctor.getID());
	            preparedStatement.setString(2, doctor.getName());
	            preparedStatement.setInt(3, doctor.getAge());
	            preparedStatement.setString(4, doctor.getQualification());
	            preparedStatement.setString(5, doctor.getSpecialization());
	            preparedStatement.setString(6, doctor.getHospital());
	            preparedStatement.setString(7, doctor.getGender());
	            preparedStatement.setString(8, doctor.getLanguage());

	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }

	

	    public List<Doctor> getAllDoctors() {
	        List<Doctor> doctors = new ArrayList<>();
	        try (Connection connection = Dbconnection.getDbConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DOCTORS)) {

	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	                Doctor doctor = new Doctor();
	                doctor.setID(rs.getInt("id")); // Ensure the column name matches your DB
	                doctor.setName(rs.getString("name"));
	                doctor.setAge(rs.getInt("age"));
	                doctor.setQualification(rs.getString("qualification"));
	                doctor.setSpecialization(rs.getString("specialization"));
	                doctor.setHospital(rs.getString("hospital"));
	                doctor.setGender(rs.getString("gender"));
	                doctor.setLanguage(rs.getString("language"));
	                doctors.add(doctor);	      
	                

	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return doctors;
	    }
	    
	    public Doctor getDoctorById(int id) {
	        Doctor doctor = null;
	    String query = "SELECT * FROM doctors WHERE id = ?";

	    try (Connection connection = Dbconnection.getDbConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        
	        preparedStatement.setInt(1, id);
	        ResultSet rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            doctor = new Doctor();
	            doctor.setID(rs.getInt("id"));
	            doctor.setName(rs.getString("name"));
	            doctor.setAge(rs.getInt("age"));
	            doctor.setQualification(rs.getString("qualification"));
	            doctor.setSpecialization(rs.getString("specialization"));
	            doctor.setHospital(rs.getString("hospital"));
	            doctor.setGender(rs.getString("gender"));
	            doctor.setLanguage(rs.getString("language"));
	        }
	    } catch (SQLException e) {
	        printSQLException(e);
	    }

	    return doctor;
	}

	public void updateDoctor(Doctor doctor) {
	    try (Connection connection = Dbconnection.getDbConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DOCTORS)) {
	        
	        preparedStatement.setString(1, doctor.getName());
	        preparedStatement.setInt(2, doctor.getAge());
	        preparedStatement.setString(3, doctor.getQualification());
	        preparedStatement.setString(4, doctor.getSpecialization());
	        preparedStatement.setString(5, doctor.getHospital());
	        preparedStatement.setString(6, doctor.getGender());
	        preparedStatement.setString(7, doctor.getLanguage());
	        preparedStatement.setInt(8, doctor.getID());

	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        printSQLException(e);
	    }
	}
	    
	public void deleteDoctor(int id) {

	    try (Connection connection = Dbconnection.getDbConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_DOCTOR)) {
	        
	        preparedStatement.setInt(1, id);  // Set the ID parameter for deletion
	        preparedStatement.executeUpdate();  // Execute the delete query
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	    private void printSQLException(SQLException ex) {
	        for (Throwable e : ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }


}
