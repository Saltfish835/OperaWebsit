package com.hggc.service.impl;

import com.hggc.bean.Admin;
import com.hggc.bean.Notice;
import com.hggc.bean.Opera;
import com.hggc.bean.OperaComment;
import com.hggc.dao.AdminManageDao;
import com.hggc.dao.OperaManageDao;
import com.hggc.service.AdminManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminManageServiceImpl implements AdminManageService {

    @Autowired
    AdminManageDao adminManageDao;

    @Autowired
    OperaManageDao operaManageDao;

    @Override
    public List<Admin> adminLogin(Admin admin) {
        return adminManageDao.adminLogin(admin);
    }

    @Override
    public int getNewUploadOperaUserNum() {
        List<Opera> operaList = adminManageDao.getNewUploadOperaGroupByUserId();
        return operaList.size();
    }

    @Override
    public List<Opera> getNeedHandleOpera() {
        return adminManageDao.getOperaByStatus("审核中");
    }

    /**
     * 分页显示需要审核的戏曲
     * start 是分页开始位置
     * number 是每一页显示的条数
     * @param start
     * @param number
     * @return
     */
    @Override
    public List<Opera> getNeedHandleOperaByFenye(int start, int number) {
        HashMap map = new HashMap();
        map.put("start",start);
        map.put("number",number);
        return adminManageDao.getNeedHandleOperaByFenye(map);
    }

    @Override
    public void operapass(int operaId) {
        HashMap map = new HashMap();
        map.put("operaId",operaId);
        map.put("status","审核通过");
        operaManageDao.operaHandle(map);
    }

    @Override
    public void operaNoPass(int operaId) {
        HashMap map = new HashMap();
        map.put("operaId",operaId);
        map.put("status","审核未通过");
        operaManageDao.operaHandle(map);
    }

    @Override
    public int getNewCommentUserNum() {
        List<OperaComment> operaCommentList = adminManageDao.getNewCommentGroupByUserId();
        return operaCommentList.size();
    }

    @Override
    public List<OperaComment> getNewOperaComment() {
        return adminManageDao.getNewOperaComment();
    }

    @Override
    public void updateOperaCommentContent(int id, String content) {
        HashMap map = new HashMap();
        map.put("id",id);
        map.put("content",content);
        adminManageDao.updateOperaCommentContent(map);
    }

    @Override
    public void saveNotice(Notice notice) {
        adminManageDao.saveNotice(notice);
    }


}
