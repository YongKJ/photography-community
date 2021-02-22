package com.web.graduation.controller;

import com.web.graduation.component.RedisDeal;
import com.web.graduation.component.VerCodeGenerateUtil;
import com.web.graduation.exception.ImageException;
import com.web.graduation.util.MD5Util;
import com.web.graduation.component.EmailResponse;
import com.web.graduation.entities.User;
import com.web.graduation.exception.MyMvcException;
import com.web.graduation.service.UserService;
import com.web.graduation.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Controller
@ResponseBody
@RequestMapping(value = "/user", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class UserInfoController {

    @Resource
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    EmailResponse emailResponse;
    @Autowired
    MD5Util md5Util;
    @Autowired
    UserService userService;
    @Autowired
    User user;
    @Autowired
    User register;
    @Autowired
    RedisDeal redisDeal;
    @Autowired
    VerCodeGenerateUtil verCodeGenerateUtil;
    @Value("${upload.path}")
    private String path;

    @GetMapping(value = "/token")
    public Object isToken() {
        Map<String,Object> map = new HashMap<>();
        map.put("flag",true);
        return map;
    }

    @RequestMapping(value = "/sendmail")
    public Object sendMail(@RequestBody Map param,HttpSession session) throws MyMvcException {
        String email = (String)param.get("email");
        String code = emailResponse.sendEmail(email);
        session.setAttribute("mail",email);
        session.setAttribute("code",code);
        Map<String,Object> map = new HashMap<>();
        map.put("head",true);
        map.put("message","验证码发送成功");
        return map;
    }

    @RequestMapping(value = "/register")
    public Object addUsers(@RequestBody Map param, HttpSession session) {
        Map<String,Object> map = new HashMap<>();
        String email = (String)param.get("email");
        String code = (String)param.get("code");
        String password = md5Util.generate((String)param.get("password"));
        String mail = (String)session.getAttribute("mail");
        String encryption = (String)session.getAttribute("code");
        boolean flag = md5Util.verify(code, encryption);
        user = userService.checkUserExit(email);
        if (user != null) {
            map.put("subject",0);
            map.put("message","邮箱号已注册！");
        }else if (mail != null && encryption != null && email.equals(mail) && flag) {
            register.setUsername("蜡笔小新");
            register.setBirthday("1997-03-14");
            register.setSex("男");
            register.setTelephone("无");
            register.setQq("无");
            register.setPersignature("无");
            register.setPerdescription("无");
            register.setEmail(email);
            register.setPassword(password);
            register.setImage("static/image/u=590965914,302108607&fm=11&gp=0.jpg");
            int result = userService.addUser(register);
            if (result == 1) {
                map.put("subject",true);
                map.put("message","注册成功！");
            }else {
                map.put("subject",false);
                map.put("message","系统出错，请稍后再试！");
            }
        }else {
            map.put("subject",1);
            map.put("message","验证码错误");
        }
        return map;
    }

    @RequestMapping(value = "/change")
    public Object updatePwd(@RequestBody Map param, HttpSession session) {
        Map<String,Object> map = new HashMap<>();
        String email = (String)param.get("email");
        String code = (String)param.get("code");
        String password = md5Util.generate((String)param.get("password"));
        String mail = (String)session.getAttribute("mail");
        String encryption = (String)session.getAttribute("code");
        boolean flag = md5Util.verify(code, encryption);
        if (mail != null && encryption != null && email.equals(mail) && flag) {
            int result = userService.updatePwd(email, password);
            if (result == 1) {
                map.put("subject", 1);
                map.put("message","修改密码成功，请重新登录");
            }else {
                map.put("subject", 0);
                map.put("message","修改密码失败，请稍后再试");
            }
        }else {
            map.put("subject",false);
            map.put("message","验证码错误");
        }
        return map;
    }

    @RequestMapping(value = "/login")
    public Object userLogin(@RequestBody Map param) {
        Map<String,Object> map = new HashMap<>();
        String email = (String)param.get("email");
        User user = userService.userLogin(email);
        boolean flag;
        if (user != null) {
            flag = md5Util.verify((String)param.get("password"), user.getPassword());
        }else {
            flag = false;
        }
        if (flag) {
            String userId = String.valueOf(user.getId());
            String token = TokenUtil.sign(userId);
            map.put("head",true);
            map.put("message","登录成功");
            map.put("token",token);
            map.put("id",userId);
        }else {
            map.put("head",false);
            map.put("message","用户名或密码错误");
        }
        return map;
    }


    @RequestMapping(value = "/upload")
    public Object uploadImage(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws MyMvcException, FileNotFoundException {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        String code = verCodeGenerateUtil.generateVerCode();
        String fileName = userId + code + file.getOriginalFilename();
        if(fileName.indexOf("\\") != -1){
            fileName = fileName.substring(fileName.lastIndexOf("\\"));
        }
        String filePath = path + "/static/image/";
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = null;
        try {
            User user = userService.userImage(Integer.valueOf(userId));
            if (!user.getImage().equals("static/image/u=590965914,302108607&fm=11&gp=0.jpg")) {
                String delPath = path + "/" + user.getImage();
                File file1 = new File(delPath);
                file1.delete();
            }
            out = new FileOutputStream(filePath+fileName);
            out.write(file.getBytes());
            out.flush();
            out.close();
            String imagePath = "static/image/" + fileName;
            User userimage = new User();
            userimage.setId(Integer.valueOf(userId));
            userimage.setImage(imagePath);
            userimage.setFlag(false);
            userService.userNewInfo(userimage);
            redisDeal.deleteRedis("");
            Map<String,Object> map = new HashMap<>();
            map.put("head", true);
            map.put("username",user.getUsername());
            map.put("message",imagePath);
            return map;
        } catch (Exception e) {
            throw new ImageException("上传头像失败");
        }
    }

    @RequestMapping(value = "/updating")
    public Object updateUsers(HttpServletRequest request, @RequestBody Map param) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        Map<String,Object> map = new HashMap<>();
        String username = (String) param.get("username");
        String birthday = (String) param.get("birthday");
        String sex = (String) param.get("sex");
        String telephone = (String) param.get("telephone");
        String email = (String) param.get("email");
        String qq = (String) param.get("qq");
        String persignature = (String) param.get("personal_signature");
        String perdescription = (String) param.get("personal_description");
        User user = new User();
        user.setId(Integer.valueOf(userId));
        user.setUsername(username);
        user.setBirthday(birthday);
        user.setSex(sex);
        user.setTelephone(telephone);
        user.setEmail(email);
        user.setQq(qq);
        user.setPersignature(persignature);
        user.setPerdescription(perdescription);
        user.setFlag(true);
        User result = userService.userNewInfo(user);
        User usera = userService.userImage(Integer.valueOf(userId));
        if (result != null) {
            map.put("subject",true);
            map.put("image",usera.getImage());
            map.put("username",usera.getUsername());
            map.put("message","个人信息已更新");
            //清除缓存
            Set<String> keys = stringRedisTemplate.keys("*");
            Iterator<String> it1 = keys.iterator();
            while (it1.hasNext()) {
                stringRedisTemplate.delete(it1.next());
            }
        }else {
            map.put("subject",false);
            map.put("message","操作失败，请稍后再试！");
        }
        return map;
    }

    @RequestMapping(value = "/getting")
    public Object getUserInfo(@RequestBody Map param) {
        String userId = (String)param.get("userId");
        System.out.println(userId);
        user = userService.userInfo(Integer.valueOf(userId));
        Map<String, User> map = new HashMap<>();
        map.put("user",user);
        return map;
    }

    @GetMapping(value = "/person")
    public Object getPersonInfo(HttpServletRequest request) {
        String userId = TokenUtil.getUserId(request.getHeader("Access-Token"));
        User user = userService.userImage(Integer.valueOf(userId));
        Map<String, Object> map = new HashMap<>();
        map.put("username",user.getUsername());
        map.put("id",user.getId());
        map.put("image",user.getImage());
        return map;
    }
}
