package com.woniu.mall.exception;

public class UsernameOrPasswordErrorException extends MyServiceException{
    public UsernameOrPasswordErrorException() {
        super();
    }

    public UsernameOrPasswordErrorException(String message) {
        super(message);
    }

    public UsernameOrPasswordErrorException(String message, Throwable cause) {
        super(message, cause);
    }

    public UsernameOrPasswordErrorException(Throwable cause) {
        super(cause);
    }
}
