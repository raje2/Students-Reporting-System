package com.Student.Service;

import java.util.HashMap;
import java.util.List;

import com.Student.Model.Student;

public interface StudentService {
	
	public String addStudent(String name);
	
	public String addMarks(String studentId, int semId, String subject, int marks);
	
	public Student getStudent(String studentId);
	
	public List<Student> getAllStudents();
	
	public String deleteStudent(String id);
	
	public String averagePercentage(int sem);
	
	public HashMap<String, Double> top2();

}
