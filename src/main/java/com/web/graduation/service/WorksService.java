package com.web.graduation.service;

import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Works;

import java.util.List;

public interface WorksService {
    //    插入作品信息
    int addWorks(Works works);
    //    找到当前插入的works的id
    Works selectId(int userId);
    //    删除作品
    int deleteWorks(int userId,int works_id);
    //    浏览记录
    Works addGlance(int works_id);
    //    查询当前作品包含图片在内的所有信息
    Works selectWorks(int works_id);
    //    查询当前用户的作品信息
    List<Works> worksList(int user_id, String info);

    int isCollect(int user_id, int work_id, String date_time);
    int delCollect(int user_id, int work_id);
    ArtCollection workCollList(int user_id, int work_id);
    List<Works> worksCollList(int user_id);

    List<Works> galleryWorks(String info);

    List<Works> indexWorks();
}
