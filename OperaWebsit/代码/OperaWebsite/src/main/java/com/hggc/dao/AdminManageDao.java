package com.hggc.dao;

import com.hggc.bean.Admin;
import com.hggc.bean.Notice;
import com.hggc.bean.Opera;
import com.hggc.bean.OperaComment;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface AdminManageDao {

    public List<Admin> adminLogin(Admin admin);

    public List<Opera> getNewUploadOperaGroupByUserId();

    public List<Opera> getOperaByStatus(String status);

    public List<Opera> getNeedHandleOperaByFenye(HashMap map);

    public List<OperaComment> getNewCommentGroupByUserId();

    public List<OperaComment> getNewOperaComment();

    public void updateOperaCommentContent(HashMap map);

    public void saveNotice(Notice notice);

}
