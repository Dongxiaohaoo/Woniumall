package com.woniu.mall.exception;

public class UsernameAlreadyExistException extends MyServiceException{
    public UsernameAlreadyExistException() {
        super();
    }

    public UsernameAlreadyExistException(String message) {
        super(message);
    }

    public UsernameAlreadyExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public UsernameAlreadyExistException(Throwable cause) {
        super(cause);
    }
}
