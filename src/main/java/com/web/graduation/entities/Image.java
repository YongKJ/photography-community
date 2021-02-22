package com.web.graduation.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

@Setter
@Getter
@ToString
@Repository
public class Image {
    private int id;
    private String image;
    private int works_id;
}
