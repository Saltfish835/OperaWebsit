package com.hggc.controller;

import com.hggc.bean.*;
import com.hggc.service.AdminManageService;
import com.hggc.service.OperaManageService;
import com.hggc.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/AdminManage")
public class AdminManageController {

    @Autowired
    AdminManageService adminManageService;

    @Autowired
    OperaManageService operaManageService;

    @Autowired
    UserManageService userManageService;

    @RequestMapping("/jumpToAdminLogin")
    public ModelAndView jumpToAdminLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminLoginPage");
        return mv;
    }


    @RequestMapping("/adminLogin")
    public ModelAndView adminLogin(Admin admin, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Admin> adminList = adminManageService.adminLogin(admin);
        if(adminList.size() == 0) {
            //登录失败
            mv.addObject("loginStatus","failed");
            mv.setViewName("adminLoginPage");
        }else {
            request.getSession().setAttribute("admin",adminList.get(0));//将管理员放到session中
            //得到有几位用户共上传了几个视频待处理
            int userNumber = adminManageService.getNewUploadOperaUserNum();//有几个用户上传的视频
            List<Opera> operaList = adminManageService.getNeedHandleOpera();//得到哪些戏曲需要审核
            mv.addObject("userNumber",userNumber);
            mv.addObject("needHandleOperaNumber",operaList.size());
            //得到有几位用户共发表了几条评论待处理
            int userNumber_2 = adminManageService.getNewCommentUserNum();
            List<OperaComment> operaCommentList = adminManageService.getNewOperaComment();
            mv.addObject("userNumber_2",userNumber_2);
            mv.addObject("newOperaNumber",operaCommentList.size());


            //要显示哪一个标签页
            mv.addObject("showPage","adminMainPageBox");
            mv.setViewName("adminMainPage");
        }
        return mv;
    }


    @RequestMapping("/adminExit")
    public ModelAndView adminExit(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //注销就是注销session，并返回登录页
        session.invalidate();
        mv.setViewName("adminLoginPage");
        return mv;
    }


    /**
     * 跳到审核戏曲的标签页
     * @return
     */
    @RequestMapping("/jumpToHandleOperaPage")
    public ModelAndView jumpToHandleOperaPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //得到需要审核的戏曲，分页显示,一页显示6个
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        List<Opera> operaList = adminManageService.getNeedHandleOperaByFenye((currentPage-1)*6,6);
        mv.addObject("operaList",operaList);
        //得到总页数
        int totalPageNumber = (adminManageService.getNeedHandleOpera().size()+6-1)/6;
        mv.addObject("currentPage",currentPage);
        mv.addObject("totalPageNumber",totalPageNumber);
        //要显示哪一个标签页
        mv.setViewName("handleOperaPage");
        return mv;
    }

    /**
     * 跳到首页标签页
     * @return
     */
    @RequestMapping("/jumpToMainPage")
    public ModelAndView jumpToMainPage() {
        ModelAndView mv = new ModelAndView();
        //得到有几位用户共上传了几个视频待处理
        int userNumber = adminManageService.getNewUploadOperaUserNum();//有几个用户上传的视频
        List<Opera> operaList = adminManageService.getNeedHandleOpera();//得到哪些戏曲需要审核
        mv.addObject("userNumber",userNumber);
        mv.addObject("needHandleOperaNumber",operaList.size());
        //得到有几位用户共发表了几条评论待处理
        int userNumber_2 = adminManageService.getNewCommentUserNum();
        List<OperaComment> operaCommentList = adminManageService.getNewOperaComment();
        mv.addObject("userNumber_2",userNumber_2);
        mv.addObject("newOperaNumber",operaCommentList.size());

        //可能还有其它的数据需要得到

        //要显示哪一个标签页
        mv.setViewName("adminMainPage");
        return mv;
    }


    @RequestMapping("/handleOperaDetail")
    public ModelAndView handleOperaDetail(@RequestParam int operaId){
        ModelAndView mv = new ModelAndView();
        //通过operaId得到对应的戏曲
        Opera opera = operaManageService.getOperaById(operaId);
        //得到该视频的上传者
        User user = userManageService.getUserById(opera.getUserId());
        mv.addObject("uploader",user);
        mv.addObject("opera",opera);
        mv.setViewName("handleOperaDetailPage");
        return mv;
    }


    /**
     * 真正审核戏曲的方法
     * @param operaId
     * @return
     */
    @RequestMapping("/handleOperaMethod")
    public @ResponseBody Message handleOperaMethod(@RequestParam int operaId,String status) {
        Message message = new Message();
        if("yes".equals(status)) {
            //通过
            adminManageService.operapass(operaId);
            message.setState("success");
            message.setMessage("该戏曲审核通过，可以在网站上进行访问");
        }else if("no".equals(status)) {
            //未通过
            adminManageService.operaNoPass(operaId);
            message.setState("failed");
            message.setMessage("该戏曲审核未通过，不能在网站上进行访问");
        }
        return message;
    }



    @RequestMapping("/jumpToOperaCommentEditPage")
    public ModelAndView jumpToOperaCommentEditPage() {
        ModelAndView mv = new ModelAndView();
        //得到需要处理的评论
        List<OperaComment> operaCommentListTemp = adminManageService.getNewOperaComment();
        //为所有的operaComment的user对象赋值和opera对象赋值
        List<User> userList = userManageService.getAllUser();
        List<OperaComment> operaCommentList = new ArrayList<>();
        for(OperaComment operaComment : operaCommentListTemp) {
            for(User user : userList) {
                if(operaComment.getUserId() == user.getId()) {
                    operaComment.setOpera(operaManageService.getOperaById(operaComment.getOperaId()));
                    operaComment.setUsre(user);
                    operaCommentList.add(operaComment);
                }
            }
        }

        mv.addObject("operaCommentList",operaCommentList);
        mv.setViewName("handleOperaCommentPage");
        return mv;
    }


    /**
     * 管理员编辑戏曲评论
     * @param id
     * @param content
     * @return
     */
    @RequestMapping("/updateOperaCommentContent")
    public @ResponseBody Message updateOperaCommentContent(@RequestParam int id,String content) {
        Message message = new Message();
        adminManageService.updateOperaCommentContent(id,content);
        return message;
    }


    @RequestMapping("/jumpToNoticePage")
    public ModelAndView jumpToNoticePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("noticePage");
        return mv;
    }




    @RequestMapping("/sendNotice")
    public ModelAndView sendNotice(@RequestParam String content) {
        ModelAndView mv = new ModelAndView();
        //得到当前时间
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());//得到当前时间
        //封装通知信息
        Notice notice = new Notice();
        notice.setContent(content);
        notice.setPublicationTime(currentTime);
        //存入数据库
        adminManageService.saveNotice(notice);
        //返回成功信息用于提示
        mv.addObject("sendStatus","success");
        mv.setViewName("noticePage");
        return mv;
    }
}























