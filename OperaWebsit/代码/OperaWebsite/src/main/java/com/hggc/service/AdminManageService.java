package com.hggc.service;

import com.hggc.bean.Admin;
import com.hggc.bean.Notice;
import com.hggc.bean.Opera;
import com.hggc.bean.OperaComment;

import java.util.List;

public interface AdminManageService {

    public List<Admin> adminLogin(Admin admin);

    public int getNewUploadOperaUserNum();

    public List<Opera> getNeedHandleOpera();

    public List<Opera> getNeedHandleOperaByFenye(int start,int number);

    public void operapass(int operaId);

    public void operaNoPass(int operaId);

    public int getNewCommentUserNum();

    public List<OperaComment> getNewOperaComment();

    public void updateOperaCommentContent(int id,String content);

    public void saveNotice(Notice notice);

}
