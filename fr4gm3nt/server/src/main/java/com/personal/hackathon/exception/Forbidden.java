package com.personal.hackathon.exception;

public class Forbidden extends RuntimeException{

    public Forbidden(String message){
        super(message);
    }

    public Forbidden(){
        super("Forbidden");
    }
}
