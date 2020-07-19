package com.hggc.dao;

import com.hggc.bean.*;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserManageDao {


    /**
     * 用户登录方法
     * @param user
     * @return
     */
    List<User> userLogin(User user);

    void userRegister(User user);

    List<User> findUserByEmail(String email);

    void updateUser(User user);

    User getUserById(int id);

    /**
     * 得到所有的戏曲类型
     * @return
     */
    List<Type> getAllType();

    /**
     * 得到每一种类型在主页要显示的数据
     * @param type
     * @return
     */
    List<Opera> getMainPageDataByType(Type type);

    List<User> getAllUser();


    /**
     * 得到热度前五十的视频
     * @return
     */
    List<Opera> getHotOpera();

    List<Notice> getAllNotice();

    List<TMessage> getAllTMessage();

    void saveTMessage(TMessage tMessage);

    void saveCollection(Collection collection);

    void updateOperaCollectionNumber(HashMap map);

    List<Collection> getCollectionByUserIdAndLimit(HashMap map);

    List<Collection> getCollectionByUserId(int userId);
}
