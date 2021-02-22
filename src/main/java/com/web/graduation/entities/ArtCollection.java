package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Setter
@Getter
@ToString
@Repository
public class ArtCollection {
    private int user_id;
    private int art_id;
    private String date_time;
    private int flag;
}
