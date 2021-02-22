package com.web.graduation.service;

import com.web.graduation.entities.Image;

import java.util.List;

public interface ImageService {

//    插入图片
    int addImage(Image image);
//    删除某个标题的所有图片
    int delUserImage(int works_id);
//    查询某个作品的所有图片
    List<Image> worksImages(int work_id);
}



