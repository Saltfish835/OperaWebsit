package com.hggc.controller;

import com.hggc.bean.Collection;
import com.hggc.bean.*;
import com.hggc.service.OperaManageService;
import com.hggc.service.UserManageService;
import com.hggc.tool.SendCheckCode;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/UserManage")
public class UserManageController {

    static Logger logger = Logger.getLogger(UserManageController.class);

    @Autowired
    UserManageService userManageService;

    @Autowired
    OperaManageService operaManageService;
    /**
     * 用户点击导航栏上的用户图标，就请求这个方法，如果用户没有登录，则跳转到用户登录注册界面，如果用户已登录，则跳转到用户中心界面
     * @param
     * @return
     */
    @RequestMapping("/clickUserInfo")
    public ModelAndView clickUserInfo(HttpServletRequest request) {
        ModelAndView  mv = new ModelAndView();


        //得到session
        HttpSession session = request.getSession();
        //判断用户是否登录
        if((User)session.getAttribute("user") == null) {
            //session里面没有user对象，故肯定没有登录，让其跳转到用户登录or注册界面
            mv.setViewName("userLoginOrRegisterPage");
        }else {
            //session里面有user对象，故跳转到用户信息管理界面
            //首先肯定要先得到用户得一些信息
            mv.addObject("user",(User)session.getAttribute("user"));
            mv.setViewName("userInfoManagePage");
        }
        return mv;
    }


    @RequestMapping("/userLogin")
    public ModelAndView userLogin(User user,HttpSession session){
        ModelAndView mv = new ModelAndView();
        logger.info("======================================user========================");
        logger.info(user.toString());
        List<User> userList = userManageService.userLogin(user);
        if(userList.size() == 0) {//登录失败
            mv.addObject("message","failed");
            mv.setViewName("userLoginOrRegisterPage");//登录失败留在主页
        }else {//否则成功,跳回主页
            //将用户存入session
            session.setAttribute("user",userList.get(0));
            mv.addObject("message","success");
            //得到首页需要显示的数据
            HashMap<Integer,List<Opera>> mainPageData = userManageService.getMainPageData();
            mv.addObject("mainPageData",mainPageData);
            //得到所有的戏曲种类
            List<Type> typeList = operaManageService.getAllType();
            mv.addObject("typeList",typeList);
            mv.setViewName("mainPage");
        }
        return mv;
    }

    @RequestMapping("/userRegister")
    public ModelAndView userRegister(User user) {
        ModelAndView mv = new ModelAndView();
        boolean flag = userManageService.userRegister(user);
        if(flag == true) {
            mv.addObject("registerState","success");
        } else {
            mv.addObject("registerState","failed");
        }
        mv.setViewName("userLoginOrRegisterPage");//注册成功返回登录页面
        return mv;
    }


    /**
     * 用户修改个人信息时发送验证码
     * @param request
     * @return
     */
    @RequestMapping("/sendCheckCode")
    public @ResponseBody Message sendCheckCode(HttpServletRequest request){
        Message message = new Message();
        //得到要发送给谁
        String email = request.getParameter("email");
        logger.info("================================emali sended check code=========================");
        logger.info(email);
        //产生验证码
        Random random = new Random();
        String checkCode = "";
        for(int i=0;i<4;i++) {
            String n = String.valueOf(random.nextInt(10));
            checkCode+=n;
        }
        logger.info("================================check code is=========================");
        logger.info(checkCode);
        //将验证码存入session中
        request.getSession().setAttribute("checkCode",checkCode);
        //将验证码发送出去
        SendCheckCode sendCheckCode = new SendCheckCode();
        try {
            sendCheckCode.sendCheckCode(email,checkCode);
            //到这里说明没有问题
            message.setMessage("success");
        }catch (Exception e) {
            //说明发送验证码失败
            message.setMessage("failed");
            e.printStackTrace();
        }finally {
            return message;
        }
    }


    /**
     * 修改个人信息方法
     * @param request
     * @return
     */
    @RequestMapping("/modifyUserInfo")
    public @ResponseBody Message modifyUserInfo(HttpServletRequest request) {
        int id = Integer.valueOf(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String email = request.getParameter("email");
        String receiveCheckCode = request.getParameter("checkCode");//用户输入的验证码
        String serverCheckCode = (String)request.getSession().getAttribute("checkCode");//服务器生成的验证码
        User user = new User();
        user.setId(id);
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setEmail(email);
        Message message = new Message();
        logger.info("===========================user is:==================================");
        logger.info(user.toString());
        //首先判断用户输入的验证码和服务器生成的验证码是否一样
        if(receiveCheckCode.equals(serverCheckCode)) {
            //相同则修改
            userManageService.updateUser(user);
            //并且更新session中存的用户
            request.getSession().setAttribute("user",user);
            //设置成功信息
            message.setMessage("success");
        }else {
            //验证码错误，修改失败
            message.setMessage("failed");
        }
        return message;
    }


    @RequestMapping("/exit")
    public ModelAndView exit(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //首先注销掉session
        session.invalidate();
        //跳转到主页
        //得到所有的戏曲种类,之前要得到首页需要的数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到首页需要显示的数据
        HashMap<Integer,List<Opera>> mainPageData = userManageService.getMainPageData();
        mv.addObject("mainPageData",mainPageData);
        mv.setViewName("mainPage");
        return mv;
    }


    /**
     * 用户查看已上传戏曲的处理方法
     * @return
     */
    @RequestMapping("/uploadedOpera")
    public ModelAndView uploadedOpera(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        //得到分页数
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        logger.info("============================get currentPage is:=================");
        logger.info(currentPage);
        //查看是哪一个用户要看它上传的文件
        User user = (User)session.getAttribute("user");
        logger.info("============================the user that need to look at opera=================");
        logger.info(user.toString());
        List<Opera> operaList = operaManageService.getOperaByUserIdAndLimit(user.getId(),(currentPage-1)*8,8);
        logger.info("============================operaList size is=================");
        logger.info(operaList.size());
        //得到总页数
        List<Opera> operaListTemp = operaManageService.getOperaByUserId(user.getId());
        int totalPageNumber = (operaListTemp.size()+8-1)/8;
        //模仿分页
//        int lastIndex = (currentPage-1)*8+8;
//        logger.info("============================lastIndex is:=================");
//        logger.info(lastIndex);
//        List<Opera> fenyeOperaList = new ArrayList<Opera>();
//        if(lastIndex > operaList.size()-1) {
//            if((currentPage-1)*8 == operaList.size()-1) {
//                fenyeOperaList.add(operaList.get((currentPage-1)*8));
//            }else {
//                fenyeOperaList = operaList.subList((currentPage-1)*8,operaList.size()-1);
//            }
//        }else {
//            fenyeOperaList = operaList.subList((currentPage-1)*8,lastIndex);
//        }

        mv.addObject("operaList",operaList);
        mv.addObject("totalPageNumber",totalPageNumber);
        mv.addObject("currentPage",currentPage);
        mv.addObject("uploadedOperaState","success");
        mv.setViewName("userInfoManagePage");
        return mv;
    }


    @RequestMapping("/collectionOpera")
    public ModelAndView collectionOpera(@RequestParam int currentPage,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //查看是哪一个用户要看它的收藏
        User user = (User)session.getAttribute("user");
        //得到他需要的收藏，分页显示
        List<Collection> collectionList = userManageService.getCollectionByUserIdAndLimit(user.getId(),(currentPage-1)*8,8);
        //得到收藏的总页数
        List<Collection> collectionListTemp = userManageService.getCollectionByUserId(user.getId());
        int totalPageNumber = (collectionListTemp.size()+8-1)/8;
        mv.addObject("collectionList",collectionList);
        mv.addObject("totalPageNumber",totalPageNumber);
        mv.addObject("currentPage",currentPage);
        mv.addObject("collectionOpera","success");
        mv.setViewName("userInfoManagePage");
        return mv;
    }


    @RequestMapping("/backMainPage")
    public ModelAndView backMainPage() {
        ModelAndView mv = new ModelAndView();
        //首页需要戏曲类型信息
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //当然还需要其它的信息，那个就另外再说了
        //得到首页需要显示的数据
        HashMap<Integer,List<Opera>> mainPageData = userManageService.getMainPageData();
        mv.addObject("mainPageData",mainPageData);
        mv.setViewName("mainPage");
        return mv;
    }


    /**
     * 显示排行
     * @return
     */
    @RequestMapping("/showRank")
    public ModelAndView showRank() {
        ModelAndView mv = new ModelAndView();
        //首先需要所有戏曲类型的数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到观看次数前五十的视频
        List<Opera> operaList = userManageService.getHotOpera();
        mv.addObject("operaList",operaList);
        mv.setViewName("showRank");
        return mv;
    }


    /**
     * 显示信息
     * @return
     */
    @RequestMapping("/showMessage")
    public ModelAndView showMessage() {
        ModelAndView mv = new ModelAndView();
        //首先需要所有戏曲类型的数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到系统通知
        List<Notice> noticeList = userManageService.getAllNotice();
        mv.addObject("noticeList",noticeList);
        //得到所有消息
        List<TMessage> tMessageListTemp = userManageService.getAllTMeaasge();
        List<TMessage> tMessageList = new ArrayList<>();
        for(TMessage tMessage : tMessageListTemp) {
            tMessage.setUser(userManageService.getUserById(tMessage.getUserId()));
            tMessageList.add(tMessage);
        }
        mv.addObject("tMessageList",tMessageList);


        mv.setViewName("showMessage");
        return mv;
    }



    @RequestMapping("/sendTMessage")
    public ModelAndView sendTMessage(@RequestParam String message,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        TMessage tMessage = new TMessage();
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());//得到当前时间
        //封装数据
        tMessage.setContent(message);
        tMessage.setMessageTime(currentTime);
        User user = (User)session.getAttribute("user");
        tMessage.setUserId(user.getId());
        //保存信息
        userManageService.saveTMessage(tMessage);
        //得到页面所需要的数据
        //首先需要所有戏曲类型的数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到系统通知
        List<Notice> noticeList = userManageService.getAllNotice();
        mv.addObject("noticeList",noticeList);
        //得到所有消息
        List<TMessage> tMessageListTemp = userManageService.getAllTMeaasge();
        List<TMessage> tMessageList = new ArrayList<>();
        for(TMessage tMessage1 : tMessageListTemp) {
            tMessage1.setUser(userManageService.getUserById(tMessage1.getUserId()));
            tMessageList.add(tMessage1);
        }
        mv.addObject("tMessageList",tMessageList);
        mv.addObject("sendTMessageStatus","success");
        mv.setViewName("showMessage");
        return mv;
    }


    /**
     * 用户点击收藏
     * @param operaId
     * @param session
     * @return
     */
    @RequestMapping("/operaCollection")
    public @ResponseBody Message operaCollection(@RequestParam int operaId,HttpSession session) {
        Message message = new Message();
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());//得到当前时间
        User user = (User)session.getAttribute("user");
        //封装数据
        Collection collection = new Collection();
        collection.setOperaId(operaId);
        collection.setUserId(user.getId());
        collection.setCollectionTime(currentTime);
        //保存数据
        userManageService.saveCollection(collection);
        //还要跟新对应戏曲得收藏数
        userManageService.operaCollectionNumberPP(operaId);
        message.setState("success");
        message.setMessage("收藏成功");
        return message;
    }

}












