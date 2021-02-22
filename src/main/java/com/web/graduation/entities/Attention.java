package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Setter
@Getter
@ToString
@Repository
public class Attention {
    private int id;
    private int top;
    private int next;
    private String date_time;
    private String username;
    private String image;
}
