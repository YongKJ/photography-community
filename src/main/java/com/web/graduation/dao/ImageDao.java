package com.web.graduation.dao;

import com.web.graduation.entities.Image;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
图片信息管理
*/
@Repository
@Mapper
public interface ImageDao {
    int addImage(Image image);
    int delUserImage(int works_id);
    List<Image> worksImages(int work_id);
}
