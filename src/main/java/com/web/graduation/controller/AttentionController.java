package com.web.graduation.controller;


import com.github.pagehelper.PageInfo;
import com.web.graduation.entities.Attention;
import com.web.graduation.service.AttentionService;
import com.web.graduation.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/attention", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class AttentionController {

    @Autowired
    AttentionService attentionService;

    @RequestMapping(value = "/insert")
    public void addAuthor(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        int author_id = (int) param.get("author_id");
        String time= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        boolean flag = (boolean) param.get("flag");
        if (flag) {
            attentionService.addAuthor(Integer.valueOf(userId), author_id, time);
        }else {
            attentionService.delAuthor(Integer.valueOf(userId), author_id);
        }
    }

    @RequestMapping(value = "/author")
    public List<Attention> getAuthor(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        List<Attention> attentions = attentionService.authorList(Integer.valueOf(user_id));
        return attentions;
    }
    @RequestMapping(value = "/fans")
    public List<Attention> getFans(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        List<Attention> attentions = attentionService.fansList(Integer.valueOf(user_id));
        return attentions;
    }

    @RequestMapping(value = "/check")
    public boolean checkAuthor(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        int author_id = (int) param.get("author_id");
        System.out.println(author_id);
        Attention attention = attentionService.checkAuthor(Integer.valueOf(userId), author_id);
        if (attention != null) {
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping(value = "/author_sum")
    public Integer authorSum(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        List<Attention> attentions = attentionService.authorList(Integer.valueOf(user_id));
        return attentions.size();
    }
    @RequestMapping(value = "/fans_sum")
    public Integer fansSum(@RequestBody Map param) {
        String user_id = (String) param.get("user_id");
        List<Attention> attentions = attentionService.fansList(Integer.valueOf(user_id));
        return attentions.size();
    }

    @RequestMapping(value = "/attention_list")
    public PageInfo<Attention> attentionList(HttpServletRequest request,@RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        int page = (int) param.get("page");
        PageInfo<Attention> attentions = attentionService.attentionList(Integer.valueOf(userId), page);
        return attentions;
    }

    @GetMapping(value = "/count")
    public int fansCount(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        int count = attentionService.fansCount(Integer.valueOf(userId));
        return count;
    }
}
