package com.web.graduation.service.serviceImpl;

import com.web.graduation.dao.CommentDao;
import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Response;
import com.web.graduation.service.CommentService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@CacheConfig(cacheNames = "Comment")
public class CommentServiceImpl implements CommentService {

    @Resource
    CommentDao commentDao;

    @Override
    @CachePut(value = "comment",key = "#comment.artid")
    public List<Comment> addComment(Comment comment) {
        commentDao.addComment(comment);
        return commentDao.commentList(comment.getArtid());
    }

    @Override
    @Cacheable(value = "comment",key = "#art_id")
    public List<Comment> commentList(int art_id) {
        return commentDao.commentList(art_id);
    }

    @Override
    @CachePut(value = "comment",key = "#response.artid")
    public List<Comment> addResponse(Response response) {
        commentDao.addResponse(response);
        return commentDao.commentList(response.getArtid());
    }

    @Override
    @CachePut(value = "workcomment",key = "#comment.artid")
    public List<Comment> addWorkComment(Comment comment) {
        commentDao.addWorkComment(comment);
        return commentDao.workComment(comment.getArtid());
    }

    @Override
    @Cacheable(value = "workcomment",key = "#work_id")
    public List<Comment> workComment(int work_id) {
        return commentDao.workComment(work_id);
    }
}
