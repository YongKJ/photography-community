package com.web.graduation.service;

import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Response;

import java.util.List;

public interface CommentService {
    List<Comment> addComment(Comment comment);
    List<Comment> commentList(int art_id);
    List<Comment> addResponse(Response response);

    List<Comment> addWorkComment(Comment comment);
    List<Comment> workComment(int work_id);
}
