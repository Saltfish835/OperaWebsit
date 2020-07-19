package com.hggc.bean;

public class Opera {
    private int id;
    private String operaName;
    private String introduce;
    private String publicationTime;
    private int watchNumber;
    private int collectionNumber;
    private String operaStatus;
    private String fileName;
    private int typeId;
    private int userId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOperaName() {
        return operaName;
    }

    public void setOperaName(String operaName) {
        this.operaName = operaName;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPublicationTime() {
        return publicationTime;
    }

    public void setPublicationTime(String publicationTime) {
        this.publicationTime = publicationTime;
    }

    public int getWatchNumber() {
        return watchNumber;
    }

    public void setWatchNumber(int watchNumber) {
        this.watchNumber = watchNumber;
    }

    public int getCollectionNumber() {
        return collectionNumber;
    }

    public void setCollectionNumber(int collectionNumber) {
        this.collectionNumber = collectionNumber;
    }

    public String getOperaStatus() {
        return operaStatus;
    }

    public void setOperaStatus(String operaStatus) {
        this.operaStatus = operaStatus;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String typeNamem() {
        switch (this.typeId){
            case 1:
                return "京剧";
            case 2:
                return "越剧";
            case 3:
                return "川剧";
            case 4:
                return "秦腔";
            case 5:
                return "昆曲";
            case 6:
                return "黄梅戏";
            case 7:
                return "二人转";
            case 8:
                return "皮影戏";
                default:
                    return "不明类型";

        }
    }

    @Override
    public String toString() {
        return "Opera{" +
                "id=" + id +
                ", operaName='" + operaName + '\'' +
                ", introduce='" + introduce + '\'' +
                ", publicationTime='" + publicationTime + '\'' +
                ", watchNumber=" + watchNumber +
                ", collectionNumber=" + collectionNumber +
                ", operaStatus='" + operaStatus + '\'' +
                ", fileName='" + fileName + '\'' +
                ", typeId=" + typeId +
                ", userId=" + userId +
                '}';
    }
}
