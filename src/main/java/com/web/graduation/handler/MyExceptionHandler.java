package com.web.graduation.handler;

import com.web.graduation.exception.EmailException;
import com.web.graduation.exception.ImageException;
import com.web.graduation.exception.UserIdException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@ResponseBody
@ControllerAdvice
public class MyExceptionHandler {
    @ExceptionHandler(EmailException.class)
    public Object doEmailException(Exception e) {
        Map<String,Object> map = new HashMap<>();
        map.put("head",false);
        map.put("message","邮箱地址无效");
        return map;
    }
    @ExceptionHandler(ImageException.class)
    public Object doImageException(Exception e) {
        Map<String,Object> map = new HashMap<>();
        map.put("head",false);
        map.put("message","上传头像失败");
        return map;
    }
    @ExceptionHandler(UserIdException.class)
    public Object doUserIdException(Exception e) {
        Map<String,Object> map = new HashMap<>();
        map.put("head",false);
        map.put("message","系统出错，请重新登录！");
        return map;
    }

//    public ModelAndView doNameException(Exception exception){
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("msg","姓名错误");
//        mv.addObject("exception",exception);
//        mv.setViewName("result");
//        return mv;
//    }
}
