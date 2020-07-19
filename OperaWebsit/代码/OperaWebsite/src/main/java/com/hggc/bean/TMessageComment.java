package com.hggc.bean;

public class TMessageComment {
    private int id;
    private String content;
    private String commentTime;
    private int messageId;
    private int userId;

    public int getId() {
        return id;
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

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "TMessageComment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", commentTime='" + commentTime + '\'' +
                ", messageId=" + messageId +
                ", userId=" + userId +
                '}';
    }
}
