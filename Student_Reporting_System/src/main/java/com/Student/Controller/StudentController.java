package com.Student.Controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


import com.Student.Model.Student;
import com.Student.Service.StudentService;

@org.springframework.web.bind.annotation.RestController
public class StudentController {
	
	@Autowired
    private StudentService service;

    @PostMapping(value = "/addStudentByName", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addStudent(@RequestBody String studentName) throws IOException{

        System.out.println("Student name : " + studentName);

        String response = service.addStudent(studentName);
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/findStudent")
    public ResponseEntity<Object> getStudentById(@RequestParam("Id") String Id) throws IOException{
    	
        Student student = service.getStudent(Id);
        return new ResponseEntity<>(student, HttpStatus.OK);
    }

    @GetMapping(value = "/getAll")
    public ResponseEntity<Object> getAllStudent() throws IOException{
    	
        List<Student> students = service.getAllStudents();
        return new ResponseEntity<>(students, HttpStatus.OK);
    }

    @PostMapping(path = "/addMarks")
    public ResponseEntity<Object> addMarks(@RequestParam("Id")String Id,
                                           @RequestParam("sem")int sem,
                                           @RequestParam("subject")String subject,
                                           @RequestParam("marks")int marks) throws Exception {

        System.out.println(Id + " -" + subject);

        String response = service.addMarks(Id,sem,subject,marks);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @DeleteMapping(path = "/delete")
    public ResponseEntity<Object> deleteById(@RequestParam("Id") String Id) throws Exception{

        String response = service.deleteStudent(Id);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
