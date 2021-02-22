package com.web.graduation.service;

import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Works;

import java.util.List;

public interface MessageService {
    List<Comment> checkComment(int user_id);
    List<Comment> commentInfo(int user_id);

    Comment worksComment(int user_id);
    Comment artComment(int user_id);

    List<Comment> checkArtComment(int user_id);
    List<Comment> artCommentInfo(int user_id);

    List<Works> allCollection(int user_id);
}
