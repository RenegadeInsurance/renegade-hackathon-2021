package com.personal.hackathon.exception;

public class DataNotFound extends RuntimeException{

    public DataNotFound(String message){
        super(message);
    }

    public DataNotFound(){
        super("Data Not Found");
    }
}
