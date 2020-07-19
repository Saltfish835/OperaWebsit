package com.hggc.bean;

public class Collection {
    private int id;
    private String collectionTime;
    private int userId;
    private int operaId;
    private User user;
    private Opera opera;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Opera getOpera() {
        return opera;
    }

    public void setOpera(Opera opera) {
        this.opera = opera;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCollectionTime() {
        return collectionTime;
    }

    public void setCollectionTime(String collectionTime) {
        this.collectionTime = collectionTime;
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

    @Override
    public String toString() {
        return "Collection{" +
                "id=" + id +
                ", collectionTime='" + collectionTime + '\'' +
                ", userId=" + userId +
                ", operaId=" + operaId +
                '}';
    }
}
