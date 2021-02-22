package com.web.graduation.service;

import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Article;

import java.util.List;


public interface ArticleService {

    int addArticle(Article article);
    List<Article> articleList(int user_id,String info);
    Article addGlance(int article_id);
    int addColl(int article_id);
    int reduceColl(int article_id);
    Article selectArticle(int article_id);
    List<Article> allArticles();
    List<Article> searchArticles(String info);
    List<Article> hotArticles();
    List<Article> isCollect(int user_id, int art_id, String date_time);
    List<Article> delCollect(int user_id, int art_id);
    ArtCollection artCollList(int user_id, int art_id);
    List<Article> userCollList(int user_id);
    int delArticle(int user_id, int art_id);
}
