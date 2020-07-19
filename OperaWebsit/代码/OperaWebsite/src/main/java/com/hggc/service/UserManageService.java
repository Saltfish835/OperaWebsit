package com.hggc.service;

import com.hggc.bean.*;

import java.util.HashMap;
import java.util.List;

public interface UserManageService {

    public List<User> userLogin(User user);

    public boolean userRegister(User user);

    public List<User> findUserByEmail(String email);

    public void updateUser(User user);

    public User getUserById(int id);

    public HashMap<Integer,List<Opera>> getMainPageData();

    public List<User> getAllUser();

    public List<Opera> getHotOpera();

    public List<Notice> getAllNotice();

    public List<TMessage> getAllTMeaasge();

    public void saveTMessage(TMessage tMessage);

    public void saveCollection(Collection collection);

    public void operaCollectionNumberPP(int operaId);

    public List<Collection> getCollectionByUserIdAndLimit(int userId,int start,int number);

    public List<Collection> getCollectionByUserId(int userId);

}
