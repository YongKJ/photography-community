package com.web.graduation.controller;

import com.web.graduation.dao.MessageDao;
import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Works;
import com.web.graduation.service.MessageService;
import com.web.graduation.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/message", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class MessageController {
    @Autowired
    MessageService messageService;
    @Autowired
    MessageDao messageDao;

    @GetMapping(value = "/check")
    public Boolean checkWorkComment(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        List<Comment> comments = messageService.checkComment(Integer.valueOf(userId));
        if (comments.size() > 0) {
            return true;
        }else {
            return false;
        }
    }

    @GetMapping(value = "/check_art")
    public Boolean checkArtComment(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        List<Comment> comments = messageService.checkArtComment(Integer.valueOf(userId));
        if (comments.size() > 0) {
            return true;
        }else {
            return false;
        }
    }

    @GetMapping(value = "/work")
    public Comment worksComment(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Comment comment = messageService.worksComment(Integer.valueOf(userId));
        return comment;
    }

    @GetMapping(value = "/article")
    public Comment artComment(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Comment comment = messageService.artComment(Integer.valueOf(userId));
        return comment;
    }

    @GetMapping(value = "/worksment")
    public List<Comment> worksMent(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        List<Comment> comments = messageService.commentInfo(Integer.valueOf(userId));
        return comments;
    }

    @GetMapping(value = "/artment")
    public List<Comment> artMent(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        List<Comment> comments = messageService.artCommentInfo(Integer.valueOf(userId));
        return comments;
    }

    @GetMapping(value = "/collect")
    public List<Works> allCollectionInfo(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        List<Works> works = messageService.allCollection(Integer.valueOf(userId));
        return works;
    }

    @GetMapping(value = "/count")
    public int collCount(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        int size = messageDao.worksCollection(Integer.valueOf(userId)).size();
        int size1 = messageDao.articleCollection(Integer.valueOf(userId)).size();
        return size + size1;
    }
}
