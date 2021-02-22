package com.web.graduation.service.serviceImpl;

import com.web.graduation.component.RedisDeal;
import com.web.graduation.dao.ArticleDao;
import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Article;
import com.web.graduation.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@CacheConfig(cacheNames = "Article")
public class ArticleServiceImpl implements ArticleService {
    @Resource
    ArticleDao articleDao;

    @Autowired
    RedisDeal redisDeal;

    @Override
    public int addArticle(Article article) {
        return articleDao.addArticle(article);
    }

    @Override
    public List<Article> articleList(int user_id, String info) {
        return articleDao.articleList(user_id,info);
    }

    @Override
    @CachePut(value = "article",key = "#article_id")
    public Article addGlance(int article_id) {
        redisDeal.deleteRedis("art_collection::");
        articleDao.addGlance(article_id);
        return articleDao.selectArticle(article_id);
    }

    @Override
    public int addColl(int article_id) {
        return articleDao.addColl(article_id);
    }

    @Override
    public int reduceColl(int article_id) {
        return articleDao.reduceColl(article_id);
    }

    @Override
    @Cacheable(value = "article" , key = "#article_id")
    public Article selectArticle(int article_id) {
        return articleDao.selectArticle(article_id);
    }

    @Override
    public List<Article> allArticles() {
        return articleDao.allArticles();
    }

    @Override
    public List<Article> searchArticles(String info) {
        return articleDao.searchArticles(info);
    }

    @Override
    public List<Article> hotArticles() {
        return articleDao.hotArticles();
    }

    @Override
    @CachePut(value = "art_collection",key = "#user_id")
    public List<Article> isCollect(int user_id, int art_id, String date_time) {
        articleDao.isCollect(user_id, art_id, date_time);
        return articleDao.userCollList(user_id);
    }

    @Override
    @CachePut(value = "art_collection",key = "#user_id")
    public List<Article> delCollect(int user_id, int art_id) {
        articleDao.delCollect(user_id, art_id);
        return articleDao.userCollList(user_id);
    }

    @Override
    public ArtCollection artCollList(int user_id, int art_id) {
        return articleDao.artCollList(user_id, art_id);
    }

    @Override
    @Cacheable(value = "art_collection" , key = "#user_id")
    public List<Article> userCollList(int user_id) {
        return articleDao.userCollList(user_id);
    }

    @Override
    public int delArticle(int user_id, int art_id) {
        return articleDao.delArticle(user_id, art_id);
    }

}
