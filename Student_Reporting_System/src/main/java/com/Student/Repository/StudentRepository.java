package com.Student.Repository;

import java.util.Optional;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import com.Student.Model.Student;

/*
 
 * ElasticsearchRestTemplate should be used in order to have more control over the queries
 * */

@Repository
public interface StudentRepository extends ElasticsearchRepository<Student, String>{


//	public Optional<Student> findById(String s1);

}
