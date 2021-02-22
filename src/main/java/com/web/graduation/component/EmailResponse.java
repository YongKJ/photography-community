package com.web.graduation.component;

import com.web.graduation.util.MD5Util;
import com.web.graduation.exception.EmailException;
import com.web.graduation.exception.MyMvcException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

@Component
public class EmailResponse {
    //    随机生成的六位数字验证码
    private String code;
    //    加密后的验证码
    private String encryption;

    @Autowired
    VerCodeGenerateUtil verCodeGenerateUtil;
    @Autowired
    MD5Util md5Util;

    @Autowired
    JavaMailSenderImpl mailSender;
    @Value("${spring.mail.username}")
    private String sender;

    public String sendEmail(String email) throws MyMvcException {
        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            code = verCodeGenerateUtil.generateVerCode();
            mailMessage.setSubject("行摄网邮箱验证码");
            mailMessage.setText("尊敬的用户,您好:\n"
                    + "\n本次请求的邮件验证码为:" + code + ",本验证码5分钟内有效，请及时输入。（请勿泄露此验证码）\n"
                    + "\n如非本人操作，请忽略该邮件。");
            mailMessage.setTo(email);
            mailMessage.setFrom(sender);
            mailSender.send(mailMessage);
            encryption = md5Util.generate(code);
        } catch (Exception e){
            throw new EmailException("邮箱地址无效");
        }
        return encryption;
    }

    public boolean validationEmail(String code1, String sessionCode) {
        return md5Util.verify(code1, sessionCode);
    }

}
