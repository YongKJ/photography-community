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
public class Comment {
    private int id;
    private String content;
    private String date_time;
    private int userid;
    private int artid;
    private String username;
    private String image;
    private String photo;
    private List<Response> responseList;
}
