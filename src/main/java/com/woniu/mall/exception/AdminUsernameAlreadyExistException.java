package com.woniu.mall.exception;

public class AdminUsernameAlreadyExistException extends MyServiceException{
    public AdminUsernameAlreadyExistException() {
        super();
    }

    public AdminUsernameAlreadyExistException(String message) {
        super(message);
    }

    public AdminUsernameAlreadyExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public AdminUsernameAlreadyExistException(Throwable cause) {
        super(cause);
    }
}
