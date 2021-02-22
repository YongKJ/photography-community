package com.web.graduation.exception;

public class UserIdException extends MyMvcException{
    public UserIdException() {
    }

    public UserIdException(String message) {
        super(message);
    }
}
