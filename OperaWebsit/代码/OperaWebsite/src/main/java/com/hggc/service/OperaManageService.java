package com.hggc.service;

import com.hggc.bean.Admin;
import com.hggc.bean.Opera;
import com.hggc.bean.OperaComment;
import com.hggc.bean.Type;

import java.util.List;

public interface OperaManageService {

    /**
     * 测试环境是否正确，别无他用
     * @return
     */
    public Admin test();

    /**
     * 得到所有的戏曲种类
     * @return
     */
    public List<Type> getAllType();

    /**
     * 保存戏曲信息
     * @param opera
     */
    public void saveOpera(Opera opera);


    public List<Opera> getOperaByUserId(int userId);

    public Opera getOperaById(int id);

    public List<Opera> getOperaByUserIdAndLimit(int userId,int start,int number);

    public List<Opera> getOperaByFenye(int start,int number,int typeId);

    public List<Opera> getAllOperaByTypeId(int typeId,String operaStatus);

    public void watchNumberPP(int operaId);

    public List<OperaComment> getAllOperaCommentByOperaId(int operaId);

    public void saveOperaComment(OperaComment operaComment);

    public List<Opera> researchOpera(String keyword);

    public List<Opera> getAllOpera();

    public String useCollection(int operaId,int userId);
}
