package com.Student.Model;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Document(indexName = "student-index" )
@Component
public class Student {
	
	@Id
    private String id;
	
    @Field(type = FieldType.Text, name = "name")
    private String name;
    
    @Field(type = FieldType.Auto, name = "semesters")
    private List<Semester> semesters;
    
    
    public Student() {
    }

    public Student(String id, String name, List<Semester> semesters) {
        this.id = id;
        this.name = name;
        this.semesters = semesters;
    }

    public Student(String id, String name)
    {
        this.id = id;
        this.name = name;
    }

	
}
