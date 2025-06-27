package Impl;

import java.sql.SQLException;
import java.util.List;

import model.Doctor;



public interface DoctorInterface {

	
    void addDoctor(Doctor doctor);

    Doctor getDoctor(int id) throws SQLException;

    Doctor updatedoctor(int id, Doctor doctor);

    void deleteDoctor(int id);
    
    List<Doctor> getAllDoctors()throws SQLException;

}
