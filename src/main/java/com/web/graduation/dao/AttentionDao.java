package com.web.graduation.dao;

import com.web.graduation.entities.Attention;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AttentionDao {
    int addAuthor(int top, int next, String date_time);
    int delAuthor(int top, int next);
    List<Attention> authorList(int top);
    List<Attention> fansList(int next);
    Attention checkAuthor(int top, int next);
    List<Attention> attentionList(int next);
    int fansCount(int next);
}
