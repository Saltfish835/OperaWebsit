package com.hggc.bean;

public class OperaComment {
    private int id;
    private String content;
    private String commentStatus;
    private String commentTime;
    private int userId;
    private int operaId;
    private User usre;
    private Opera opera;

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

    public String getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(String commentStatus) {
        this.commentStatus = commentStatus;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOperaId() {
        return operaId;
    }

    public void setOperaId(int operaId) {
        this.operaId = operaId;
    }

    public User getUsre() {
        return usre;
    }

    public void setUsre(User usre) {
        this.usre = usre;
    }

    public Opera getOpera() {
        return opera;
    }

    public void setOpera(Opera opera) {
        this.opera = opera;
    }

    @Override
    public String toString() {
        return "OperaComment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", commentStatus='" + commentStatus + '\'' +
                ", commentTime='" + commentTime + '\'' +
                ", userId=" + userId +
                ", operaId=" + operaId +
                ", usre=" + usre +
                ", opera=" + opera +
                '}';
    }
}
