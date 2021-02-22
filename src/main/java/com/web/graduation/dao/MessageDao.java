package com.web.graduation.dao;

import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Works;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MessageDao {
    List<Comment> checkComment(int user_id);
    List<Comment> commentInfo(int user_id);

    Comment worksComment(int user_id);
    Comment artComment(int user_id);

    List<Comment> checkArtComment(int user_id);
    List<Comment> artCommentInfo(int user_id);

    List<Works> worksCollection(int user_id);
    List<Works> articleCollection(int user_id);
}
