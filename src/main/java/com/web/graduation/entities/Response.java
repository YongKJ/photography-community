package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Setter
@Getter
@ToString
@Repository
public class Response {
    private int id;
    private String response;
    private String res_time;
    private String user1;
    private String user2;
    private int user1_id;
    private int user2_id;
    private int comment_id;
    private int artid;
}
