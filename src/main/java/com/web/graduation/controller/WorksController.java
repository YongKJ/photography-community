package com.web.graduation.controller;

import com.web.graduation.component.RedisDeal;
import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Image;
import com.web.graduation.entities.Works;
import com.web.graduation.exception.ImageException;
import com.web.graduation.exception.MyMvcException;
import com.web.graduation.service.ImageService;
import com.web.graduation.service.WorksService;
import com.web.graduation.util.TokenUtil;
import org.hibernate.jdbc.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/works", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class WorksController {

    @Autowired
    WorksService worksService;
    @Autowired
    ImageService imageService;
    @Autowired
    RedisDeal redisDeal;
    @Autowired
    private PlatformTransactionManager platformTransactionManager;
    @Value("${upload.path}")
    private String path;

    //    添加图片作品信息
    @RequestMapping(value = "/artworks")
    public Object addWorks(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Map<String, Object> map = new HashMap<>();
        String title = (String) param.get("title");
        String classify = (String) param.get("classify");
        String describe = (String) param.get("describe");
        ArrayList tag = (ArrayList) param.get("tag");
        tag.remove(0);
        String list_tag = String.join(",", tag);
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Works works = new Works();
        works.setWorks_title(title);
        works.setClassify(classify);
        works.setWorks_describe(describe);
        works.setTag(list_tag);
        works.setDate_time(time);
        works.setGlance(0);
        works.setPraise(0);
        works.setUser_id(Integer.valueOf(userId));
        int result = worksService.addWorks(works);
        if (result == 1) {
            map.put("subject", true);
            map.put("message", "发表成功");
        } else {
            map.put("subject", false);
            map.put("message", "系统出错，请稍后再试！");
        }
        return map;
    }

    //    添加图片
    @RequestMapping(value = "/afterimage")
    public Object uploadImage(HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpServletResponse response) throws MyMvcException {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Image image = new Image();
        Works works = worksService.selectId(Integer.valueOf(userId));
        Cookie cookie = new Cookie("workId", String.valueOf(works.getId()));
        response.addCookie(cookie);
        String fileName = file.getOriginalFilename();
        if (fileName.indexOf("\\") != -1) {
            fileName = fileName.substring(fileName.lastIndexOf("\\"));
        }
        String filePath = path + "/static/image/works/";
        File targetFile = new File(filePath);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(filePath + fileName);
            out.write(file.getBytes());
            out.flush();
            out.close();
            String imagePath = "static/image/works/" + fileName;
            image.setImage(imagePath);
            image.setWorks_id(works.getId());
            imageService.addImage(image);
            Map<String, Object> map = new HashMap<>();
            map.put("head", true);
            map.put("message", imagePath);
            return map;
        } catch (Exception e) {
            throw new ImageException("上传失败");
        }
    }


    //    删除作品
    @RequestMapping(value = "/deleterious")
    public boolean deleteWorks(@RequestBody Map param) {
        String user_id = (String)param.get("user_id");
        int work_id = (int) param.get("work_id");
        int result = worksService.deleteWorks(Integer.valueOf(user_id),work_id);
        if (result == 1) {
            redisDeal.deleteRedis("detail");
            return true;
        }else {
            return false;
        }
    }

    //    获取当前用户作品
    @RequestMapping(value = "/selections")
    public List<Works> selectWorks(@RequestBody Map param) {
        String userId = (String) param.get("userId");
        String search = (String) param.get("search");
        List<Works> list = worksService.worksList(Integer.valueOf(userId),search);
        return list;
    }

    @RequestMapping(value = "/worklet")
    public Works worksList(@RequestBody Map param) {
        String work_id = (String) param.get("detail");
        Works works = worksService.selectWorks(Integer.valueOf(work_id));
        return works;
    }

//    浏览量
    @RequestMapping(value = "/glance")
    public void updateGlance(@RequestBody Map param) {
        int workId = (int)param.get("workId");
        worksService.addGlance(workId);
    }

    @RequestMapping(value = "/collect")
    public void isCollect(@RequestBody Map param) {
        boolean flag = (boolean) param.get("flag");
        String user_id = (String) param.get("user_id");
        String work_id = (String) param.get("detail");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        if (flag) {
            worksService.isCollect(Integer.valueOf(user_id),Integer.valueOf(work_id), time);
        }else {
            worksService.delCollect(Integer.valueOf(user_id),Integer.valueOf(work_id));
        }
    }

    @RequestMapping(value = "/check")
    public boolean checkCollect(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        String work_id = (String) param.get("detail");
        ArtCollection artCollection = worksService.workCollList(Integer.valueOf(user_id), Integer.valueOf(work_id));
        if (artCollection != null) {
            return true;
        }else {
            return false;
        }
    }
    @RequestMapping(value = "/collection")
    public List<Works> worksCollect(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        List<Works> works = worksService.worksCollList(Integer.valueOf(user_id));
        return works;
    }
    @RequestMapping(value = "/cancel")
    public boolean delColl(@RequestBody Map param) {
        String user_id = (String)param.get("user_id");
        int work_id = (int) param.get("work_id");
        int result = worksService.delCollect(Integer.valueOf(user_id),work_id);
        if (result == 1) {
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("/gallery")
    public List<Works> galleryWorks(@RequestBody Map param) {
        String info = (String) param.get("info");
        List<Works> works = worksService.galleryWorks(info);
        return works;
    }

    @GetMapping(value = "/index")
    public List<Works> indexWorks() {
        List<Works> works = worksService.indexWorks();
        return works;
    }
}

