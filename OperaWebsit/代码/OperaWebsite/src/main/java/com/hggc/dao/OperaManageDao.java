package com.hggc.dao;

import com.hggc.bean.*;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface OperaManageDao {

    /**
     * 用于测试环境，别无他用
     * @return
     */
    public Admin test();


    /**
     * 得到所有戏曲种类
     * @return
     */
    public List<Type> getAllType();


    public void saveOpera(Opera opera);

    public List<Opera> getOperaByUserId(int userId);

    public Opera getOperaById(int id);

    public List<Opera> getOperaByUserIdAndLimit(HashMap map);

    public void operaHandle(HashMap map);

    public List<Opera> getOperaByFenye(HashMap map);

    public List<Opera> getAllOperaByTypeId(HashMap map);

    public void updateWachNumber(Opera opera);

    public List<OperaComment> getAllOperaCommentByOperaId(int operaId);

    public void saveOperaComment(OperaComment operaComment);

    public List<Opera> researchOpera(String keyword);

    public List<Opera> getAllOpera();

    public List<Collection> getCollectionByOperaIdAndUserId(HashMap map);

}
