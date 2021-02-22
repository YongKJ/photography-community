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
public class User {
    private int id;
    private String username;
    private String password;
    private String birthday;
    private String sex;
    private String telephone;
    private String email;
    private String qq;
    private String image;
    private String persignature;
    private String perdescription;
    boolean flag;
    private List<Works> worksList;
}
