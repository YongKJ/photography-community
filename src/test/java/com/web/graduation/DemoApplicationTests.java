package com.web.graduation;



import com.github.pagehelper.PageInfo;
import com.web.graduation.dao.AttentionDao;
import com.web.graduation.dao.CommentDao;
import com.web.graduation.dao.MessageDao;
import com.web.graduation.dao.WorksDao;
import com.web.graduation.entities.*;
import com.web.graduation.service.AttentionService;
import com.web.graduation.service.CommentService;
import com.web.graduation.service.MessageService;
import com.web.graduation.service.serviceImpl.MessageServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Set;


@SpringBootTest
class DemoApplicationTests {

    @Resource
    MessageDao messageDao;

    @Resource
    CommentDao commentDao;
    @Resource
    CommentService commentService;
    @Resource
    WorksDao worksDao;
    @Resource
    RedisTemplate redisTemplate;
    @Resource
    StringRedisTemplate stringRedisTemplate;
    @Resource
    AttentionService attentionService;
    @Resource
    AttentionDao attentionDao;
    @Resource
    MessageService messageService;

    @Test
    public void get() {
//        List<Works> works = worksDao.indexWorks();
//        System.out.println(works);
    }
    @Test
    public void llist() {
        Set<String> keys = stringRedisTemplate.keys("article::*");
        Iterator<String> it1 = keys.iterator();
        while (it1.hasNext()) {
            stringRedisTemplate.delete(it1.next());
        }
    }
}
