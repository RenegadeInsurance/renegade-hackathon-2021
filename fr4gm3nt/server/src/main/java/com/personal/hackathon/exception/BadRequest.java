package com.personal.hackathon.exception;

public class BadRequest extends RuntimeException{

    public BadRequest(String message) {
        super(message);
    }

    public BadRequest(){
        super("Bad Request");
    }
}
