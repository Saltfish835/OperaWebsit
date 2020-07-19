package com.hggc.service.impl;

import com.hggc.bean.*;
import com.hggc.dao.OperaManageDao;
import com.hggc.service.OperaManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OperaManageServiceImpl implements OperaManageService {

    @Autowired
    private OperaManageDao operaManageDao;

    /**
     * 测试环境是否正确，没有其他作用
     * @return
     */
    @Override
    public Admin test() {
        return  operaManageDao.test();
    }

    /**
     * 得到所有的戏曲种类
     * @return
     */
    @Override
    public List<Type> getAllType() {
        return operaManageDao.getAllType();
    }

    @Override
    public void saveOpera(Opera opera) {
        operaManageDao.saveOpera(opera);
    }

    @Override
    public List<Opera> getOperaByUserId(int userId) {
        return operaManageDao.getOperaByUserId(userId);
    }

    @Override
    public Opera getOperaById(int id) {
        return operaManageDao.getOperaById(id);
    }

    @Override
    public List<Opera> getOperaByUserIdAndLimit(int userId, int start, int number) {
        HashMap map = new HashMap();
        map.put("userId",userId);
        map.put("start",start);
        map.put("number",number);
        return operaManageDao.getOperaByUserIdAndLimit(map);
    }


    /**
     * 在分页的情况下查找特定类型的戏曲
     * @param start
     * @param number
     * @param typeId
     * @return
     */
    @Override
    public List<Opera> getOperaByFenye(int start, int number, int typeId) {
        HashMap map = new HashMap();
        map.put("start",start);
        map.put("number",number);
        map.put("typeId",typeId);
        return operaManageDao.getOperaByFenye(map);
    }

    /**
     * 得到所有特定类型的戏曲
     * @param typeId
     * @param operaStatus
     * @return
     */
    @Override
    public List<Opera> getAllOperaByTypeId(int typeId, String operaStatus) {
        HashMap map = new HashMap();
        map.put("typeId",typeId);
        map.put("operaStatus",operaStatus);
        return operaManageDao.getAllOperaByTypeId(map);
    }

    /**
     * 该戏曲观看次数加一
     * @param operaId
     */
    @Override
    public void watchNumberPP(int operaId) {
        Opera opera = operaManageDao.getOperaById(operaId);
        int newWatchNumber = opera.getWatchNumber()+1;
        opera.setWatchNumber(newWatchNumber);
        //更新观看次数
        operaManageDao.updateWachNumber(opera);
    }

    @Override
    public List<OperaComment> getAllOperaCommentByOperaId(int operaId) {
        return operaManageDao.getAllOperaCommentByOperaId(operaId);
    }

    @Override
    public void saveOperaComment(OperaComment operaComment) {
        operaManageDao.saveOperaComment(operaComment);
    }

    @Override
    public List<Opera> researchOpera(String keyword) {
        return operaManageDao.researchOpera("%"+keyword+"%");
    }

    @Override
    public List<Opera> getAllOpera() {
        return operaManageDao.getAllOpera();
    }

    @Override
    public String useCollection(int operaId, int userId) {
        String flag = "yes";//默认收藏按钮能用
        HashMap map = new HashMap();
        map.put("operaId",operaId);
        map.put("userId",userId);
        List<Collection> collectionList = operaManageDao.getCollectionByOperaIdAndUserId(map);
        if(collectionList.size() == 0) {//说明用户还没有收藏过这个戏，可以收藏
            flag = "yes";
        }else {//说明收藏过，不能再收藏了
            flag = "no";
        }
        return flag;
    }


}
