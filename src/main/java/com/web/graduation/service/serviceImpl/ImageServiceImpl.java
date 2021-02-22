package com.web.graduation.service.serviceImpl;

import com.web.graduation.dao.ImageDao;
import com.web.graduation.entities.Image;
import com.web.graduation.service.ImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {

    @Resource
    private ImageDao imageDao;

    @Override
    public int addImage(Image image) {
        return imageDao.addImage(image);
    }

    @Override
    public int delUserImage(int works_id) {
        return imageDao.delUserImage(works_id);
    }

    @Override
    public List<Image> worksImages(int work_id) {
        return imageDao.worksImages(work_id);
    }
}
