package com.web.graduation.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.graduation.dao.AttentionDao;
import com.web.graduation.entities.Attention;
import com.web.graduation.service.AttentionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AttentionServiceImpl implements AttentionService {

    @Resource
    AttentionDao attentionDao;

    @Override
    public int addAuthor(int top, int next, String date_time) {
        return attentionDao.addAuthor(top, next,date_time);
    }

    @Override
    public int delAuthor(int top, int next) {
        return attentionDao.delAuthor(top, next);
    }

    @Override
    public List<Attention> authorList(int top) {
        return attentionDao.authorList(top);
    }

    @Override
    public List<Attention> fansList(int next) {
        return attentionDao.fansList(next);
    }

    @Override
    public Attention checkAuthor(int top, int next) {
        return attentionDao.checkAuthor(top, next);
    }

    @Override
    public PageInfo<Attention> attentionList(int next, int page) {
        PageHelper.startPage(page,2);
        List<Attention> list = attentionDao.attentionList(next);
        PageInfo<Attention> attentionPageInfo = new PageInfo<>(list);
        System.out.println(attentionPageInfo);
        return attentionPageInfo;
    }

    @Override
    public int fansCount(int next) {
        return attentionDao.fansCount(next);
    }
}
