package com.web.graduation.controller;


import com.web.graduation.component.RedisDeal;
import com.web.graduation.component.VerCodeGenerateUtil;
import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Article;
import com.web.graduation.service.ArticleService;
import com.web.graduation.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/article", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class ArticleController {

    @Autowired
    ArticleService articleService;
    @Autowired
    VerCodeGenerateUtil verCodeGenerateUtil;
    @Autowired
    RedisDeal redisDeal;
    @Value("${upload.path}")
    private String path;
    @Value("${upload.del}")
    private String del;

    @RequestMapping(value = "/upload")
    public Object addArticle(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Article article = new Article();
        Map<String,Object> map = new HashMap<>();
        MultipartHttpServletRequest params=((MultipartHttpServletRequest) request);
        MultipartFile file = ((MultipartHttpServletRequest) request).getFile("file");
        String worksTitle = params.getParameter("worksTitle");
        int index = params.getParameter("tagList").length() > 9 ? 10:9;
        String tag = params.getParameter("tagList").substring(index,params.getParameter("tagList").length());
        String content = params.getParameter("content");
        String fileName = file.getOriginalFilename();
        String imagePath = "static/image/works/cover/" + fileName;
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        if(fileName.indexOf("\\") != -1){
            fileName = fileName.substring(fileName.lastIndexOf("\\"));
        }
        String filePath = path + "/static/image/works/cover/";
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = null;
        try {
            article.setImage(imagePath);
            article.setTitle(worksTitle);
            article.setContent(content);
            article.setDate_time(time);
            article.setTag(tag);
            article.setGlance(0);
            article.setColl(0);
            article.setUsers_id(Integer.valueOf(userId));
            articleService.addArticle(article);
            out = new FileOutputStream(filePath+fileName);
            out.write(file.getBytes());
            out.flush();
            out.close();
            map.put("subject",true);
            map.put("message","作品已上传发表");
            return map;
        } catch (Exception e) {
            map.put("subject",false);
            map.put("message","操作失败，请稍后再试！");
            return map;
        }
    }

    @RequestMapping(value = "/image")
    public Object uploadImage(HttpServletRequest request,@RequestParam("file") MultipartFile file) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        String code = verCodeGenerateUtil.generateVerCode();
        String fileName = userId + code + file.getOriginalFilename();
        if(fileName.indexOf("\\") != -1){
            fileName = fileName.substring(fileName.lastIndexOf("\\"));
        }
        String filePath = path + "/static/image/article/";
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(filePath+fileName);
            out.write(file.getBytes());
            out.flush();
            out.close();
            String imagePath = "/static/image/article/" + fileName;
            return imagePath;
        } catch (Exception e) {
            String error = "error";
            return error;
        }
    }

    @RequestMapping(value = "/del")
    public void delImage(@RequestBody Map param) {
        String url = (String)param.get("url");
        String[] path = url.split(del);
        String delPath = path + path[1];
        File file1 = new File(delPath);
        file1.delete();
    }

    @RequestMapping(value = "/articles")
    public Object userArticle(@RequestBody Map param) {
        String userId = (String)param.get("userId");
        String search = (String)param.get("search");
        List<Article> articleList = articleService.articleList(Integer.valueOf(userId),search);
        return articleList;
    }

    //    浏览量
    @RequestMapping(value = "/glance")
    public void updateGlance(@RequestBody Map param) {
        int articleId = (int)param.get("articleId");
        articleService.addGlance(articleId);
    }

    @RequestMapping(value = "/gettable")
    public Article getArticle(@RequestBody Map param) {
        String articleId = (String)param.get("articleId");
        Article article = articleService.selectArticle(Integer.valueOf(articleId));
        return article;
    }
    @GetMapping(value = "/gentiles")
    public List<Article> allArticles() {
        List<Article> articles = articleService.allArticles();
        return articles;
    }

    @GetMapping(value = "/garrot")
    public List<Article> hotArticles() {
        List<Article> articles = articleService.hotArticles();
        return articles;
    }

    @RequestMapping(value = "/search")
    public List<Article> searchArticles(@RequestBody Map param) {
        String info = (String)param.get("search");
        List<Article> articles = articleService.searchArticles(info);
        return articles;
    }

    @RequestMapping(value = "/collect")
    public Object isCollect(@RequestBody Map param) {
        boolean flag = (boolean) param.get("flag");
        String user_id = (String) param.get("user_id");
        String art_id = (String) param.get("art_id");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Map<String,Object> map = new HashMap<>();
        if (flag) {
            List<Article> collect = articleService.isCollect(Integer.valueOf(user_id), Integer.valueOf(art_id),time);
            if (collect != null) {
                articleService.addColl(Integer.valueOf(art_id));
                map.put("subject",true);
            }else {
                map.put("subject",false);
            }
        }else {
            List<Article> collect1 = articleService.delCollect(Integer.valueOf(user_id),Integer.valueOf(art_id));
            if (collect1 != null) {
                articleService.reduceColl(Integer.valueOf(art_id));
                map.put("subject",false);
            }else {
                map.put("subject",true);
            }
        }
        return map;
    }
    @RequestMapping(value = "/atoll")
    public Object isArtColl(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        String art_id = (String) param.get("art_id");
        Map<String,Object> map = new HashMap<>();
        ArtCollection artCollection = articleService.artCollList(Integer.valueOf(user_id),Integer.valueOf(art_id));
        if (artCollection != null) {
            map.put("flag",true);
        }else {
            map.put("flag",false);
        }
        return map;
    }

    @RequestMapping(value = "/collection")
    public List<Article> userCollect(@RequestBody Map param) {
        String userId = (String) param.get("userId");
        List<Article> articles = articleService.userCollList(Integer.valueOf(userId));
        return articles;
    }

    @RequestMapping(value = "/cancel")
    public boolean delColl(@RequestBody Map param) {
        String user_id = (String)param.get("user_id");
        int art_id = (int) param.get("art_id");
        List<Article> result = articleService.delCollect(Integer.valueOf(user_id),art_id);
        if (result != null) {
            articleService.reduceColl(Integer.valueOf(art_id));
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping(value = "/deleterious")
    public boolean delArticle(@RequestBody Map param) {
        String user_id = (String)param.get("user_id");
        int art_id = (int) param.get("art_id");
        int result = articleService.delArticle(Integer.valueOf(user_id),art_id);
        if (result == 1) {
            redisDeal.deleteRedis("art_collection");
            redisDeal.deleteRedis("article");
            redisDeal.deleteRedis("comment");
            articleService.reduceColl(Integer.valueOf(art_id));
            return true;
        }else {
            return false;
        }
    }
}
