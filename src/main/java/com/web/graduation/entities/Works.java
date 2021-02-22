package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

import java.util.List;

@Setter
@Getter
@ToString
@Repository
public class Works {
    private int id;
    private int flag;
    private String works_title;
    private String classify;
    private String works_describe;
    private String tag;
    private String date_time;
    private int glance;
    private int praise;
    private int user_id;
    private String username;
    private String photo;
    private List<Image> imageList;
}
