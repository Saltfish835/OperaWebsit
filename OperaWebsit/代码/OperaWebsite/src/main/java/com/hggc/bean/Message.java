package com.hggc.bean;

public class Message {
    private String message;
    private String state;
    private Integer number;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Message{" +
                "message='" + message + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
