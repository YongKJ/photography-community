package com.web.graduation.service.serviceImpl;

import com.web.graduation.dao.WorksDao;
import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Works;
import com.web.graduation.service.WorksService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@CacheConfig(cacheNames = "Works")
public class WorksServiceImpl implements WorksService {

    @Resource
    private WorksDao worksDao;
    @Override
    public int addWorks(Works works) {
        return worksDao.addWorks(works);
    }

    @Override
    public Works selectId(int userId) {
        return worksDao.selectId(userId);
    }

    @Override
    public int deleteWorks(int userId, int works_id) {
        return worksDao.deleteWorks(userId, works_id);
    }

    @Override
    @CachePut(value = "detail",key = "#works_id")
    public Works addGlance(int works_id) {
        worksDao.addGlance(works_id);
        return worksDao.selectWorks(works_id);
    }

    @Override
    @Cacheable(value = "detail",key = "#works_id")
    public Works selectWorks(int works_id) {
        return worksDao.selectWorks(works_id);
    }

    @Override
    public List<Works> worksList(int user_id, String info) {
        return worksDao.worksList(user_id, info);
    }

    @Override
    public int isCollect(int user_id, int work_id, String date_time) {
        return worksDao.isCollect(user_id, work_id, date_time);
    }

    @Override
    public int delCollect(int user_id, int work_id) {
        return worksDao.delCollect(user_id, work_id);
    }

    @Override
    public ArtCollection workCollList(int user_id, int work_id) {
        return worksDao.workCollList(user_id, work_id);
    }

    @Override
    public List<Works> worksCollList(int user_id) {
        return worksDao.worksCollList(user_id);
    }

    @Override
    public List<Works> galleryWorks(String info) {
        return worksDao.galleryWorks(info);
    }

    @Override
    public List<Works> indexWorks() {
        return worksDao.indexWorks();
    }
}
