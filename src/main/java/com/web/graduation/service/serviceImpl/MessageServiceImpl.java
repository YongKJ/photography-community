package com.web.graduation.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.graduation.dao.MessageDao;
import com.web.graduation.entities.Attention;
import com.web.graduation.entities.Comment;
import com.web.graduation.entities.Works;
import com.web.graduation.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Resource
    MessageDao messageDao;

    @Override
    public List<Comment> checkComment(int user_id) {
        return messageDao.checkComment(user_id);
    }

    @Override
    public List<Comment> commentInfo(int user_id) {
        return messageDao.commentInfo(user_id);
    }

    @Override
    public Comment worksComment(int user_id) {
        return messageDao.worksComment(user_id);
    }

    @Override
    public Comment artComment(int user_id) {
        return messageDao.artComment(user_id);
    }

    @Override
    public List<Comment> checkArtComment(int user_id) {
        return messageDao.checkArtComment(user_id);
    }

    @Override
    public List<Comment> artCommentInfo(int user_id) {
        return messageDao.artCommentInfo(user_id);
    }

    @Override
    public List<Works> allCollection(int user_id) {
        List<Works> works = messageDao.worksCollection(user_id);
        List<Works> works1 = messageDao.articleCollection(user_id);
        works.addAll(works1);
        return works;
    }
}
