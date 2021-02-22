package com.web.graduation.service;

import com.github.pagehelper.PageInfo;
import com.web.graduation.entities.Attention;

import java.util.List;

public interface AttentionService {
    int addAuthor(int top, int next, String date_time);
    int delAuthor(int top, int next);
    List<Attention> authorList(int top);
    List<Attention> fansList(int next);
    Attention checkAuthor(int top, int next);
    PageInfo<Attention> attentionList(int next,int page);
    int fansCount(int next);
}
