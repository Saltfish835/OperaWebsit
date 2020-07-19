package com.hggc.controller;

import com.hggc.bean.*;
import com.hggc.service.OperaManageService;
import com.hggc.service.UserManageService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/OperaManage")
public class OperaManageController {

    static Logger logger = Logger.getLogger(OperaManageController.class);

    @Autowired
    private OperaManageService operaManageService;

    @Autowired
    private UserManageService userManageService;

    @RequestMapping("/jumpToMainPage")
    public ModelAndView jumpToMainPage() {
        ModelAndView mv = new ModelAndView();
        //测试用语句
        //logger.info("请求到了这个方法嘛？");
        //logger.info(operaManageService.test().toString());

        //得到所有的戏曲种类
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到首页需要显示的数据
        HashMap<Integer,List<Opera>> mainPageData = userManageService.getMainPageData();
        mv.addObject("mainPageData",mainPageData);


        mv.setViewName("mainPage");
        return mv;
    }


//    @RequestMapping("/operaUpload")
//    public @ResponseBody Message operaUpload(HttpServletRequest request, Opera opera, @RequestParam("operaFile") MultipartFile operaFile){
//        Message message = new Message();
//        logger.info("==================================opera information is :===========================");
//        logger.info(opera.toString());
//        logger.info("=================================is this file null?:========================================");
//        logger.info(operaFile.isEmpty());
//        if(operaFile.isEmpty()) {
//            //上传文件为空，返回错误信息
//            message.setState("failed");
//            message.setMessage("文件为空");
//            return message;
//        }else {
//            try {
//                //看看上传的是什么文件
//                logger.info("================upload file name is :=================");
//                logger.info(operaFile.getOriginalFilename());
//                //将上传文件存起来
//                String path = request.getServletContext().getRealPath("/video");
//                logger.info("================path name is :=================");
//                logger.info(path);
//                //文件存在服务器中的位置
//                String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
//                String fileName = path+ File.separator+uuid+"."+operaFile.getOriginalFilename().substring(operaFile.getOriginalFilename().lastIndexOf(".")+1);
//                logger.info("================new file name is :=================");
//                logger.info(fileName);
//                File newFile = new File(fileName);
//                operaFile.transferTo(newFile);//将上传的文件写入在服务器上创建的文件中
//                //完善opera对象信息
//                opera.setCollectionNumber(0);
//                opera.setFileName(fileName);
//                opera.setOperaStatus("审核中");
//                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//                String currentTime = df.format(new Date());
//                opera.setPublicationTime(currentTime);//存入当前时间
//                User user = (User)request.getSession().getAttribute("user");
//                opera.setUserId(user.getId());
//                opera.setWatchNumber(0);
//                logger.info("==================================new opera information is :===========================");
//                logger.info(opera.toString());
//                //将opera对象存入数据库
//                operaManageService.saveOpera(opera);
//                message.setState("success");
//                message.setMessage("上传成功");
//            }catch (Exception e) {
//                //如果出错
//                message.setState("failed");
//                message.setMessage("文件上传出错");
//                e.printStackTrace();
//            }finally {
//                return  message;
//            }
//        }
//    }

    @RequestMapping("/operaUpload")
    public ModelAndView operaUpload(HttpServletRequest request, Opera opera, @RequestParam("operaFile") MultipartFile operaFile){
        ModelAndView mv = new ModelAndView();
        logger.info("==================================opera information is :===========================");
        logger.info(opera.toString());
        logger.info("=================================is this file null?:========================================");
        logger.info(operaFile.isEmpty());
        if(operaFile.isEmpty()) {
            //上传文件为空，返回错误信息
            mv.addObject("uploadState","文件为空");
            mv.setViewName("userInfoManagePage");
            return mv;
        }else {
            try {
                //看看上传的是什么文件
                logger.info("================upload file name is :=================");
                logger.info(operaFile.getOriginalFilename());
                //将上传文件存起来
                String path = request.getServletContext().getRealPath("/video");
                logger.info("================path name is :=================");
                logger.info(path);
                //文件存在服务器中的位置
                String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
                String fileName = path+ File.separator+uuid+"."+operaFile.getOriginalFilename().substring(operaFile.getOriginalFilename().lastIndexOf(".")+1);
                logger.info("================new file name is :=================");
                logger.info(fileName);
                File newFile = new File(fileName);
                operaFile.transferTo(newFile);//将上传的文件写入在服务器上创建的文件中
                //完善opera对象信息
                opera.setCollectionNumber(0);
                //opera.setFileName(fileName);
                opera.setFileName("video"+File.separator+uuid+"."+operaFile.getOriginalFilename().substring(operaFile.getOriginalFilename().lastIndexOf(".")+1));
                opera.setOperaStatus("审核中");
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
                String currentTime = df.format(new Date());
                opera.setPublicationTime(currentTime);//存入当前时间
                User user = (User)request.getSession().getAttribute("user");
                opera.setUserId(user.getId());
                opera.setWatchNumber(0);
                logger.info("==================================new opera information is :===========================");
                logger.info(opera.toString());
                //将opera对象存入数据库
                operaManageService.saveOpera(opera);
                mv.addObject("uploadState","上传成功");
                mv.setViewName("userInfoManagePage");
            }catch (Exception e) {
                //如果出错
                mv.addObject("uploadState","文件上传出错");
                mv.setViewName("userInfoManagePage");
                e.printStackTrace();
            }finally {
                return  mv;
            }
        }
    }


    @RequestMapping("/watchUploadedOpera")
    public ModelAndView watchUploadedOpera(@RequestParam("operaId") int id) {
        ModelAndView mv = new ModelAndView();
        logger.info("===============================opera id is :=====================");
        Opera opera = null;
        //通过opera id获取全部详细信息
        opera = operaManageService.getOperaById(id);
        mv.addObject("watchOpera",opera);
        mv.addObject("watchOperaStatus","success");
        mv.setViewName("userInfoManagePage");
        return mv;
    }

    @RequestMapping("/getUploadOperaNumber")
    public @ResponseBody Message getUploadOperaNumber(@RequestParam int userId) {
        Message message = new Message();
        Integer number = null;
        List<Opera> operaList = operaManageService.getOperaByUserId(userId);
        number = operaList.size();
        message.setNumber(number);
        return message;
    }


    /**
     * 跳到对应的戏曲页面
     * @param currentPage
     * @param typeId
     * @return
     */
    @RequestMapping("/jumpToOperaPage")
    public ModelAndView jumpToOperaPage(@RequestParam int currentPage,int typeId) {
        ModelAndView mv = new ModelAndView();
        //每页显示9项
        List<Opera> operaList = operaManageService.getOperaByFenye((currentPage-1)*9,9,typeId);
        mv.addObject("operaList",operaList);
        //得到该种戏曲的总数
        int totalNumber = operaManageService.getAllOperaByTypeId(typeId,"审核通过").size();
        int totalPageNumber = (totalNumber+9-1)/9;
        mv.addObject("totalPageNumber",totalPageNumber);
        //得到导航栏的列表
        List<Type> typeList = operaManageService.getAllType();
        String typeName ="";
        for(Type type : typeList) {
            if(type.getId() == typeId) {
                typeName = type.getTypeName();
            }
        }
        mv.addObject("typeName",typeName);
        mv.addObject("typeList",typeList);
        mv.addObject("typeId",typeId);
        mv.addObject("currentPage",currentPage);
        mv.setViewName("OperaPage");
        return mv;
    }


    /**
     * 看戏的页面
     * @param operaId
     * @return
     */
    @RequestMapping("/jumpToWatchOperaPage")
    public ModelAndView jumpToWatchOperaPage(@RequestParam int operaId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //只要请求了这个方法，该戏曲的观看次数加一
        operaManageService.watchNumberPP(operaId);
        //看戏曲的页面需要这个戏曲的详细信息
        Opera opera = operaManageService.getOperaById(operaId);
        mv.addObject("opera",opera);
        //看戏曲的页面导航栏需要类型数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到这个戏曲的上传者
        User uploader = userManageService.getUserById(opera.getUserId());
        mv.addObject("uploader",uploader);
        //得到该戏曲所有的评论
        List<OperaComment> operaCommentListTemp = operaManageService.getAllOperaCommentByOperaId(operaId);
        List<OperaComment> operaCommentList = new ArrayList<>();
        if(operaCommentListTemp.size() != 0){//如果有评论，完善评论对象
           for(OperaComment operaComment : operaCommentListTemp) {
               User user = userManageService.getUserById(operaComment.getUserId());
               operaComment.setUsre(user);
               Opera operaTemp = operaManageService.getOperaById(operaComment.getOperaId());
               operaComment.setOpera(operaTemp);
               operaCommentList.add(operaComment);
           }
        }
        mv.addObject("operaCommentList",operaCommentList);

        //判断收藏按钮能不能用
        User user = (User)session.getAttribute("user");
        String collectionFlag = "yes";
        if(user != null){
            collectionFlag = operaManageService.useCollection(operaId,user.getId());
        }else {
            collectionFlag = "no";
        }

        mv.addObject("collectionFlag",collectionFlag);

        mv.setViewName("watchOperaPage");
        return mv;
    }


    @RequestMapping("/operaComment")
    public ModelAndView operaComment(@RequestParam String content,int operaId,int userId) {
        ModelAndView mv = new ModelAndView();
        //封装评论对象
        OperaComment operaCommentGlobal = new OperaComment();
        operaCommentGlobal.setContent(content);
        operaCommentGlobal.setCommentStatus("0");
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());//得到当前时间
        operaCommentGlobal.setCommentTime(currentTime);
        operaCommentGlobal.setUserId(userId);
        operaCommentGlobal.setOperaId(operaId);
        //把评论存起来
        operaManageService.saveOperaComment(operaCommentGlobal);
        //得到看戏曲页面需要的数据
        //看戏曲的页面需要这个戏曲的详细信息
        Opera opera = operaManageService.getOperaById(operaId);
        mv.addObject("opera",opera);
        //看戏曲的页面导航栏需要类型数据
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到这个戏曲的上传者
        User uploader = userManageService.getUserById(opera.getUserId());
        mv.addObject("uploader",uploader);
        //得到该戏曲所有的评论
        List<OperaComment> operaCommentListTemp = operaManageService.getAllOperaCommentByOperaId(operaId);
        List<OperaComment> operaCommentList = new ArrayList<>();
        if(operaCommentListTemp.size() != 0){//如果有评论，完善评论对象
            for(OperaComment operaComment : operaCommentListTemp) {
                User user = userManageService.getUserById(operaComment.getUserId());
                operaComment.setUsre(user);
                Opera operaTemp = operaManageService.getOperaById(operaComment.getOperaId());
                operaComment.setOpera(operaTemp);
                operaCommentList.add(operaComment);
            }
        }
        mv.addObject("operaCommentList",operaCommentList);


        //判断收藏按钮能不能用
        String collectionFlag = operaManageService.useCollection(operaId,userId);
        mv.addObject("collectionFlag",collectionFlag);


        //返回成功信息
        mv.addObject("operaCommentStatus","success");
        mv.setViewName("watchOperaPage");
        return mv;
    }


    /**
     * 文件下载方法
     * @param
     * @param
     * @return
     * @throws IOException
     */
    @RequestMapping("/operaDownload")
    public ResponseEntity<byte[]> operaDownload(HttpServletRequest request,int operaId) throws IOException {

        String path = request.getServletContext().getRealPath("/video");
        //通过operaId得到opera
        Opera opera = operaManageService.getOperaById(operaId);
        String sst = path.substring(0,path.length()-6);
        String totalPath = sst+File.separator+opera.getFileName();

        String str = opera.getFileName();
        String str1 = str.substring(5);
        String str2 = "\\"+str1;
        String[] str3 = str2.split("\\\\");//经调试str[3]为戏曲文件名，没有什么公式推理，是试出来的
        String fileName = str3[2];

        //真正完成下载功能的代码
        HttpHeaders headers = new HttpHeaders();
        File file = new File(totalPath);//用下载文件的全路径封装成一个文件对象
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);//下载下去的文件显示的名字
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }


    /**
     * 用户搜索方法
     * @param keyword
     * @return
     */
    @RequestMapping("/operaResearch")
    public ModelAndView operaResearch(String keyword) {
        ModelAndView mv = new ModelAndView();
        //showResearchOutcome这个页面需要所有的类型信息
        List<Type> typeList = operaManageService.getAllType();
        mv.addObject("typeList",typeList);
        //得到搜索结果
        List<Opera> operaList = operaManageService.researchOpera(keyword);
        mv.addObject("operaList",operaList);

        mv.setViewName("showResearchOutcome");
        return mv;
    }



}




