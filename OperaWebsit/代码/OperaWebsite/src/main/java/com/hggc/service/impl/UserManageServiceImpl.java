package com.hggc.service.impl;

import com.hggc.bean.*;
import com.hggc.dao.OperaManageDao;
import com.hggc.dao.UserManageDao;
import com.hggc.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Autowired
    UserManageDao userManageDao;


    @Autowired
    OperaManageDao operaManageDao;

    @Override
    public List<User> userLogin(User user) {
        return userManageDao.userLogin(user);
    }

    @Override
    public boolean userRegister(User user){
        boolean flag = true;
        //首先判断用户填写邮箱是否已经在数据库中
        List<User> userList = this.findUserByEmail(user.getEmail());
        if(userList.size() == 0) {
            userManageDao.userRegister(user);
            flag = true;
        }else {
            flag = false;
        }
        return flag;
    }

    public List<User> findUserByEmail(String email) {
        return userManageDao.findUserByEmail(email);
    }

    @Override
    public void updateUser(User user) {
        userManageDao.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return userManageDao.getUserById(id);
    }

    @Override
    public HashMap<Integer, List<Opera>> getMainPageData() {
        HashMap<Integer,List<Opera>> mainPageData = new HashMap<>();
        //首先得到所有的戏曲类型
        List<Type> typeList = userManageDao.getAllType();
        //遍历每一种类型
        for(Type type : typeList) {
            //得到每一种类型需要在首页显示的数据
            List<Opera> operaList = userManageDao.getMainPageDataByType(type);
            mainPageData.put(type.getId(),operaList);
        }
        return mainPageData;
    }

    @Override
    public List<User> getAllUser() {
        return userManageDao.getAllUser();
    }

    @Override
    public List<Opera> getHotOpera() {
        return userManageDao.getHotOpera();
    }

    @Override
    public List<Notice> getAllNotice() {
        return userManageDao.getAllNotice();
    }

    @Override
    public List<TMessage> getAllTMeaasge() {
        return userManageDao.getAllTMessage();
    }

    @Override
    public void saveTMessage(TMessage tMessage) {
        userManageDao.saveTMessage(tMessage);
    }

    public void saveCollection(Collection collection) {
        userManageDao.saveCollection(collection);
    }

    @Override
    public void operaCollectionNumberPP(int operaId) {
        //先查出opera
        Opera opera = operaManageDao.getOperaById(operaId);
        //得到收藏数并加一
        int collectionNumber = opera.getCollectionNumber()+1;
        //跟新opera
        HashMap map = new HashMap();
        map.put("newCollectionNumber",collectionNumber);
        map.put("operaId",operaId);
        userManageDao.updateOperaCollectionNumber(map);
    }

    @Override
    public List<Collection> getCollectionByUserIdAndLimit(int userId, int start, int number) {
        //封装查询数据
        HashMap map = new HashMap();
        map.put("userId",userId);
        map.put("start",start);
        map.put("number",number);
        //先分页查出收藏
        List<Collection> collectionListTemp = userManageDao.getCollectionByUserIdAndLimit(map);
        //为collection的user、opera对象赋值
        //先得到user对象
        User user = userManageDao.getUserById(userId);
        List<Collection> collectionList = new ArrayList<>();
        for(Collection collection:collectionListTemp) {
            collection.setUser(user);
            collection.setOpera(operaManageDao.getOperaById(collection.getOperaId()));
            collectionList.add(collection);
        }
        return collectionList;
    }

    @Override
    public List<Collection> getCollectionByUserId(int userId) {
        return userManageDao.getCollectionByUserId(userId);
    }
}
