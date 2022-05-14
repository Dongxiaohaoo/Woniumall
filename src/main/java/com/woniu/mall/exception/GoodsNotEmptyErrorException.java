package com.woniu.mall.exception;

public class GoodsNotEmptyErrorException extends MyServiceException{
    public GoodsNotEmptyErrorException() {
        super();
    }

    public GoodsNotEmptyErrorException(String message) {
        super(message);
    }

    public GoodsNotEmptyErrorException(String message, Throwable cause) {
        super(message, cause);
    }

    public GoodsNotEmptyErrorException(Throwable cause) {
        super(cause);
    }
}
