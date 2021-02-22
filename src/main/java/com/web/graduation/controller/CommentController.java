package com.web.graduation.controller;


import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Response;
import com.web.graduation.service.CommentService;
import com.web.graduation.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/comment", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class CommentController {
    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/insert")
    public List<Comment> addComment(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        String content = (String) param.get("content");
        String art_id = (String) param.get("art_id");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String[] split = time.split("-");
        time = split[0] + "年" + split[1] + "月" + split[2] + "日";
        Comment comment = new Comment();
        comment.setUserid(Integer.valueOf(userId));
        comment.setArtid(Integer.valueOf(art_id));
        comment.setContent(content);
        comment.setDate_time(time);
        List<Comment> comments = commentService.addComment(comment);
        return comments;
    }

    @RequestMapping(value = "/info")
    public List<Comment> getComments(@RequestBody Map param) {
        String art_id = (String) param.get("art_id");
        List<Comment> comments = commentService.commentList(Integer.valueOf(art_id));
        return comments;
    }

    @RequestMapping(value = "/response")
    public List<Comment> addResponse(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        String response = (String) param.get("response");
        int comment_id = (int) param.get("comment_id");
        int userid = (int) param.get("user2_id");
        String artid = (String) param.get("artid");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        String[] split = time.split("-");
//        time = split[0] + "年" + split[1] + "月" + split[2] + "日";
        Response response1 = new Response();
        response1.setUser1_id(Integer.valueOf(userId));
        response1.setUser2_id(userid);
        response1.setResponse(response);
        response1.setRes_time(time);
        response1.setComment_id(comment_id);
        response1.setArtid(Integer.valueOf(artid));
        List<Comment> comments = commentService.addResponse(response1);
        System.out.println(comments);
        return comments;
    }

    @RequestMapping(value = "/addcomment")
    public List<Comment> addWorkComment(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        String content = (String) param.get("content");
        String work_id = (String) param.get("work_id");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Comment comment = new Comment();
        comment.setUserid(Integer.valueOf(userId));
        comment.setArtid(Integer.valueOf(work_id));
        comment.setContent(content);
        comment.setDate_time(time);
        List<Comment> comments = commentService.addWorkComment(comment);
        return comments;
    }

    @RequestMapping(value = "/work")
    public List<Comment> getWorkComments(@RequestBody Map param) {
        String work_id = (String) param.get("work_id");
        List<Comment> comments = commentService.workComment(Integer.valueOf(work_id));
        return comments;
    }

}
