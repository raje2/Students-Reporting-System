package com.Student.Model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Semester {
	
	private int semId;
    private int English = 0;
    private int Maths = 0;
    private int Science = 0;
    
    

    public Semester() {
    	
    }

    public Semester(int semId){
        this.semId = semId;
    }
    
    public Semester(int semId, int english, int maths, int science) {
        this.semId = semId;
        this.English = english;
        this.Maths = maths;
        this.Science = science;
    }

}
