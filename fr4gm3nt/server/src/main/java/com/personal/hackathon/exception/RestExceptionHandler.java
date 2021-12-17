package com.personal.hackathon.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler
    public ResponseEntity<?> handleMethodArgumentNotValid(MethodArgumentNotValidException e) {
        Map<String, String> failureMessageMap = new HashMap<>();
        e.getBindingResult().getAllErrors()
                .forEach(error -> {
                    String fieldName = ((FieldError) error).getField();
                    String errorMessage = error.getDefaultMessage();
                    failureMessageMap.put(fieldName, errorMessage);
                });
        return new ResponseEntity<>(failureMessageMap, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<?> handleBadRequest(BadRequest e){
        Map<String, String> failureMessageMap = new HashMap<>();
        failureMessageMap.put("error", e.getMessage());
        return new ResponseEntity<>(failureMessageMap, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<?> handleDataNotFound(DataNotFound e){
        return new ResponseEntity<>(
                Map.of("error", e.getMessage()),
                HttpStatus.NOT_FOUND
        );
    }

    @ExceptionHandler
    public ResponseEntity<?> handleForbidden(Forbidden e){
        return new ResponseEntity<>(
                Map.of("error", e.getMessage()),
                HttpStatus.FORBIDDEN
        );
    }

    @ExceptionHandler
    public ResponseEntity<?> handleAppException(AppException e){
        return new ResponseEntity<>(
                Map.of("error", e.getMessage()),
                HttpStatus.INTERNAL_SERVER_ERROR
        );
    }
}
