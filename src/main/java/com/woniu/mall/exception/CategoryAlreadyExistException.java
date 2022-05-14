package com.woniu.mall.exception;

public class CategoryAlreadyExistException extends MyServiceException{
    public CategoryAlreadyExistException() {
        super();
    }

    public CategoryAlreadyExistException(String message) {
        super(message);
    }

    public CategoryAlreadyExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public CategoryAlreadyExistException(Throwable cause) {
        super(cause);
    }
}
