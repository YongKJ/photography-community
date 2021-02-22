package com.web.graduation.component;

import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.Set;

@Component
public class RedisDeal {
    @Resource
    StringRedisTemplate stringRedisTemplate;

    public void deleteRedis(String str) {
        String key = str + "*";
        Set<String> keys = stringRedisTemplate.keys(key);
        Iterator<String> it1 = keys.iterator();
        while (it1.hasNext()) {
            stringRedisTemplate.delete(it1.next());
        }
    }
}
