package com.web.graduation.dao;

import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Response;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommentDao {
    int addComment(Comment comment);
    List<Comment> commentList(int art_id);
    int addResponse(Response response);

    int addWorkComment(Comment comment);
    List<Comment> workComment(int work_id);
}
