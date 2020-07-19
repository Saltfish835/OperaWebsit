package com.hggc.bean;

public class TMessage {
    private int id;
    private String content;
    private String messageTime;
    private int userId;
    private User user;

    public int getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "TMessage{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", messageTime='" + messageTime + '\'' +
                ", userId=" + userId +
                '}';
    }
}
