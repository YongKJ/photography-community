package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Setter
@Getter
@ToString
@Repository
public class Article {
    private int id;
    private String image;
    private String title;
    private String tag;
    private String content;
    private String date_time;
    private int glance;
    private int coll;
    private int users_id;
    private String username;
}
