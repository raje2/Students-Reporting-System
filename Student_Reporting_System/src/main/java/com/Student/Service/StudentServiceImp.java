package com.Student.Service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.elasticsearch.common.UUIDs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Student.Model.Semester;
import com.Student.Model.Student;
import com.Student.Repository.StudentRepository;


@Service
public class StudentServiceImp implements StudentService{
	
	
	@Autowired
    private StudentRepository studentRepository;

    private final String indexName = "student-index";

    
    //here we add student
	@Override
	public String addStudent(String name) {
		
		//here we generate random string id
		String Id = UUIDs.randomBase64UUID();

        Semester first = new Semester(1);
        Semester second = new Semester(2);
        List<Semester> semList= new ArrayList<>();
        semList.add(first);
        semList.add(second);


        Student student = new Student(Id, name, semList);

        System.out.println("Student Count : " + Id);
        System.out.println("Student semesters : " + student.getSemesters());

        try {
            studentRepository.save(student);
        } catch (Exception e) {
            return e.toString();
        }

        return "Successfully added student!";

		
	}

	
	//here we add marks
	@Override
	public String addMarks(String studentId, int semId, String subject, int marks) {
		
		try {

			
            Optional<Student> students = studentRepository.findById(studentId);

            if (students.isEmpty()) {
                return "Marks add unsuccessfull, no student with StudentId : " + semId;
            }


            Student student = students.get();
            List<Semester> semestersList = student.getSemesters();

            for (Semester sem : semestersList) {

                System.out.println(sem.getSemId());
                System.out.println(semId);
                System.out.println(sem.getSemId() == semId);
                System.out.println((subject.equals("Maths")));

                if (sem.getSemId() == semId) {
                    if (subject.equals("English")) {
                        sem.setEnglish(marks);
                    } else if (subject.equals("Maths")) {
                        sem.setMaths(marks);
                    } else if (subject.equals("Science")) {
                        sem.setScience(marks);
                    } else {
                        return "error in subject name";
                    }

                    break;
                }
            }

            student.setSemesters(semestersList);
            studentRepository.save(student);

        }catch (Exception e){
            System.out.println(e.toString());
        }

        return "marks add success!";
		
	}

	
	//here we get Student by student id
	@Override
	public Student getStudent(String studentId) {
		
		try {
            Optional<Student> students = studentRepository.findById(studentId);

            if (students.isEmpty()) {
                throw new Exception("getStudent() failed!");
            }

            Student student = students.get();
            return student;

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return null;
		
	}

	
	//here we get all student list
	@Override
	public List<Student> getAllStudents() {
		
	try { 
		
        Iterable<Student> students = studentRepository.findAll();
        List<Student> studentList = new ArrayList<>();
        for (Student s : students) {
            studentList.add(s);
        }
        
        return studentList;
        
	    } catch (Exception e) {
	    	
	        System.out.println("erro : " + e.toString());
	    }
	
      return new ArrayList<Student>();
		
	}

	
	//here we delete student by student id
	@Override
	public String deleteStudent(String id) {
		
		try {
			
            studentRepository.deleteById(id);
            
        }catch (Exception e){
        	
            return  (e.toString());
        }

        return "Successfully deleted student with Id : " + id;
		
	}

	
	//here we get avg marks of student
	@Override
	public String averagePercentage(int sem) {
		
		Double average = 0.0;

        try {
        	
            List<Double> percentageList = new ArrayList<>();
            Iterable<Student> studentList = studentRepository.findAll();
            for(Student s : studentList)
            {
                Semester semester = s.getSemesters().get(sem-1);
                Double sum = Double.valueOf((semester.getEnglish() + semester.getMaths() + semester.getScience()));
                Double percentage = sum/3;
                percentageList.add(percentage);
            }

            for(Double d : percentageList)
            {
                average += d;
            }

            average = average/percentageList.size();
            System.out.println("average : " + average);

        }catch (Exception e)
        {
            System.out.println(e.toString());
        }

        DecimalFormat df = new DecimalFormat("####0.00");

        return df.format(average);

	}

	
	//here we get top 2 students
	@Override
	public HashMap<String, Double> top2() {
		
		HashMap<String, Double> map = new HashMap<String, Double>();

        try {
            Iterable<Student> studentList = studentRepository.findAll();
            for(Student s : studentList)
            {
                Semester semester1 = s.getSemesters().get(0);
                Semester semester2 = s.getSemesters().get(1);
                Double sum = Double.valueOf((semester1.getEnglish() + semester1.getMaths() + semester1.getScience()+
                        semester2.getEnglish() + semester2.getMaths() + semester2.getScience()));
                Double max = sum/2;
                map.put(s.getId(), max);
            }

        }catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return map;
		
	}

}
